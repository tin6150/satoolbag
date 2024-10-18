
#!/bin/bash 

# script to install various tools to do load/stress testing
# xref benchmarking 
# to be called by Dockerfile 
# and future by Singularity def file


date            | tee    /_install_load_test_sh_
echo "start"    | tee -a /_install_load_test_sh_


 
# https://www.mersenne.org/download/
# use search for mprime to do power load test
# once installed, run 
# mprime -m 

# but many sub-tasks, benchmark , need some effort to do benchmark result comparison.
#	xref CF_BK/sw/mprime.rst

mkdir mprime
cd    mprime
wget --quiet https://download.mersenne.ca/gimps/v30/30.19/p95v3019b20.linux64.tar.gz -O p95v3019b20.linux64.tar.gz
ln -s p95v3019b20.linux64.tar.gz mprime_linux64.tgz
tar xfz mprime_linux64.tgz
ln -s /opt/gitrepo/container/mprime/mprime  /usr/local/bin
cd ..


# iozone 

mkdir iozone
cd    iozone
wget --quiet https://www.iozone.org/src/current/iozone3_506.tar -O iozone3_506.tar
ln -s iozone3_506.tar iozone3.tar
tar xf iozone3.tar
#cd iozone3_506/current/src
cd iozone3_506/src/current/
make

# ./iozone -a
time -p ./iozone -a -s 1 -O   # run a 1 second test


## https://tin6150.github.io/psg/tool.html#iozone
THREAD=1
FECHA=`date +%Y%m%d.%H%M.%S`
DIR=$FECHA
mkdir $DIR
#time -p ../iozone -i 0 -c -e -w -r 1024k -s 16g -t $THREAD -+n -b $DIR/result.xls
echo time -p ../iozone -i 0 -c -e -w -r 1024k -s 1g -t $THREAD -+n -b $DIR/result.xls

cd ..


## also
## singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif /bin/sysbench --threads=32 cpu   --cpu-max-prime=20000 run

## sysbench  --threads=32 cpu   run
##	output is events/second for cpu speed, not sure what to make of it.
