#!/bin/bash
#
#SBATCH --job-name=Four5Elec
#SBATCH --output=logFour5Elec.log
#
#SBATCH --nodes 1
#SBATCH --ntasks 64
#SBATCH --ntasks-per-node=64
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#SBATCH --partition=MAIN
#SBATCH --qos=calcul
# Seulement pour jobs avec placement memoire
###SBATCH --exclusive
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregoire.girardet@minesparis.psl.eu
#SBATCH --time=72:00:00

# Load module
module load cimlibxx

# Set environment variable for OpenMP
export OMP_PROC_BIND=true

# Execute MPI run
mpirun cimlib_CFD_driver Four5Elec.mtc
