#!/bin/bash
CONFIG=()
CONFIG+=("with-features=huge")
#CONFIG+=("with-x")
#CONFIG+=("without-x")
CONFIG+=("enable-multibyte")
#CONFIG+=("enable-gpm")
#CONFIG+=("enable-cscope")
CONFIG+=("enable-fontset")
#CONFIG+=("enable-fail-if-missing")
#CONFIG+=("prefix=/usr/local")
#CONFIG+=("disable-gui")

#CONFIG+=("enable-pythoninterp")
CONFIG+=("enable-python3interp")
#CONFIG+=("with-python3-command=/usr/bin/python3")

CONFIG+=("enable-perlinterp")

CONFIG+=("enable-rubyinterp")

CONFIG+=("enable-luainterp")

#CONFIG+=("disable-netbeans")
#CONFIG+=("disable-xim")
#CONFIG+=("enable-xim")
#CONFIG+=("disable-sysmouse")
#CONFIG+=("disable-xsmp")
#CONFIG+=("enable-sound")

CONFIG+=("with-compiledby=gingama4")

CONFIG_CMD="./configure"
for v in "${CONFIG[@]}"
do
	CONFIG_CMD+=" --${v}"
done

cd vim/src
make distclean
eval ${CONFIG_CMD}
make -j $(sysctl -n hw.ncpu) && make install

vim --version | head -n 4

