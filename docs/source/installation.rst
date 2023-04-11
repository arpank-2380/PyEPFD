.. _installation:

============
Installation
============

**PyEPFD** uses the **mpi4py** package for parallelization. An existing MPI implementation (e.g. **MPICH** or **OpenMPI**) is required to install **mpi4py** and **PyEPFD**. Many supercomputers provide modules for pre-compiled MPI implementations. To install MPI manually (taking **MPICH** as example), execute the following command on Linux

.. code:: bash

   $ sudo apt-get install mpich libmpich-dev

or the following command on Mac

.. code:: bash

   $ brew install mpich

It is recommended to install **PyEPFD** using **pip**. First, clone the git repository into a local directory

.. code:: bash

   $ git clone https://github.com/arpank-2380/PyEPFD.git

Then, execute **pip** in the folder containing **setup.py**

.. code:: bash

   $ pip install .

OR

.. code:: bash

   $ pip3 install .

**PyEPFD** depends on the following packages, which will be installed automatically if installed through **pip**

   - ``numpy``
   - ``scipy``
   - ``mpi4py``

If using **pip** is not possible, one can manually install the above dependencies, and then go to the directory where env.sh file is located and use the following command,

.. code:: bash

   $ source env.sh

This would create PyEPFD environment for that terminal session. You can also put the following lines in your **.bashrc** so that the environment is always available.

.. code:: bash

   source /path/to/PyEPFD/env.sh

Hope you will find PyEPFD helpful for your research!

