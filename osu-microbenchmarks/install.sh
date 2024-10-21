



export MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5"
export NVSHMEM_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem"
export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"

export HYDRA_HOME="$NVSHMEM_HOME/bin"
# NCCL settings
export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/compilers/bin/:$PATH"
export PATH=$CUDA_HOME/bin:$PATH

export LD_LIBRARY_PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2/targets/x86_64-linux/lib/stubs:$LD_LIBRARY_PATH"

./configure CC=${MPI_HOME}/bin/mpicc CXX=${MPI_HOME}/bin/mpicxx \
--prefix=/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-install-path \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 --enable-ncclomb \
--with-nccl=${NCCL_HOME}


# ---------------------------------------------------------------

MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5" \
NVSHMEM_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem" \
CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2" \
HYDRA_HOME="$NVSHMEM_HOME/bin" \
NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl" \
LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH" \
LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH" \
PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/compilers/bin/:$PATH" \
bash -c '
./configure CC=${MPI_HOME}/bin/mpicc CXX=${MPI_HOME}/bin/mpicxx \
--prefix=/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-install-path \
--enable-cuda --with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/lib64 \
--enable-ncclomb --with-nccl=${NCCL_HOME} '

# -------------------------------------------------------------------------------------------------

MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5" \
PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/compilers/bin/:$PATH" \
bash -c '
./configure CC=${MPI_HOME}/bin/mpicc CXX=${MPI_HOME}/bin/mpicxx \
--prefix=/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-install-path '


# -------------------------------------------------------------------------------------------------
MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5" \
CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2" \
NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl" \
LD_LIBRARY_PATH="$CUDA_HOME/targets/x86_64-linux/lib/stubs:$CUDA_HOME/lib64:$MPI_HOME/lib:$NCCL_HOME/lib:$LD_LIBRARY_PATH" \
PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/compilers/bin/:$PATH" \
bash -c '
./configure --host=x86_64-linux-gnu\
CC=${MPI_HOME}/bin/mpicc \
CXX=${MPI_HOME}/bin/mpicxx \
CPPFLAGS="-I${MPI_HOME}/include" \
CFLAGS="-I${MPI_HOME}/include" \
CXXFLAGS="-I${MPI_HOME}/include" \
--prefix=/home/pj24001791/ku40000464/osu-Micro-Benchmarks/osu-nccl-install-path \
--enable-cuda \
--with-cuda-include=${CUDA_HOME}/include \
--with-cuda-libpath=${CUDA_HOME}/targets/x86_64-linux/lib/stubs:${CUDA_HOME}/lib64 \
--enable-ncclomb \
--with-nccl=${NCCL_HOME} \
LDFLAGS="-L${CUDA_HOME}/targets/x86_64-linux/lib/stubs -L${CUDA_HOME}/lib64 -lcuda -lcudart"'

 
MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5" \
CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2" \
NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl" \
LD_LIBRARY_PATH="$CUDA_HOME/targets/x86_64-linux/lib/stubs:$CUDA_HOME/lib64:$MPI_HOME/lib:$NCCL_HOME/lib:$LD_LIBRARY_PATH" \
PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/compilers/bin/:$PATH" \
bash -c '
make -j'


# how to solve : cannot find -lcuda -lcudart in a supercomputer environment(there is no cuda runtime in the login node)
# solution : add CPPFLAGS, CFLAGS, CXXFLAGS to the configure script




