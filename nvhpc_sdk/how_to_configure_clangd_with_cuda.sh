1. generate a compile_commands.json file
2. create a symbolic link from root of workspace to the compile_commands.json file
3. configure the /.vscode/c_cpp_properties.json file like this:
{
    "configurations": [
        {
            "name": "nvshmem",
            "compileCommands": "${workspaceFolder}/out/build/my_preset/compile_commands.json",
            "includePath": [
                "${workspaceFolder}/**",
                "/home/pj24001791/ku40000464/nvhpc_24.9/**"
            ],
            "defines": [
                "__CUDA_ARCH__=520"  
            ],
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-x64",
            "configurationProvider": "ms-vscode.cmake-tools"
        }
    ],
    "version": 4
}

4. install the clangd vscode extension
5. configure the /.clangd file like this:

# .clangd
CompileFlags:
  # 仅添加基本的 CUDA 支持标志，让 compile_commands.json 处理其他标志
  Add:
  - -xcuda
  - -D__CUDA_ARCH__=520
  - --cuda-gpu-arch=sm_90
  - --cuda-path=/home/pj24001791/ku40000464/nvhpc_24.9/nvhpc_24.9_install_path/Linux_x86_64/24.9/cuda/12.6
  Remove: 
  - -forward-unknown-to-host-compiler
  - --generate-code=arch=compute_70,code=[compute_70,sm_70]
  - --generate-code=arch=compute_80,code=[compute_80,sm_80]
  - --generate-code=arch=compute_90,code=[compute_90,sm_90]
  - -Xcompiler=-fPIE
  - -Xcompiler=-fPIC
  - -G
  - --maxrregcount=32

If:
  PathMatch: .*\.(cu|cuh|cpp|h|c)$
  
Index:
  Background: Build

Diagnostics:
  Suppress: 
    - unknown-cuda-version
    - unknown-warning-option

6. restart vscode, and command+shift+p, then select "clangd: Restart language server"

p.s. probably couldd use Nsight Eclipse Edition in the future