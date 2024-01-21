#!/usr/bin/env bash
#
# You should only work under the /scratch/users/<username> directory.
#
# Example job submission script
#
# -= Resources =-
#
#SBATCH --job-name=custom_experiment
#SBATCH --nodes=1
#SBATCH --qos=shorter
#SBATCH --time=01:00:00
#SBATCH --gres=gpu:tesla_v100:1
#SBATCH --output=custom_experiment.out
#SBATCH --mem-per-cpu=20480
################################################################################
##################### !!! DO NOT EDIT ABOVE THIS LINE !!! ######################
################################################################################
# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a

echo "Running Job...!"
echo "==============================================================================="
echo "Running compiled binary..."
module load gcc/9.3.0
module load cuda/11.8.0

nvcc main.cu -o mcubes -lcudart

./mcubes -n 16 -f 1 -b 1 -p 2 -t 32
./mcubes -n 32 -f 1 -b 1 -p 2 -t 32
./mcubes -n 64 -f 1 -b 1 -p 2 -t 32
./mcubes -n 128 -f 1 -b 1 -p 2 -t 32
./mcubes -n 256 -f 1 -b 1 -p 2 -t 32
./mcubes -n 128 -f 1 -b 1 -p 2 -t 32
./mcubes -n 512 -f 1 -b 1 -p 2 -t 32
./mcubes -n 1024 -f 1 -b 1 -p 2 -t 32

: '

./mcubes -n 32 -f 1 -b 1 -p -2 -t 1
./mcubes -n 32 -f 5 -b 1 -p -2 -t 1
./mcubes -n 32 -f 10 -b 1 -p -2 -t 1


./mcubes -n 128 -f 1 -b 1 -p -2 -t 1
./mcubes -n 128 -f 5 -b 1 -p -2 -t 1
./mcubes -n 128 -f 10 -b 1 -p -2 -t 1
'

: '
./mcubes -n 128 -f 1 -b 1 -p 4 -t 1
./mcubes -n 128 -f 1 -b 1 -p 4 -t 4
./mcubes -n 128 -f 1 -b 1 -p 4 -t 16
./mcubes -n 128 -f 1 -b 1 -p 4 -t 32
./mcubes -n 128 -f 1 -b 1 -p 4 -t 64
./mcubes -n 128 -f 1 -b 1 -p 4 -t 128
./mcubes -n 128 -f 1 -b 1 -p 4 -t 256
./mcubes -n 128 -f 1 -b 1 -p 4 -t 512
./mcubes -n 128 -f 1 -b 1 -p 4 -t 1024
'

: '
./mcubes -n 32 -f 64 -b 1 -p 4 -t 1
./mcubes -n 32 -f 64 -b 1 -p 4 -t 4
./mcubes -n 32 -f 64 -b 1 -p 4 -t 16
./mcubes -n 32 -f 64 -b 1 -p 4 -t 32
./mcubes -n 32 -f 64 -b 1 -p 4 -t 64
./mcubes -n 32 -f 64 -b 1 -p 4 -t 128
./mcubes -n 32 -f 64 -b 1 -p 4 -t 256
./mcubes -n 32 -f 64 -b 1 -p 4 -t 512
./mcubes -n 32 -f 64 -b 1 -p 4 -t 1024
'

: '
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 1
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 4
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 16
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 32
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 64
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 128
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 256
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 512
./mcubes -n 4 -f 32768 -b 1 -p 1 -t 1024
'

: '
./mcubes -n 128 -f 1 -b 1 -p 4 -t 320
./mcubes -n 128 -f 1 -b 10 -p 4 -t 320
./mcubes -n 128 -f 1 -b 20 -p 4 -t 320
./mcubes -n 128 -f 1 -b 40 -p 4 -t 320
./mcubes -n 128 -f 1 -b 80 -p 4 -t 320
./mcubes -n 128 -f 1 -b 160 -p 4 -t 320
'

: '
./mcubes -n 4 -f 32768 -b 1 -p 3 -t 160
./mcubes -n 4 -f 32768 -b 10 -p 3 -t 160
./mcubes -n 4 -f 32768 -b 20 -p 3 -t 160
./mcubes -n 4 -f 32768 -b 40 -p 3 -t 160
./mcubes -n 4 -f 32768 -b 80 -p 3 -t 160
./mcubes -n 4 -f 32768 -b 160 -p 3 -t 160
'