build:

module load cuda/12.2.2
module load nccl/2.22.3 
module load nvidia/23.9
module load nvompi/23.9

# export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2" 
# export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"
echo $CUDA_HOME
echo $NCCL_HOME

./configure \
CC=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/mpi/bin/mpicc \
CXX=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/mpi/bin/mpicxx \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 --enable-ncclomb \
--with-nccl=${NCCL_HOME} --prefix=/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-2-install-path

make
make install