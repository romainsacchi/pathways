#!/bin/bash
#SBATCH --cluster=merlin6                  # Cluster name
#SBATCH --partition=daily                  # Specify one or multiple partitions
#SBATCH --time=20:00:00                    # Strongly recommended
#SBATCH --hint=nomultithread               # Mandatory for multithreaded jobs
#SBATCH --job-name=sweet_sure              # Name your job
#SBATCH --cpus-per-task=4                  # Request one core per task
#SBATCH --ntasks=1                         # Number of parallel tasks
#SBATCH --output=sweet_sure.out # Define your output file
#SBATCH --error=sweet_sure.err  # Define your error file
#SBATCH --mem-per-cpu=0

module use unstable
module load anaconda
conda activate /data/user/sacchi_r/conda-envs/salib

years=(2020 2030 2040 2050)

for i in {0..3}
do
   srun python /data/user/sacchi_r/python_scripts/sweet_sure_${years[$i]}.py &
done
wait