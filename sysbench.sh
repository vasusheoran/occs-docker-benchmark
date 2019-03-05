#!/bin/bash
sudo sh -c 'docker run --rm -v `pwd`:/root/results ljishen/sysbench /root/results/output_cpu.prof --test=cpu --cpu-max-prime=20000 run;docker run --rm -v `pwd`:/root/results ljishen/sysbench /root/results/output_memory.prof --test=memory run;docker run --rm -v `pwd`/workdir:/root/workdir ljishen/sysbench /root/results/output_fileio_prepare.prof --test=fileio --file-num=64 prepare; docker run --rm -v `pwd`:/root/results -v `pwd`/workdir:/root/workdir ljishen/sysbench /root/results/output_fileio.prof --test=fileio --file-num=64 --file-test-mode=seqrewr run; docker run --rm -v `pwd`/workdir:/root/workdir ljishen/sysbench /root/results/output_fileio.prof --test=fileio cleanup;rm -r workdir';