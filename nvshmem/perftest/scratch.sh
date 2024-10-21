export CUDA_HOME="/home/app/cuda/12.6.1"
export GDRCOPY_HOME=""



module load nvidia/23.9 nvhpcx/23.9-cuda12
export NVSHMEM_HOME=/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem/
nvcc -rdc=true -ccbin g++ -gencode arch=compute_90,code=sm_90 -I $NVSHMEM_HOME/include test.cu -L $NVSHMEM_HOME/lib -lnvshmem -lnvidia-ml -lcuda -lcudart


# environment variables for compile perftest of nvshmem
# ------------------------------------------------------
export CUDA_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"
export NVSHMEM_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/nvshmem"
export MPI_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/openmpi4/openmpi-4.1.5"
export HYDRA_HOME="$NVSHMEM_HOME/bin"
# NCCL settings
export NCCL_HOME="/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl"

export LD_LIBRARY_PATH="$NCCL_HOME/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$MPI_HOME/lib:$NVSHMEM_HOME/lib:$LD_LIBRARY_PATH"

export CMAKE_PREFIX_PATH="/home/pj24001791/ku40000464/shmem/nvshmem-copy"
# export PATH="/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2/bin:$PATH"

# export CMAKE_CUDA_COMPILER="$CUDA_HOME/bin/nvcc"
# ------------------------------------------------------

# use perftest of nvshmem
# ------------------------------------------------------
export NVSHMEM_PERFTEST_INSTALL="/home/pj24001791/ku40000464/shmem/nvshmem-copy/perftest/build/"

${MPI_HOME}/bin/mpirun -n 2 \
-x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
$NVSHMEM_PERFTEST_INSTALL/device/pt-to-pt/shmem_put_bw






