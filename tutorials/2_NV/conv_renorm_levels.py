from pyepfd.epfd import mc_convergence
import matplotlib.pyplot as plt
from matplotlib.cm import get_cmap
import numpy as np

plt.rcParams['font.size'] = 12

orb = [i for i in range(430,433)]
osrap_path = './'
static_path='TDDFT/'
e_scale = 2.0   # Error bar scale, 2 times of standard error
colors = get_cmap('tab10').colors
labels = [[r'$a_1$',r'$e_\mathrm{low}$', r'$e_\mathrm{high}$'],
          [r'$\overline{a}_1$',
           r'$\overline{e}_\mathrm{low}$',
           r'$\overline{e}_\mathrm{high}$']]
label_loc = [[(90,15),(90,-70),(90,150)],
             [(90, -50), (90, -135), (90,100)]]
norb = len(orb)

osrap = []; static = [] #; osap_energies=[]
for ispin in range(2):
    osrap.append(mc_convergence(\
    file_path=osrap_path +'is_' + str(ispin)+ '_orb-' + str(orb[0]) + '-' + str(orb[-1]) + '.dat',
    algo='osrap'))

    static_orbitals = np.genfromtxt(static_path + '/static_is_' + str(ispin) + '.dat')
    static.append([static_orbitals[orb[i]-1] for i in range(norb)])

static = np.array(static)
ndata = len(osrap[0].avg[:,0])

mc = np.zeros((2,norb,ndata),np.float64)
emc = np.zeros((2,norb,ndata),np.float64)

#osap = (osap_energies - static)*1000
for ispin in range(2):
    for iorb in range(norb):
        mc[ispin,iorb,:] = (osrap[ispin].avg[:,iorb] - static[ispin,iorb])*1000
        emc[ispin, iorb,:] = (e_scale*osrap[ispin].sd_mean[:,iorb])*1000

#Printing converged values
outfile = open('conv_renorm_levels.out','w+')
outfile.write("#Converged Mean renorm. values after %d steps\n"%ndata)
outfile.write("#-------------------------------------------------------------------\n")
outfile.write("#Ispin   Band-index  Mean_Renorm(meV)   %3.1f*SD_Mean(meV)\n"%e_scale)
outfile.write("#-------------------------------------------------------------------\n")
for ispin in range(2):
    for iorb in range(norb):
        outfile.write(" %2d     %5d      %12.4f      %12.4f\n"
        %(ispin, orb[iorb], mc[ispin,iorb,-1], emc[ispin, iorb,-1]))
outfile.close()

fig, axs = plt.subplots(1,2)
#fig = []; axs = []
for ispin in range(2):
    #tmpfig, tmpaxs = plt.subplots(num='ispin='+str(ispin))
    #fig.append(tmpfig); axs.append(tmpaxs)
    axs[ispin].set_xlabel("Number of samples")
    axs[ispin].set_ylabel("Renormalization (meV)")
    for iorb in range(norb):
        axs[ispin].plot([i+1 for i in range(ndata)], mc[ispin,iorb,:],
                        color=colors[iorb], label = labels[ispin][iorb])
        axs[ispin].fill_between([i+1 for i in range(ndata)],\
        mc[ispin,iorb,:] + emc[ispin,iorb,:], mc[ispin,iorb,:] - emc[ispin,iorb,:], alpha = 0.3, color=colors[iorb])
        #axs[ispin].axhline(osap[ispin,iorb],color=colors[iorb],linestyle='dashed')
        axs[ispin].text(label_loc[ispin][iorb][0], label_loc[ispin][iorb][1],
                        labels[ispin][iorb], color=colors[iorb],
                        ha='center', va='center')

        #axs[ispin].legend()        


#for ispin in range(2):
#    fig[ispin].savefig(fig_name+'_isp'+str(ispin)+'.png',
#               dpi=600,bbox_inches = 'tight', pad_inches = 0.1)
axs[0].set_title(r'$\alpha$-spin channel')
axs[1].set_title(r'$\beta$-spin channel')
fig.set_size_inches(6.6,3.3)
plt.subplots_adjust(wspace=0.5)
plt.show()
