# TORONTO TRAFFIC COLLISIONS ANALYSIS

## OVERVIEW  
This repository analyzes traffic collision data from [Toronto Police Open Data](https://data.torontopolice.on.ca/datasets/TorontoPS::traffic-collisions-open-data-asr-t-tbl-001/explore) to identify patterns, risk factors, and high-severity zones. Our analysis focuses on temporal patterns, transportation mode vulnerabilities, geographic risk zones, and key safety metrics to inform urban planning and public safety initiatives.

## KEY INSIGHTS 

### 1. Temporal Patterns  
- **Peak Danger Hour**: 18:00 (6 PM) consistently shows highest accident rates across all months  
- **Monthly Distribution**: Highest incidents during commuter-heavy months (March, April, October)  
- **Weekly Analysis**:  
  | Day       | Accidents | Fatalities |  
  |-----------|-----------|------------|  
  | Friday    | 122,976   | 99         |  
  | Thursday  | 117,467   | 104        |  
  | Wednesday | 113,817   | 95         |  
  | **Weekday Total** | 567,480 | 470 |  
  | **Weekend Total** | 171,781 | 157 |  

### 2. Transportation Mode Risk Analysis  
| Mode        | Cases | Fatalities | Highest-Risk Incident |  
|-------------|-------|------------|------------------------|  
| Pedestrian  | 1     | 3+         | March 2022 (Thursday) |  
| Automobile  | 1     | 3-4        | Oct 2024 (Thursday)   |  
| Motorcycle  | 60    | 1          | Distributed 2014-2024 |  
| Bicycle     | 62    | 1          | Distributed 2014-2024 |  

*Motorcycles/bicycles show lower fatality rates potentially due to seasonal use, safety gear, and reduced winter operation*

### 3. Pedestrian High-Risk Zones  
| Location                  | Avg Severity | Risk Factors |  
|---------------------------|--------------|--------------|  
| Wexford/Maryvale          | 0.66         | Arterial roads, limited crossings, high-speed turns |  
| Harbourfront Cityplace    | 0.63         | Tourist density, event traffic, mixed-use corridors |  
| Morningside Heights       | 0.62         | Steep terrain, academic institutions, poor lighting |  

### 4. Top Accident-Prone Areas (All Vehicles)  
1. **Wexford/Maryvale**  
   - 17,921 accidents | 18 fatalities  
2. **West Humber-Clairville**  
   - 14,802 accidents | 17 fatalities  
3. **St Lawrence East Bayfront**  
   - 10,258 accidents | 12 fatalities  

### 5. Insurance Risk Metrics  
- **Fatality Rate**: 0.08% (Fatal Accidents/Total Accidents)  
- **Severe Injury Rate**: 0.14%  
- **High-Risk Zones (Severity Scores)**:  
  1. Mount Dennis (21.33)  
  2. Eglinton East (19.67)  
  3. Humber Heights-Westmount (19.50)  
- **Lowest-Risk Zones**:  
  1. North Toronto (8.51)  
  2. Henry Farm (8.70)  
