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
#SBATCH --time=00:30:00
#SBATCH --output=esad2.out



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

echo "Parallel version with 1 process"
mpirun -np 1 ./cardiacsim -n 1024 -t 100 -y 1 

echo "==============================================================================="

echo "Parallel version with 2 process"
mpirun -np 2 ./cardiacsim -n 1024 -t 100 -y 2 -x 1

echo "==============================================================================="

echo "Parallel version with 4 processes"
mpirun -np 4 ./cardiacsim -n 1024 -t 100 -y 4 -x 1

echo "==============================================================================="

echo "Parallel version with 8 processes"
mpirun -np 8 ./cardiacsim -n 1024 -t 100 -y 8 -x 1

echo "==============================================================================="

echo "Parallel version with 16 processes"
mpirun -np 16 ./cardiacsim -n 1024 -t 100 -y 16 -x 1