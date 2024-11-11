#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=00:05:00
#PJM -j
#PJM -S

module purge
module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2

export OSU_MICROBENCHMARKS_XCCL_INSTALL="/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-install-path"

run="\
mpirun -np 2 --map-by ppr:1:node \
${OSU_MICROBENCHMARKS_XCCL_INSTALL}/libexec/osu-micro-benchmarks/xccl/pt2pt/osu_xccl_latency D D \
"

echo ${run}
eval ${run}
