module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2

cd build 

../configure \
CC=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/shmemcc \
CXX=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2/bin/shmemcxx \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 --enable-ncclomb \
--with-nccl=${NCCL_HOME} --prefix="/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-7.5.1-shmem-nccl-install-path"
 
make

make install
