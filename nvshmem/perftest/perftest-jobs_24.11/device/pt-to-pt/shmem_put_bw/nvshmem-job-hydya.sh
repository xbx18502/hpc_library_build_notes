#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=00:02:00
#PJM -j
#PJM -S

export CUDA_HOME="/home/pj24001791/ku40000464/nvhpc_24.11/nvhpc_24.11_install/Linux_x86_64/24.11/cuda/12.6"
export NVSHMEM_HOME="/home/pj24001791/ku40000464/nvhpc_24.11/nvhpc_24.11_install/Linux_x86_64/24.11/comm_libs/nvshmem"
export MPI_HOME="/home/pj24001791/ku40000464/nvhpc_24.11/nvhpc_24.11_install/Linux_x86_64/24.11/comm_libs/12.6/hpcx/hpcx-2.20/ompi"
export HYDRA_HOME="$NVSHMEM_HOME"
# NCCL settings
export NCCL_HOME="/home/pj24001791/ku40000464/nvhpc_24.11/nvhpc_24.11_install/Linux_x86_64/24.11/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export NVSHMEM_PERFTEST_INSTALL="/home/pj24001791/ku40000464/nvhpc_24.11/nvhpc_24.11_install/Linux_x86_64/24.11/comm_libs/nvshmem/perftest/perftest_install"

$HYDRA_HOME/bin/nvshmrun -f ${PJM_O_NODEINF} -launcher \
ssh -launcher-exec /bin/pjrsh -n 2 \
-ppn 1 \
$NVSHMEM_PERFTEST_INSTALL/device/pt-to-pt/shmem_put_bw

