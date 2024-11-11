#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=10:00
#PJM -j
#PJM -S
 
# module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2

module load cuda/12.2.2
module load nccl/2.22.3 
module load nvidia/23.9
module load nvompi/23.9


mpirun -np 2 --map-by ppr:1:numa \
/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-2-install-path/libexec/osu-micro-benchmarks/xccl/pt2pt/osu_xccl_bw D D
