#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=00:02:00
#PJM -j
#PJM -S

module purge
module load nvidia/23.9 nvhpcx/23.9-cuda12

export NVCC_GENCODE="arch=compute_90,code=sm_90"

export NVSHMEM_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem"

export HYDRA_HOME="$NVSHMEM_HOME"

export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"

# NCCL settings
export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

# export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

compile_dynamic=" \
nvcc -rdc=true -ccbin g++ -gencode=$NVCC_GENCODE -I \
$NVSHMEM_HOME/include nvshmemHelloWorld.cu -o \
nvshmemHelloWorld.out -L $NVSHMEM_HOME/lib -lnvshmem_host -lnvshmem_device "

compile_static=" \
nvcc -rdc=true -ccbin g++ -gencode=$NVCC_GENCODE -I \
$NVSHMEM_HOME/include nvshmemHelloWorld.cu -o \
nvshmemHelloWorld.out -L $NVSHMEM_HOME/lib -lnvshmem -lnvidia-ml -lcuda -lcudart "

export OMPI_MCA_plm_rsh_agent="/usr/bin/pjrsh"

task_nvshmrun=" \
$HYDRA_HOME/bin/nvshmrun -n 8 -ppn 4 \
-hostfile ${PJM_O_NODEINF} --launcher ssh \
./nvshmemHelloWorld.out "

task_mpi=" \
mpirun -v --display-allocation --display-map -hostfile ${PJM_O_NODEINF} \
-np 4 --map-by ppr:4:node \
-x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
./nvshmemHelloWorld.out "

echo ${task_nvshmrun}

eval ${task_nvshmrun}
# ehco ${task_mpi}

# eval ${task_mpi}
