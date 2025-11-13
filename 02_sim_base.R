source("/ihome/spurkayastha/soumik/2025_slurm_help/01_function.R")

## these are the different parameter combinations we will be looking at
params = expand.grid(n = c(64, 128, 256, 512),
                     beta = c(1, 2, 4, 8), 
                     sigma = c(0.25, 0.5, 1, 2))
## there are 64 different parameter combinations

## this is the important bit - we will need to interface with the cluster for this
args <- commandArgs(trailingOnly = TRUE)

if(length(args) == 0){
  i <- sample(1:nrow(params), 1) # Default for testing locally
} else {
  i <- as.numeric(args[1]) # This captures the 1-64 value from Slurm
}

## these are the parameters we will use to generate true data
n_true = params$n[i]
beta_true = params$beta[i]
sigma_true = params$sigma[i]

output <- NULL

## this is the number of times you will generate data and run estimation
## this was 50 in the previous discussion
niter = 100 

output = NULL

for(j in 1:niter){
  t1 <- Sys.time()
  estims = regression_output(data_generate(n = n_true, 
                                           beta = beta_true, 
                                           sigma = sigma_true))
  t2 <- Sys.time()
  output <- rbind(output, 
                  c(estims$beta, estims$sigma, estims$ci[1], estims$ci[2], t2 - t1))
}

colnames(output) = c("beta_hat", "sigma_hat", "beta_lcb", "beta_ucb", "runtime")
output <- cbind(iter_num = 1:niter, ## iteration number
                output, ## simulation output
                beta_true = beta_true, sigma_true = sigma_true, n = n_true ## true values - will be useful later
                )

## saving in the right directory
directory_name <- "/ihome/spurkayastha/soumik/2025_slurm_help/output"
## we will save all simulation results for a given parameter combination in one file
output_name <- paste0("sim_", i, "_", 
                      "n_", n_true, "_", 
                      "beta_", beta_true, "_", 
                      "sigma_", sigma_true, ".csv")
## saving as csv, can do other formats as well
write.csv(output, file.path(directory_name, output_name), 
          row.names = FALSE)

## use this to submit: sbatch 03_sim_shell.sh 
