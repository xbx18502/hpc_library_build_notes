#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=00:02:00
#PJM -j
#PJM -S

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

export NVSHMEM_PERFTEST_INSTALL="${HOME}/nvhpc_24.9/nvshmem_src_3.0.6-4/perftest/perftest_install"

task_hydra="$HYDRA_HOME/bin/nvshmrun -n 2 \
$NVSHMEM_PERFTEST_INSTALL/device/pt-to-pt/shmem_put_bw"

task_mpi="${MPI_HOME}/bin/mpirun -n 2 \
-x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
$NVSHMEM_PERFTEST_INSTALL/device/pt-to-pt/shmem_put_bw"

for i in {1..10}
do
    eval $task_mpi
done
