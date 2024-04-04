# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
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



__version__ = "1.0"

def header():
    """Prints welcome header """
    import datetime
    from mpi4py import MPI
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()
    if rank == 0:
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

header()
