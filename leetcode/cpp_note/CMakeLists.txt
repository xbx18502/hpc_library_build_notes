cmake_minimum_required(VERSION 3.18)
project(cpp_note)

# Add executable
add_executable(cpp cpp.cpp)

install(TARGETS cpp
        RUNTIME DESTINATION ${CMAKE_SOURCE_DIR})


# Enable device code linking
set_target_properties(cpp PROPERTIES
    OUTPUT_NAME "cpp.out"
)


# Set include directories
target_include_directories(cpp PRIVATE
   
)

# Set link directories
target_link_directories(cpp PRIVATE
  
)

# Link libraries
target_link_libraries(cpp PRIVATE
    mpi
    nvshmem
    nvidia-ml
    cuda
    cudart
)