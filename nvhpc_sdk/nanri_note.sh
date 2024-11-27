@peixin xiao
 
@Satoshi Ohshima
 Sorry, the version of NVHPC SDK was 24.7 which was not officially installed in Genkai. I downloaded the file from NVIDIA web site and installed to my home directory.
NVSHMEM in NVHPC SDK 24.7 is version 3.0.6, while NVSHMEM in NVHPC SDK 23.9 (current version in Genkai) is 2.10.1. As far as I see in the changlog, there seems to be some updates related to IBGDA which is used for GPU-offloaded communication.
Now, I'm asking Fujitsu if they can officially install the latest version 24.9 to Genkai.
But you can install it by yourself, of course.
To do so, select the latest version from: https://developer.nvidia.com/hpc-sdk
(Choose "Bundled with the newest CUDA version" and Linux x86_64 (tar file))
Then, follow the instruction.
At the install, you can choose a directory in your home directory as the target.
Following is the job script I used to test NVSHMEM:
#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=00:20:00
#PJM -j
#PJM -S

module load ${HOME}/local/nvhpc/24.7/modulefiles/nvhpc/24.7
export CUDA_HOME=${NVHPC_ROOT}/cuda
export NVSHMEM_DIR=${NVHPC_ROOT}/comm_libs/nvshmem
export PATH=${NVSHMEM_DIR}/bin:${PATH}

echo
echo shmem_put_bw
nvshmrun -f ${PJM_O_NODEINF} -launcher ssh -launcher-exec /bin/pjrsh -n 2 -ppn 1 ${NVSHMEM_DIR}/perftest/build/device/pt-to-pt/shmem_put_bw


---------------------------------------------------------------------
Fujitsu has installed NVHPC SDK 24.11 on Genkai.
For example, you can test an example code as follows:
copy an example and compile
$ module load nvidia/24.11 nvhpcx/24.11-cuda12
$ cp /home/app/nvhpc/24.11/Linux_x86_64/24.11/comm_libs/12.6/nvshmem/examples/mpi-based-init.cu .
$ nvcc -dc -ccbin nvc++ -gencode=arch=compute_90,code=sm_90 -c mpi-based-init.cu
$ nvc++ mpi-based-init.o -cuda -cudalib=nvshmem -lnvshmem_host -lnvshmem_device -lmpi -o mpi-based-init
2. Prepare a job script (for 2 nodes * 4 processes)
#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=10:00
#PJM -j
#PJM -S

module load nvidia/24.11 nvhpcx/24.11-cuda12
export NVSHMEM_BOOTSTRAP=MPI
mpirun -n 8 --map-by ppr:4:node  ./mpi-based-init
3. Submit the job