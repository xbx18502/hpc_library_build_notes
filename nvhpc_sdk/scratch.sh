Installing NVIDIA HPC SDK version 24.9 into /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path

Making symbolic link in /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64

generating environment modules for NV HPC SDK 24.9 ... done.
Installation complete.
Please run add_network_host to create host specific localrc files:

   /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/bin/localrc.$host

on all other hosts you wish to run NVIDIA HPC SDK compilers.

For 64-bit NVIDIA HPC SDK compilers on 64-bit Linux systems, do the following:
    /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/bin/add_network_host

HPC SDK successfully installed into /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path

If you use the Environment Modules package, that is, the module load
command, the NVIDIA HPC SDK includes a script to set up the
appropriate module files.

% module load /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/modulefiles/nvhpc/24.9
% module load nvhpc/24.9

Alternatively, the shell environment may be initialized to use the HPC SDK.

In csh, use these commands:

% set path = (/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/bin $path)
% setenv MANPATH /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/man:"$MANPATH"

To use MPI, also set:

% set path = (/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/mpi/bin $path)

In bash, sh, or ksh, use these commands:

$ export PATH=/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/bin:$PATH
$ export MANPATH=/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/compilers/man:$MANPATH

To use MPI, also set:

$ export PATH=/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/mpi/bin:$PATH

Please check https://developer.nvidia.com for documentation,
use of NVIDIA HPC SDK software, and other questions.