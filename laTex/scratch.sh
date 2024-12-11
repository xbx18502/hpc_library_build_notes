#include "nvshmem.h"
__global__ void func(float *x) {...} // CUDA kernel
int main (void) {
nvshmem_init();  // Initialize NVSHMEM
npes = nvshmem_n_pes(); // Get the number of PEs
mype = nvshmem_my_pe(); // Get my PE id
cudaSetDevice(mype); // Set the GPU device
x = nvshmem_malloc(...); // Allocate memory on the GPU
....
func<<<numBlocks, blockSize>>>(x); // Launch the kernel
cudaDeviceSynchronize() // Wait for the kernel to finish
....
nvshmem_finalize(); // Finalize NVSHMEM
}

#include "mpi.h"
#include "nvshmem.h"
#include "nvshmemx.h"
int main (int argc, char *argv[]) {
MPI_Init(&argc,&argv);  // Initialize MPI
MPI_Comm_size(MPI_COMM_WORLD, &size); // Get the number of PEs
MPI_Comm_rank(MPI_COMM_WORLD, &rank); // Get my PE id
cudaSetDevice(rank); // Set the GPU device
nvshmemx_init_attr(
SHMEMX_INIT_WITH_MPI_COMM, &attr);// Initialize NVSHMEM
npes = nvshmem_n_pes(); // Get the number of PEs
mype = nvshmem_my_pe(); // Get my PE id
....
nvshmem_finalize(); // Finalize NVSHMEM
MPI_Finalize(); // Finalize MPI
}
 