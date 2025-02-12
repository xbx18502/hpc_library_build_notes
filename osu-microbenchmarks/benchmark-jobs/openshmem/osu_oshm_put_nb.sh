#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=10:00
#PJM -j
#PJM -S

module purge
module load cuda/12.2.2 nccl/2.22.3 gcc/8  ompi-cuda/4.1.6-12.2.2



run1="mpirun -np 2 --map-by ppr:1:numa \
/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-shmem-nccl-install-path/libexec/osu-micro-benchmarks/openshmem/osu_oshm_put_nb heap "

run2="mpirun -np 2 --map-by ppr:1:node \
/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-shmem-nccl-install-path/libexec/osu-micro-benchmarks/openshmem/osu_oshm_put_nb heap "

run3="mpirun -np 2 --map-by ppr:1:node \
/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-shmem-nccl-install-path/libexec/osu-micro-benchmarks/openshmem/osu_oshm_put_mr_nb heap "

run4="mpirun -np 2 --map-by ppr:1:node \
/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-7.5.1-shmem-nccl-install-path/libexec/osu-micro-benchmarks/openshmem/osu_oshm_put_bw heap "

for i in {1..10}
do
    echo "iteration $i"
    eval $run4
done