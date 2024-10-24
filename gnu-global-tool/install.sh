
mkdir -p gnu-global-tool
cd gnu-global-tool
wget https://ftp.gnu.org/pub/gnu/global/global-6.6.13.tar.gz
tar -xzf global-6.6.13.tar.gz 
cd global-6.6.13/

export MAKEINFO=true
./configure --prefix="/home/pj24001791/ku40000464/gnu-global-tool/gnu-global-tool-install"
make -j
make install


export PATH="/home/pj24001791/ku40000464/gnu-global-tool/gnu-global-tool-install/bin:$PATH"
