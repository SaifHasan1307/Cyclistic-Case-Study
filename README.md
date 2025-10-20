# Cyclistic Case Study: Data Analysis & Visualization

---

## Overview

This project is part of the **Google Data Analytics Capstone Case Study**.  
It analyzes bike-share usage patterns for the fictional company Cyclistic to discover how annual members and casual riders use bikes differently.  
The findings are used to recommend strategies to convert casual riders into annual members.

---

## Business Task

**Primary Question:**  
> How do annual members and casual riders use Cyclistic bikes differently?

**Business Goal:**  
Identify actionable insights to help Cyclistic’s marketing team increase memberships.

---

## Tools & Technologies

| Tool | Purpose |
|------|----------|
| **R** | Data import, cleaning, and descriptive analysis |
| **Tableau** | Interactive dashboard and visualization |
| **Excel** | Quick cross-checking and summaries |
| **GitHub** | Project documentation and version control |


---

## Data Preparation

Data Source: Divvy/Cyclistic Bike Share Data (October 2024 to September 2025)  
> [Download available on Motivate / Divvy Data Portal](https://divvy-tripdata.s3.amazonaws.com/index.html)

**Steps Followed:**
1. Imported and merged multiple monthly CSVs.
2. Cleaned missing, inconsistent and duplicate data.
3. Created calculated fields:
   - `ride_length`  
   - `day_of_week`  
   - `month`  
   - `hour`  
   - `is_weekend`
4. Exported final dataset: `cyclistic_viz_data.csv`

**Key Folder:** `/data/`

---

## Analysis in R

R scripts used are stored in `/scripts/`.

| Script | Description |
|---------|--------------|
| `01_import_and_merge.R` | Imported and combined all raw CSVs |
| `02_clean_data.R` | Cleaned and formatted data for analysis |
| `03_descriptive_analysis.R` | Generated summary statistics |
| `04_export_for_viz.R` | Created Tableau-ready dataset |

**Main Outputs:**
- Cleaned data: `cyclistic_cleaned.csv`  
- Tableau-ready data: `cyclistic_viz_data.csv`

---

## Visualization (Tableau Dashboard) 

**File:** `/tableau/Cyclistic_Dashboard.twb`

**Dashboard Components:**
1. Total rides by user type  
2. Average ride length by user type  
3. Rides by day of week  
4. Monthly trends  
5. Hourly usage pattern  
6. Weekend vs weekday analysis  

**Key Insights:**
- Members take more total rides than casual riders, showing consistent weekday commuting patterns.  
- Casual riders have longer ride durations, indicating leisure-oriented usage. 
- Casual rides peak on weekends, while members ride more consistently throughout the week.
- Summer months (June–August) show higher ride volume for both user types, reflecting seasonal demand.
- Peak riding hours: Members travel the most around 8 AM & 5 PM while Casuals travel the most around mid-afternoon.
  
Dashboard preview:  
`/tableau/dashboard_screenshot.png`

---

## Recommendations

Based on the insights:

1. **Target casual riders with weekend & summer membership promotions:** This would encourage frequent summer leisure riders to subscribe for discounts or perks.  
2. **Offer commuter plans for daily riders:** For instance: Launch commuter-based incentives for annual members.
3. **Create flexible membership plans:** Offer short-term memberships to convert casual riders gradually.

---

## Deliverables

| Deliverable | Location |
|--------------|-----------|
| Cleaned dataset | `/data/cyclistic_cleaned.csv` |
| Tableau dashboard | `/tableau/Cyclistic_Dashboard.twb` |
| Summary reports | `/outputs/tables/` |

---

## Key Learnings 

- Improved data wrangling and visualization using R & Tableau
- Built a full data-to-insight workflow  
- Enhanced storytelling through visual design and insights presentation  
- Learned to create a portfolio-ready analytics project

---

## Project Structure

Cyclistic-Case-Study/
│

├── README.md

├── data/

  ├── cyclistic_cleaned.csv

  └── cyclistic_viz_data.csv


├── scripts/

  ├── data_check.R

  ├── 01_import_and_merge.R

  ├── 02_clean_data.R

  ├── 03_descriptive_analysis.R

  └── 04_export_for_viz.R


├── tableau/

  ├── Cyclistic_Dashboard.twb

  └── dashboard_screenshot.png


├── outputs/

  ├── tables/
  
  └── charts/
  
└── docs/

├── Cyclistic_Case_Study_Report.pdf

└── presentation_slides.pptx



---

## Author & Contact 

Md Saif Hasan  
**LinkedIn:** [www.linkedin.com/in/md-saif-hasan-04811a2a8]  
**GitHub:** [(https://github.com/SaifHasan1307)]  
**Email:** [saif.hasan.3017@gmail.com]  

---

## Project Summary

> This project demonstrates end-to-end data analysis skills. From data cleaning and transformation in R to building interactive visualizations in Tableau, it tells a clear story about user behavior and provides actionable business insights to help Cyclistic grow its membership base.

---
