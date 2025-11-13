## Intro to parallel computing on Pitt CRC

Files are numbered sequentially. 

1. Please start with the [walkthrough](https://github.com/soumikp/2025_slurm_help/blob/main/00_walkthrough.pdf). 

2. Go over the [base function](https://github.com/soumikp/2025_slurm_help/blob/main/01_function.R) which defines the data generation and estimation routines. 
3. Next, review the [simulation base file](https://github.com/soumikp/2025_slurm_help/blob/main/02_sim_base.R) - this is the file we will run parallely on the cluster for different parameter combinations. 

4. The [slurm shell file](https://github.com/soumikp/2025_slurm_help/blob/main/03_sim_shell.sh) will control how many CPUs, how many cores, and what parameter combinations we will run the base file on. 

5. Finally, the [processing file](https://github.com/soumikp/2025_slurm_help/blob/main/04_summarize.R) will pool all our simulation runs together and generate a summary output. 

Please feel free to [email](mailto:soumik@pitt.edu) me if you have any concerns. 