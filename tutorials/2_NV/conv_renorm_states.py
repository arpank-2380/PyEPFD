from pyepfd.epfd import mc_convergence
import matplotlib.pyplot as plt
from matplotlib.cm import get_cmap
import numpy as np

plt.rcParams['font.size'] = 12
fig_name='excited_DDH_nv216_osrap_300K'
colors = get_cmap('tab10').colors
e_scale = 2.0

label_loc = [[(90,-108),(90,120),(90,0)],
             [(90, -100), (90, 80)]]


class tddft_osrap_conv:
      def __init__(self,path): 
          self.renorm = \
              mc_convergence(file_path=path, algo='osrap')
          self.ndata = len(self.renorm.avg[:,0])
          self.nstates = np.shape(self.renorm.avg)[1]
          if self.nstates == 3:
             self.states = ['1E(low)','1E(high)','1A1']
             self.labels = [r'$^{1}E_\mathrm{low}$', 
                            r'$^{1}E_\mathrm{high}$', 
                            r'$^{1}A_{1}$'] 
          elif self.nstates == 2:
             self.states = ['3E(low)','3E(high)']  
             self.labels = [r'$^{3}E_\mathrm{low}$', 
                            r'$^{3}E_\mathrm{high}$']

singlet = tddft_osrap_conv("singlet_renorm.dat")
triplet = tddft_osrap_conv("triplet_renorm.dat")
all_states = [singlet, triplet]

#Printing converged values
outfile = open('conv_renorm_many_body.out','w+')
outfile.write("#Converged Mean renorm. values after %d steps\n"%singlet.ndata)
outfile.write("#-------------------------------------------------------------------\n")
outfile.write("#State    Mean_Renorm(meV)   %3.1f*SD_Mean(meV)\n"%e_scale)
outfile.write("#-------------------------------------------------------------------\n")
for state in all_states:
   for istate in range(state.nstates):
       outfile.write(" %8s  %12.4f      %12.4f\n"
   	%(state.states[istate], state.renorm.avg[-1,istate], 
          state.renorm.sd_mean[-1,istate]*e_scale))
outfile.close()

fig, axs = plt.subplots(1,2,figsize=(6.6,3.3))

for k in range(len(all_states)):
    axs[k].set_xlabel("Number of samples")
    axs[k].set_ylabel("Renormalization (meV)")
    for j in range(all_states[k].nstates):
        axs[k].plot([i+1 for i in range(all_states[k].ndata)], 
	  all_states[k].renorm.avg[:,j], label = all_states[k].labels[j], 
          color = colors[j]) 
        axs[k].fill_between([i+1 for i in range(all_states[k].ndata)], 
    	  all_states[k].renorm.avg[:,j] + all_states[k].renorm.sd_mean[:,j]*e_scale,
          all_states[k].renorm.avg[:,j] - all_states[k].renorm.sd_mean[:,j]*e_scale,
          alpha = 0.3, color = colors[j])
        #axs[k].set_xlim(0,200)
        #axs[k].set_ylim(-150,100)
        #axs[k].legend()   
        axs[k].text(label_loc[k][j][0], label_loc[k][j][1],
                        all_states[k].labels[j], color=colors[j],
                        ha='center', va='center')

axs[0].set_title(r'Singlet excited states')
axs[1].set_title(r'Triplet excited states')
fig.set_size_inches(6.6,3.3)
plt.subplots_adjust(wspace=0.5)
#fig.savefig(fig_name+'.png',dpi=600,bbox_inches = 'tight', pad_inches = 0.1)

plt.show()

