#!/bin/bash
#PJM -L rscgrp=b-batch
#PJM -L node=2
#PJM -L elapse=00:02:00
#PJM -j
#PJM -S


# ensure that the ssh keys are added to the known_hosts file
ssh-keyscan -H $(cat ${PJM_O_NODEINF} | tr '\n' ' ') >> ~/.ssh/known_hosts

module load ${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/modulefiles/nvhpc/24.9
export NVHPC_ROOT=${HOME}/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9
export CUDA_HOME=${NVHPC_ROOT}/cuda
export NVSHMEM_DIR=${NVHPC_ROOT}/comm_libs/nvshmem
export PATH=${NVSHMEM_DIR}/bin:${PATH}

echo
echo shmem_put_bw
nvshmem_run="nvshmrun -f ${PJM_O_NODEINF} -launcher \
ssh -launcher-exec /bin/pjrsh -n 2 \
-ppn 1 ${NVSHMEM_DIR}/perftest/perftest_install/device/pt-to-pt/shmem_put_bw"

mpi_run="mpirun --display-allocation --display-map \
--mca plm_rsh_agent /bin/pjrsh \
-hostfile ${PJM_O_NODEINF} \
-n 2 \
-x NVSHMEMTEST_USE_MPI_LAUNCHER=1 \
--map-by ppr:1:node \
${NVSHMEM_DIR}/perftest/perftest_install/device/pt-to-pt/shmem_put_bw"

echo command: ${mpi_run}    
eval ${mpi_run}



