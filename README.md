# Consumer-credit-risk-sql-analysis
SQL exploration of credit default risk using the Home Credit Default Risk dataset  analyzing which applicant characteristics are associated with higher loan default rates.
Queries developed and executed by Big Query.

## Project Overview

Using the Home Credit Default Risk dataset, this project explores which factors — income type, education, family status, gender, and loan size — are associated with credit default risk. The goal is to identify patterns a bank might use to assess risk before approving a loan.

This is 
1. SQL Exploration 


## Tools

- **Google BigQuery** — data warehousing and SQL execution
- **SQL** — GROUP BY, HAVING, CASE WHEN, aggregate functions
- **Dataset:** Home Credit Default Risk from kaggle

## Key Findings

**1. Baseline default rate**
Out of 307,511 loan applications, 24,825 resulted in default — an overall default rate of **8.07%**. This is the benchmark every other finding is compared against.

**2. Income type**
Among income types with reliable sample sizes, "Working" applicants show the highest default risk at **9.59%**, above the 8.07% baseline. Pensioners are the safest group at **5.39%**.

**3. Education level**
Default risk decreases steadily as education rises — a clear, monotonic trend. Lower secondary education shows the highest default rate (**10.93%**), while Higher education applicants are the safest (**5.36%**), nearly half the risk.

**4. Family status**
Civil marriage (9.94%) and Single applicants (9.81%) show the highest default rates. Widows are the safest group (5.82%). Married applicants, the largest group (196,432 people), sit close to baseline at 7.56%.

**5. Gender**
Male applicants default at 10.14%, compared to 7.0% for female applicants. *Note: gender is a legally protected characteristic in lending in many jurisdictions and would not be used as a model feature due to fair-lending regulations.

**6. Credit amount**
Risk is not linear with loan size — it peaks in the middle. Loans between 300k-600k show the highest default rate (10.06%), while both smaller (7.49%) and larger loans (6.01%) are safer, likely due to stricter approval processes for large loans.

**7. Combined risk — income type × education**
The single riskiest segment identified: **"Working" applicants with only Lower secondary education**, defaulting at **14.55%** — nearly double the baseline. This shows risk factors compound when combined, revealing sharper high-risk segments than any single variable alone.

## Hypotheses Tested but Not Confirmed

Not every intuitive hypothesis was supported by the data

**Loan-to-income ratio:** 
I also tested whether borrowing a large loan relative To income  predicts default. This also showed no clear linear trend — risk actually peaked in the middle range (2x-4x income, 8.77%) and was lowest at both extremes. This suggests loan-to-income ratio, on its own, is not a strong standalone risk driver in this dataset — though it may 
still add value combined with other factors in a predictive model.

## Files

- `queries.sql` — all 9 SQL queries used in this analysis, with comments
- `README.md` — this file






