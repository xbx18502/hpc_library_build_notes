nvshmem_my_pe(): get the number of current PE(Processing Element), resembles process or thread ID
nvshmem_n_pes(): get amount of all PE (how many GPUs) 
peer: calculate the number of peer PE (a Ring communication)
nvshmem_int_p(): NVSHMEM's put function, put int "mype" to *dest in peer

'



nvshmem_team_my_pe(NVSHMEMX_TEAM_NODE): get PE number of current node, make sure every GPU has a PE number
cudaSetDevice(): set CUDA device for this PE
cudaStreamCreate(): set a CUDA stream for async operation
nvshmem_malloc(): Allocate symmetrical shared memory on all PEs, and each PE has a memory area with the same address.
simple_shift<<<>>>: Starts a CUDA kernel to execute on the specified CUDA stream.
nvshmemx_barrier_all_on_stream():Global synchronization is performed on CUDA streams to ensure that operations of all PEs are completed.
cudaMemcpyAsync():Asynchronously copies data from device memory to host memory.
cudaStreamSynchronize():Synchronizes CUDA streams, waiting for all asynchronous operations to complete.

