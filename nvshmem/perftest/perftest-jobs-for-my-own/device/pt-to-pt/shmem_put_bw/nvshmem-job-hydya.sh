#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=00:02:00
#PJM -j
#PJM -S

export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"
export NVSHMEM_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem"
export MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5"
export HYDRA_HOME="$NVSHMEM_HOME"
# NCCL settings
export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export NVSHMEM_PERFTEST_INSTALL="/home/pj24001791/ku40000464/shmem/nvshmem-copy/perftest/build/"

$HYDRA_HOME/bin/nvshmrun -n 2 \
$NVSHMEM_PERFTEST_INSTALL/device/pt-to-pt/shmem_put_bw

