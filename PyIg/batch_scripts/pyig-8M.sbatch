#!/bin/bash
#SBATCH --partition=compute
#SBATCH --nodes=1          
#SBATCH --ntasks-per-node=24
#SBATCH --time=12:00:00
#SBATCH --account=ddp267
#SBATCH --job-name=pyig-8M
#SBATCH --output=pyig-8M.log
#SBATCH --export=ALL
#SBATCH --mail-user=agoetz@sdsc.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail

module purge
module load biopython

LOCAL_PYTHON_PATH=/home/agoetz/.local
export PATH=$LOCAL_PYTHON_PATH/bin:$PATH
export PYTHONPATH=$LOCAL_PYTHON_PATH/lib/python2.7/site-packages:$PYTHONPATH
 
export TMPDIR=/scratch/$USER/$SLURM_JOB_ID

echo "============================="
echo ">>> running pyig on 8M.fasta"
echo "============================="

time pyig 8M.fasta
