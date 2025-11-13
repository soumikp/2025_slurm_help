#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=0-00:15
#SBATCH --job-name=intro_to_cluster
#SBATCH --mem-per-cpu=100MB
#SBATCH --array=1-64
#SBATCH --cpus-per-task=1
#SBATCH --output=/ihome/spurkayastha/soumik/2025_slurm_help/log/slurm-%x_%A_%a.out
#SBATCH --account=spurkayastha
#SBATCH --cluster=SMP
   
module load r

Rscript /ihome/spurkayastha/soumik/2025_slurm_help/02_sim_base.R $SLURM_ARRAY_TASK_ID