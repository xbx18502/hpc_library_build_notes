ビルド

module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2
 
./configure \
CC=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/mpicc \
CXX=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/mpicxx \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 --enable-ncclomb \
--with-nccl=${NCCL_HOME} --prefix=適当なインストール先ディレクトリ
 
module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2

./configure \
CC=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/mpicc \
CXX=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/mpicxx \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 --enable-ncclomb \
--with-nccl=${NCCL_HOME} --prefix="/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-install-path"
 
make

make install
 
実行
#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=1
#PJM -L elapse=10:00
#PJM -j
#PJM -S
 
module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2
mpirun -np 2 --map-by ppr:1:numa ../bin/libexec/osu-micro-benchmarks/xccl/pt2pt/osu_xccl_bw D D
 
 
結果
#Using NCCL
#Using NCCL
# Send Buffer on DEVICE (D) and Receive Buffer on DEVICE (D)
# Size      Bandwidth (MB/s)
1                       0.17
2                       0.33
4                       0.67
8                       1.34
16                      2.67
32                      5.34
64                     10.69
128                    21.35
256                    42.52
512                    85.37
1024                  170.88
2048                  339.52
4096                  668.16
8192                 1257.83
16384                2489.42
32768                4883.06
65536                8232.85
131072              13586.36
262144              21256.93
524288              37431.33
1048576             55555.30
2097152             76429.50
4194304             93114.67