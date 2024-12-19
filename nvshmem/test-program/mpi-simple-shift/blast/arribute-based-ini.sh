#!/bin/bash
#SBATCH --partition=fire,photon
#SBATCH --time=00:10:00




###############################################################
# In csh, use these commands:

export PATH=/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/bin:$PATH
# set path = (/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/bin $path)
# set path = /home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/bin:$path
# setenv MANPATH /home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/man:"$MANPATH"

# To use MPI, also set:

# set path = /home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/comm_libs/mpi/bin:$path
export PATH=/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/comm_libs/mpi/bin:$PATH
# In bash, sh, or ksh, use these commands:

export PATH=/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/bin:$PATH
export MANPATH=/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/compilers/man:$MANPATH

# To use MPI, also set:

export PATH=/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11/comm_libs/mpi/bin:$PATH

###############################################################
# module purge
# module load /home/xiao/nvhpc_24.11/nvhpc_install_path/modulefiles/nvhpc/24.11

export NVCC_GENCODE="arch=compute_80,code=sm_80"

export NVHPC_SDK_HOME="/home/xiao/nvhpc_24.11/nvhpc_install_path/Linux_x86_64/24.11"

export NVSHMEM_HOME="${NVHPC_SDK_HOME}/comm_libs/12.6/nvshmem"

export HYDRA_HOME="$NVSHMEM_HOME"

export CUDA_HOME="${NVHPC_SDK_HOME}/cuda/12.6"

export MPI_HOME="${NVHPC_SDK_HOME}/comm_libs/12.6/hpcx/hpcx-2.20/ompi"
# NCCL settings
export NCCL_HOME="${NVHPC_SDK_HOME}/comm_libs/nccl"

# export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$NCCL_HOME/lib:$LD_LIBRARY_PATH"
compile_static=" \
nvcc -rdc=true -ccbin g++ -gencode=$NVCC_GENCODE \
-I$NVSHMEM_HOME/include -I$MPI_HOME/include \
Attribute-Based-Initialization-Example.cu -o \
Attribute-Based-Initialization-Example.out -L$NVSHMEM_HOME/lib -L$MPI_HOME/lib \
-lmpi -lnvshmem -lnvidia-ml -lcuda -lcudart "



task_mpi=" \
mpirun -v --display-allocation --display-map   \
-np 2 --map-by ppr:2:node \
-x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
./Attribute-Based-Initialization-Example.out "

task_mpi_disable_hcoll=" \
mpirun -v --display-allocation --display-map -np 2 --map-by ppr:2:node \
    --mca coll ^hcoll \
    -x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
    -x CUDA_VISIBLE_DEVICES=0,1 \
    ./Attribute-Based-Initialization-Example.out"


task_mpi_disable_hcoll_explicit_gpu_cpu=" \
mpirun -v --display-allocation --display-map -np 2 --map-by ppr:2:node \
    --mca coll ^hcoll \
    -x CUDA_VISIBLE_DEVICES=0,1 \
    -x UCX_NET_DEVICES=mlx5_0:1 \
    --bind-to core \
    -x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
    ./Attribute-Based-Initialization-Example.out"

task3=" \
mpirun -v \
    --display-allocation --display-map -np 1 --map-by ppr:1:node \
     --mca coll ^hcoll \
    -x UCX_TLS=tcp,sm \
    -x CUDA_VISIBLE_DEVICES=0 \
    -x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
    ./Attribute-Based-Initialization-Example.out"
# echo ${task_mpi}

# eval ${task_mpi}

# eval ${task_mpi_disable_hcoll}

# eval ${task_mpi_disable_hcoll_explicit_gpu_cpu}

eval ${task3}
