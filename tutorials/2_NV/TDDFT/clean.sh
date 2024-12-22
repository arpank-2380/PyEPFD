#!/bin/bash

workdir=`pwd`
for i in {1..200}; do
    cd frame-${i}
    rm -rf pwscf.save singlet.wbse.save/*.dat triplet.wbse.save/*.dat
    cd ${workdir}
done
