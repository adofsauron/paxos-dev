#!/bin/bash

HERE=`pwd`

cd trunk/phxpaxos-1.1.3

cd third_party
bash autoinstall.sh
cd ..

bash build.sh

bash autoinstall.sh

cd $HERE
