#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=00:05:00
#PJM -j
#PJM -S

export MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5"

export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"

export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$LD_LIBRARY_PATH"

export OSU_MICROBENCHMARKS_XCCL_INSTALL="/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-install-path"
export OSU_MICROBENCHMARKS_MPI_INSTALL="/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-install-path"


${MPI_HOME}/bin/mpirun -np 2  \
${OSU_MICROBENCHMARKS_MPI_INSTALL}/libexec/osu-micro-benchmarks/mpi/one-sided/osu_put_latency
