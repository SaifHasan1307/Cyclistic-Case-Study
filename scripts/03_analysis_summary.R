library(dplyr)
library(lubridate)
library(readr)

setwd("D:/Local disk D/Certificates/Google Data Analytics/Case Study/cyclistic_case_study/Raw Datasets CSV/All CSV")

# Ensure outputs/tables folder exists
if(!dir.exists("outputs/tables")){
  dir.create("outputs/tables", recursive = TRUE)
  cat("Created folder: outputs/tables\n")
} else {
  cat("Folder already exists: outputs/tables\n")
}

# Load cleaned dataset
cleaned_trips <- read_csv("cyclistic_cleaned.csv", show_col_types = FALSE)
cat("Loaded cleaned_trips: Rows =", nrow(cleaned_trips), "| Columns =", ncol(cleaned_trips), "\n\n")

#Filter dataset to start from October 2024
cleaned_trips <- cleaned_trips %>%
  filter(started_at >= as.Date("2024-10-01"))

cat("Creating summary by user type\n")

summary_by_user_type <- cleaned_trips %>%
  group_by(member_casual) %>%
  summarise(
    total_rides = n(),
    avg_ride_length = round(mean(ride_length, na.rm = TRUE), 2),
    median_ride_length = round(median(ride_length, na.rm = TRUE), 2)
  )

# Print and save
print(summary_by_user_type)
write_csv(summary_by_user_type, "outputs/tables/summary_by_user_type.csv")
cat("Saved summary_by_user_type.csv\n\n")


cat("Creating day-of-week summary by user type...\n")

day_of_week_by_user <- cleaned_trips %>%
  group_by(day_of_week, member_casual) %>%
  summarise(
    total_rides = n(),
    avg_ride_length = round(mean(ride_length, na.rm = TRUE), 2)
  ) %>%
  # Order days from Sunday to Saturday
  arrange(match(day_of_week, c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")))

# Print and save
print(head(day_of_week_by_user, 10))
write_csv(day_of_week_by_user, "outputs/tables/day_of_week_by_user.csv")
cat("Saved day_of_week_by_user.csv\n\n")


cat("Creating monthly trends summary by user type\n")

monthly_trends <- cleaned_trips %>%
  mutate(month = format(floor_date(started_at, "month"), "%Y-%m")) %>%  
  group_by(month, member_casual) %>%
  summarise(total_rides = n()) %>%
  arrange(month)

# Print and save
print(head(monthly_trends, 10))
write_csv(monthly_trends, "outputs/tables/monthly_trends.csv")
cat("Saved monthly_trends.csv\n\n")
