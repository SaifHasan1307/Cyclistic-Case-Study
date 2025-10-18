# Install required packages
install.packages("readr")
install.packages("dplyr")
install.packages("stringr")

library(readr)
library(dplyr)
library(stringr)

setwd("D:/Local disk D/Certificates/Google Data Analytics/Case Study/cyclistic_case_study/Raw Datasets CSV/All CSV")

#️ List all CSV files
files <- list.files(pattern = "*.csv")

data_summary <- list()

cat("Check all Cyclistic CSV files.\n\n")

for (f in files) {
  
  cat("File:", f, "\n")
  
  df <- read_csv(f, show_col_types = FALSE)
  
  cat("Rows:", nrow(df), " | Columns:", ncol(df), "\n")
  
  cat("Columns:", paste(colnames(df), collapse = ", "), "\n")
  
  na_counts <- colSums(is.na(df))
  total_na <- sum(na_counts)
  cat("Total missing values:", total_na, "\n\n")
  
  data_summary[[f]] <- list(
    rows = nrow(df),
    cols = ncol(df),
    na_total = total_na,
    colnames = colnames(df)
  )
}

cat("Initial data check complete\n\n")

# Check if all files have the same column structure
all_cols <- lapply(data_summary, function(x) paste(x$colnames, collapse = ","))

if (length(unique(all_cols)) == 1) {
  cat("All files have the same columns\n")
} else {
  cat(" Warning: Some files have mismatched columns\n")
  
  first_cols <- data_summary[[1]]$colnames
  for (f in names(data_summary)) {
    if (!identical(data_summary[[f]]$colnames, first_cols)) {
      cat(" Mismatch found in:", f, "\n")
    }
  }
}
