library(readr)

setwd("D:/Local disk D/Certificates/Google Data Analytics/Case Study/cyclistic_case_study/Raw Datasets CSV/All CSV")

#List all CSV files
files <- list.files(pattern = "*.csv")

#Read and combine all files into one dataframe
all_trips <- do.call(rbind, lapply(files, read_csv))

#Result
cat("Rows:", nrow(all_trips), " | Columns:", ncol(all_trips), "\n")
head(all_trips)
