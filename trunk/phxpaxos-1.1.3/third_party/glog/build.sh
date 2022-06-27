#!/bin/bash

autoreconf -ivf   

bash ./configure

make -j"$(nproc)"

make install

