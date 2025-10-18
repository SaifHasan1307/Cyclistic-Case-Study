library(dplyr)
library(lubridate)
library(readr)

setwd("D:/Local disk D/Certificates/Google Data Analytics/Case Study/cyclistic_case_study/Raw Datasets CSV/All CSV")

#Ensure outputs/tables folder exists
if(!dir.exists("outputs/tables")){
  dir.create("outputs/tables", recursive = TRUE)
  cat("Created folder: outputs/tables\n")
} else {
  cat("Folder already exists: outputs/tables\n")
}

#Load cleaned dataset
cat(" Loading cleaned dataset...\n")
cleaned_trips <- read_csv("cyclistic_cleaned.csv", show_col_types = FALSE)
cat("Loaded cleaned_trips: Rows =", nrow(cleaned_trips), "| Columns =", ncol(cleaned_trips), "\n\n")

# Filter dataset to start from October 2024
cleaned_trips <- cleaned_trips %>%
  filter(started_at >= as.Date("2024-10-01"))


cyclistic_viz_data <- cleaned_trips %>%
  mutate(
    month = format(floor_date(started_at, "month"), "%Y-%m"),    
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE, week_start = 7), 
    hour = hour(started_at),
    is_weekend = ifelse(day_of_week %in% c("Saturday","Sunday"), TRUE, FALSE)
  )

write_csv(cyclistic_viz_data, "outputs/tables/cyclistic_viz_data.csv")

