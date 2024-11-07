#!/bin/bash

# environment variables for NV HPC SDK 24.9
module purge
module load /home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/modulefiles/nvhpc/24.9
# environment variables for compile perftest of nvshmem
# ------------------------------------------------------
export CUDA_HOME="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/cuda/12.6"
export NVSHMEM_HOME="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/nvshmem"
export MPI_HOME="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/mpi"

export HYDRA_HOME="$NVSHMEM_HOME"
# NCCL settings
export NCCL_HOME="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export CMAKE_PREFIX_PATH="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/\
Linux_x86_64/24.9/comm_libs/nvshmem"

cmake .. \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_INSTALL_PREFIX="${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/comm_libs/nvshmem/perftest/perftest-install"

