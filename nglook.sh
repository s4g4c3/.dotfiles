#!/bin/bash

git clone https://github.com/nwg-piotr/nwg-look.git
cd nwg-look
meson setup build
cd build
ninja
sudo ninja install
