cmake_minimum_required(VERSION 3.10)  # 设置 CMake 的最低版本要求
project(NVSHMEMHelloWorld)  # 设置项目名称

# 查找 CUDA 包
find_package(CUDA REQUIRED)

# 设置 NVCC 编译选项
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -rdc=true")

# 设置 NVCC 的编译器
set(CMAKE_CUDA_COMPILER nvcc)

# 添加包含目录
include_directories(${NVSHMEM_HOME}/include)

# 添加可执行文件
add_executable(nvshmemHelloWorld nvshmemHelloWorld.cu)

# 设置链接库
target_link_libraries(nvshmemHelloWorld
    ${NVSHMEM_HOME}/lib/libnvshmem.so
    nvidia-ml
    cuda
    cudart
)

# 设置 CUDA 生成代码
set_target_properties(nvshmemHelloWorld PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
    CUDA_ARCH_BIN "${NVCC_GENCODE}"
)