rm(list = ls())
require(dplyr)
directory_name <- "/ihome/spurkayastha/soumik/2025_slurm_help/output"
files <- list.files(directory_name, 
                    full.names = TRUE)

## we read all our simulation results into one df
output <- files |> purrr::map_dfr(read.csv)

## compute summary measures
results <- output |> 
  group_by(beta_true, sigma_true, n) |> 
  summarize(beta_hat = mean(beta_hat), 
            sigma_hat = mean(sigma_hat), 
            avg_runtime = mean(runtime), 
            cov_prob = mean((beta_true - beta_lcb)*(beta_ucb - beta_true) > 0), 
            .groups = "drop")

directory_name <- "/ihome/spurkayastha/soumik/2025_slurm_help/results"
output_name <- "simulation1.csv"
write.csv(results, file.path(directory_name, output_name), 
          row.names = FALSE)

