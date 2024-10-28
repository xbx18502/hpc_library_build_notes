

# module load cuda/12.2.2 nccl/2.22.3 gcc/8 ompi-cuda/4.1.6-12.2.2


# export CUDA_HOME=/home/app/cuda/12.2.2

export CUDA_HOME=/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2

export GRD_HOME=/usr/lib64

export NVSHMEM_MPI_SUPPORT=1 

export NVSHMEM_SHMEM_SUPPORT=1

# export MPI_HOME=/home/app/gcc/8/ompi-cuda/4.1.6-12.2.2

export MPI_HOME=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/hpcx/latest/ompi

export SHMEM_HOME=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/hpcx/latest/ompi

# export NVSHMEM_UCX_SUPPORT=1

# export UCX_HOME=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/hpcx/latest/ucx

export NVSHMEM_LIBFABRIC_SUPPORT=0

export LIBFABRIC_HOME=""

export NVSHMEM_USE_NCCL=1

export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

export NVSHMEM_IBGDA_SUPPORT=1

# export NVSHMEM_PMIX_SUPPORT=1

# export PMIX_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem_cufftmp_compat/lib"

# export NVSHMEM_DEFAULT_PMIX=1

export NVSHMEM_PREFIX="/home/pj24001791/ku40000464/shmem/nvshmem-install-path"

export CUDAToolkit_ROOT=/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2

# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
mkdir build
cd build
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DNVSHMEM_BUILD_TESTS=ON





