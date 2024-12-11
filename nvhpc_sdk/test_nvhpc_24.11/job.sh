#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=00:10:00
#PJM -j
#PJM -S

module load nvidia/24.11 nvhpcx/24.11-cuda12
export NVSHMEM_BOOTSTRAP=MPI
mpirun -n 8 --map-by ppr:4:node  ./mpi-based-init