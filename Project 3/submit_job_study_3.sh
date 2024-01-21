#!/bin/bash
#
# You should only work under the /scratch/users/<username> directory.
#
# Example job submission script
#
# -= Resources =-
#
#SBATCH --job-name=cardiacsim
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --cores-per-socket=16
#SBATCH --qos=shorter
#SBATCH --partition=shorter
#SBATCH --time=00:50:00
#SBATCH --output=emin_4.out



################################################################################
##################### !!! DO NOT EDIT ABOVE THIS LINE !!! ######################
################################################################################

module load gcc/7.3.0
module load mpich/3.2.1
module load openmpi/4.0.1

export PATH=/kuacc/apps/openmpi/4.0.1/bin/:$PATH
export LD_LIBRARY_PATH=/kuacc/apps/openmpi/4.0.1/lib/:$LD_LIBRARY_PATH
export PATH=/kuacc/apps/openmpi/4.0.1/include:$PATH


echo "Running Job...!"
echo "==============================================================================="
echo "Running compiled binary..."


#serial version
lscpu
#"Serial version..."
#./cardiacsim -n 1024 -t 100



echo "==============================================================================="

echo "Parallel version with x=1 y=16"
mpirun -np 16 --report-bindings ./cardiacsim -n 1024 -t 100 -y 16 -x 1 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 512 -t 100 -y 16 -x 1 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 256 -t 100 -y 16 -x 1 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 128 -t 100 -y 16 -x 1 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 64 -t 100 -y 16 -x 1 -k


echo "==============================================================================="

echo "Parallel version with x=2 y=8"
mpirun -np 16 --report-bindings ./cardiacsim -n 1024 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 512 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 256 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 128 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 64 -t 100 -y 8 -x 2 -k

echo "==============================================================================="

echo "Parallel version with x=4 y=4"
mpirun -np 16 --report-bindings ./cardiacsim -n 1024 -t 100 -y 4 -x 4 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 512 -t 100 -y 4 -x 4 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 256 -t 100 -y 4 -x 4 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 128 -t 100 -y 4 -x 4 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 64 -t 100 -y 4 -x 4 -k

echo "==============================================================================="

echo "Parallel version with x=8 y=2"
mpirun -np 16 --report-bindings ./cardiacsim -n 1024 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 512 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 256 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 128 -t 100 -y 8 -x 2 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 64 -t 100 -y 8 -x 2 -k

echo "==============================================================================="

echo "Parallel version with x=16 y=1"
mpirun -np 16 --report-bindings ./cardiacsim -n 1024 -t 100 -y 1 -x 16 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 512 -t 100 -y 1 -x 16 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 256 -t 100 -y 1 -x 16 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 128 -t 100 -y 1 -x 16 -k

mpirun -np 16 --report-bindings ./cardiacsim -n 64 -t 100 -y 1 -x 16-k