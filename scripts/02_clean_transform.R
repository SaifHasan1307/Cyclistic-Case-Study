library(dplyr)    
library(lubridate) 
library(readr)    

setwd("D:/Local disk D/Certificates/Google Data Analytics/Case Study/cyclistic_case_study/Raw Datasets CSV/All CSV")

# initial data size
initial_rows <- nrow(all_trips)
initial_cols <- ncol(all_trips)

# Clean Data
cleaned_trips <- all_trips %>%
  
  filter(!is.na(start_station_name), !is.na(end_station_name)) %>%
  
  filter(ended_at > started_at)

#Record cleaned data size
final_rows <- nrow(cleaned_trips)
final_cols <- ncol(cleaned_trips)
rows_removed <- initial_rows - final_rows
percent_removed <- round((rows_removed / initial_rows) * 100, 2)

#Store cleaning summary 
cleaning_summary <- list(
  initial_rows = initial_rows,
  final_rows = final_rows,
  rows_removed = rows_removed,
  percent_removed = percent_removed,
  initial_cols = initial_cols,
  final_cols = final_cols
)

cat("Data Cleaning Summary:\n")
cat("Initial rows:", cleaning_summary$initial_rows, "\n")
cat("Rows after cleaning:", cleaning_summary$final_rows, "\n")
cat("Rows removed:", cleaning_summary$rows_removed, "(", cleaning_summary$percent_removed, "% )\n")
cat("Columns before cleaning:", cleaning_summary$initial_cols, "\n")
cat("Columns after cleaning:", cleaning_summary$final_cols, "\n")

# Save cleaning summary as CSV
summary_df <- as.data.frame(cleaning_summary)
write_csv(summary_df, "cleaning_summary.csv")

#Create new calculated columns
cleaned_trips <- cleaned_trips %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")), 
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE) 
  )

#check of cleaned data dimensions
cat("Final cleaned_trips dimensions: Rows =", nrow(cleaned_trips), " | Columns =", ncol(cleaned_trips), "\n")

head(cleaned_trips)

# Save cleaned dataset
write_csv(cleaned_trips, "cyclistic_cleaned.csv")
