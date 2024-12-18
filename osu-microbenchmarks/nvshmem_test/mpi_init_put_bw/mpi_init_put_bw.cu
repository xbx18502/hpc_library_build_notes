#include <cstddef>
#include <stdio.h>
#include "mpi.h"
#include "nvshmem.h"
#include "nvshmemx.h"
#include <iostream>
#include <assert.h>
#define MAX_MSG_SIZE (32 * 1024 * 1024)

#define MAX_ITERS 200
#define MAX_SKIP 20
#define BLOCKS 4
#define THREADS_PER_BLOCK 1024

#define CUDA_CHECK(stmt)                                  \
do {                                                      \
    cudaError_t result = (stmt);                          \
    if (cudaSuccess != result) {                          \
        fprintf(stderr, "[%s:%d] CUDA failed with %s \n", \
         __FILE__, __LINE__, cudaGetErrorString(result)); \
        exit(-1);                                         \
    }                                                     \
} while (0)

const int message_size = 64;

__global__ void simple_shift(int *destination) {
    int mype = nvshmem_my_pe();
    int npes = nvshmem_n_pes();
    int peer = (mype + 1) % npes;

    // nvshmem_int_p(destination, mype, peer);
    nvshmemx_int_put_nbi_block(destination,destination, message_size, peer);
}

int main (int argc, char *argv[]) {
    int mype_node;
    int* msg = (int*)malloc(sizeof(int)*message_size);
    cudaStream_t stream;
    int rank, nranks;
    MPI_Comm mpi_comm = MPI_COMM_WORLD;
    nvshmemx_init_attr_t attr;
    std::cout<<"complete nvshmemx_init_attr_t attr"<<std::endl;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &nranks);
    std::cout<<"complete MPI_Init"<<std::endl;
    attr.mpi_comm = &mpi_comm;
    nvshmemx_init_attr(NVSHMEMX_INIT_WITH_MPI_COMM, &attr);
    mype_node = nvshmem_team_my_pe(NVSHMEMX_TEAM_NODE);
    std::cout<<"complete nvshmemx_init_attr"<<std::endl;
    CUDA_CHECK(cudaSetDevice(mype_node));
    CUDA_CHECK(cudaStreamCreate(&stream));
    std::cout<<"complete cudaSetDevice"<<std::endl;
    int *destination = (int *) nvshmem_malloc (sizeof(int)*message_size);
    for(int i=0; i<message_size; i++) {
        destination[i] = i;
    }
    std::cout<<"complete nvshmem_malloc"<<std::endl;
    simple_shift<<<1, 1, 0, stream>>>(destination);
    std::cout<<"complete simple_shift"<<std::endl;
    nvshmemx_barrier_all_on_stream(stream);
    std::cout<<"complete nvshmemx_barrier_all_on_stream"<<std::endl;
    CUDA_CHECK(cudaMemcpyAsync(msg, destination, sizeof(int)*message_size,
                cudaMemcpyDeviceToHost, stream));
    std::cout<<"complete cudaMemcpyAsync"<<std::endl;
    CUDA_CHECK(cudaStreamSynchronize(stream));
    std::cout<<"complete cudaStreamSynchronize"<<std::endl;
    printf("%d: received message %d\n", nvshmem_my_pe(), *msg);

    nvshmem_free(destination);
    nvshmem_finalize();
    MPI_Finalize();
    return 0;
}
