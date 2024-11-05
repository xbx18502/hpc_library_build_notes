put CMakePresets.json at root of project

ensure compile_command.son is in build directory

example:
# --------------------------------------------
CMakePresets.json:

{
    "version": 3,
    "cmakeMinimumRequired": {
        "major": 3,
        "minor": 19,
        "patch": 0
    },
    "configurePresets": [
        {
            "name": "my_preset",
            "hidden": false,
            "generator": "Unix Makefiles",
            "cacheVariables": {
                "CMAKE_BUILD_TYPE": "Release"
            },
            "environment": {
                "CUDA_HOME": "/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2",
                "GRD_HOME": "/usr/lib64",
                "NVSHMEM_MPI_SUPPORT": "1",
                "NVSHMEM_SHMEM_SUPPORT": "1",
                "MPI_HOME":"/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/hpcx/latest/ompi",
                "SHMEM_HOME":"/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/12.2/hpcx/latest/ompi",
                "NVSHMEM_LIBFABRIC_SUPPORT": "0",
                "LIBFABRIC_HOME": "",
                "NVSHMEM_USE_NCCL":"1",
                "NCCL_HOME":"/home/app/nvhpc/23.9/Linux_x86_64/23.9/comm_libs/nccl",
                "NVSHMEM_IBGDA_SUPPORT":"1",
                "NVSHMEM_PREFIX": "/home/pj24001791/ku40000464/shmem/nvshmem-install-path",
                "CUDAToolkit_ROOT": "/home/app/nvhpc/23.9/Linux_x86_64/23.9/cuda/12.2"
                
            }
        }
    ]
}

#--------------------------------------