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
#SBATCH --ntasks-per-node=32
#SBATCH --cores-per-socket=32
#SBATCH --qos=shorter
#SBATCH --partition=shorter
#SBATCH --time=00:30:00
#SBATCH --output=abdullah.out


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


export KMP_AFFINITY=verbose,compact

echo "==============================================================================="

echo "MPI4 + OMP8"
export OMP_NUM_THREADS=8
export SRUN_CPUS_PER_TASK=8
mpirun -np 4 -cpus-per-proc 8 ./cardiacsim -n 1024 -t 100 -y 4

echo "MPI2 + OMP8"
export OMP_NUM_THREADS=8
export SRUN_CPUS_PER_TASK=8
mpirun -np 2 -cpus-per-proc 8 ./cardiacsim -n 1024 -t 100 -y 2

echo "MPI1 + OMP8"
export OMP_NUM_THREADS=8
export SRUN_CPUS_PER_TASK=8
mpirun -np 1 -cpus-per-proc 8 ./cardiacsim -n 1024 -t 100 -y 1


echo "==============================================================================="


echo "MPI4 + OMP4"
export OMP_NUM_THREADS=4
export SRUN_CPUS_PER_TASK=4
mpirun -np 4 -cpus-per-proc 4 ./cardiacsim -n 1024 -t 100 -y 4

echo "MPI2 + OMP4"
export OMP_NUM_THREADS=4
export SRUN_CPUS_PER_TASK=4
mpirun -np 2 -cpus-per-proc 4 ./cardiacsim -n 1024 -t 100 -y 2

echo "MPI1 + OMP4"
export OMP_NUM_THREADS=4
export SRUN_CPUS_PER_TASK=4
mpirun -np 1 -cpus-per-proc 4 ./cardiacsim -n 1024 -t 100 -y 1

echo "==============================================================================="


echo "MPI4 + OMP2"
export OMP_NUM_THREADS=2
export SRUN_CPUS_PER_TASK=2
mpirun -np 4 -cpus-per-proc 2 ./cardiacsim -n 1024 -t 100 -y 4

echo "MPI2 + OMP2"
export OMP_NUM_THREADS=2
export SRUN_CPUS_PER_TASK=2
mpirun -np 2 -cpus-per-proc 2 ./cardiacsim -n 1024 -t 100 -y 2

echo "MPI1 + OMP2"
export OMP_NUM_THREADS=2
export SRUN_CPUS_PER_TASK=2
mpirun -np 1 -cpus-per-proc 2 ./cardiacsim -n 1024 -t 100 -y 1

echo "==============================================================================="