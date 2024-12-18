# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

from .coord_util \
       import xyz, qbox, ionic_mover, write_nmode
from .anharm import anharm_measure
from .elph_classes import *
from .overlap import *
from .epfd import *
from .pyepfd_io import *
from .ipi_file_read import *
from .xyz2nmode import *



__version__ = "1.1"

def header():
    """Prints welcome header """
    import datetime
    from mpi4py import MPI
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()
    if rank == 0:
       print("                                                 ")
       print("          ███████████                            ")  
       print("         ░░███░░░░░███                           ")
       print("          ░███    ░███ █████ ████                ")
       print("          ░██████████ ░░███ ░███                 ")
       print("          ░███░░░░░░   ░███ ░███                 ")
       print("          ░███         ░███ ░███                 ")
       print("          █████        ░░███████                 ")
       print("         ░░░░░          ░░░░░███                 ")
       print("                        ███ ░███                 ")
       print("                       ░░██████                  ")
       print("                        ░░░░░░                   ")
       print(" ██████████ ███████████  ███████████ ██████████  ")
       print("░░███░░░░░█░░███░░░░░███░░███░░░░░░█░░███░░░░███ ")
       print(" ░███  █ ░  ░███    ░███ ░███   █ ░  ░███   ░░███")
       print(" ░██████    ░██████████  ░███████    ░███    ░███")
       print(" ░███░░█    ░███░░░░░░   ░███░░░█    ░███    ░███")
       print(" ░███ ░   █ ░███         ░███  ░     ░███    ███ ")
       print(" ██████████ █████        █████       ██████████  ")
       print("░░░░░░░░░░ ░░░░░        ░░░░░       ░░░░░░░░░░   ")

       print("PyEPFD version     : ", __version__)
       print("Author             : Arpan Kundu")
       print("Author Email       : arpan.kundu@gmail.com")
       print("Today              : ", datetime.datetime.today())
       print("*************************************************")
       print("                   CITATIONS                     ")
       print("=================================================")
       print("Please cite the following 3 references:          ")
       print("(1) A. Kundu et al, Phys. Rev. Mater (2021), 5,  ")
       print("L070801, ")
       print("(2) A. Kundu and G Galli, ")
       print("J. Chem. Theory. Comput. (2023), 19, 4011")
       print("(3) https://pyepfd.readthedocs.io/en/latest/")
       print("*************************************************")

header()
