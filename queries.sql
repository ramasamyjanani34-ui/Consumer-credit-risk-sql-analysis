home-credit-risk-sql-analysis/
├── README.md         
├── queries.sql         (all SQL queries)
└── findings.md      

        */TOTAL APPLICATION AND DEFAULT/

  SELECT
  COUNT(*) AS total_applications,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`

        
           */INCOME TYPE/
SELECT
  NAME_INCOME_TYPE,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  NAME_INCOME_TYPE
ORDER BY
  default_rate_percent DESC
            */Total applicants>=1000/
SELECT
  NAME_INCOME_TYPE,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  NAME_INCOME_TYPE
HAVING
  COUNT(*) >= 1000
ORDER BY
  default_rate_percent DESC
        

             */EDUCATION TYPE/
SELECT
  NAME_EDUCATION_TYPE,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  NAME_EDUCATION_TYPE
HAVING
  COUNT(*) >= 1000
ORDER BY
  default_rate_percent DESC

        
         */FAMILY STATUS/
SELECT
  NAME_FAMILY_STATUS,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  NAME_FAMILY_STATUS
HAVING
  COUNT(*) >= 1000
ORDER BY
  default_rate_percent DESC

        
             */GENDER/
SELECT
  CODE_GENDER,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  CODE_GENDER
HAVING
  COUNT(*) >= 1000
ORDER BY
  default_rate_percent DESC
              */CREDIT AMOUNT BUCKET/
SELECT
  CASE
    WHEN AMT_CREDIT < 300000 THEN '1. Under 300k'
    WHEN AMT_CREDIT < 600000 THEN '2. 300k-600k'
    WHEN AMT_CREDIT < 900000 THEN '3. 600k-900k'
    ELSE '4. Over 900k'
  END AS credit_amount_bucket,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  credit_amount_bucket
ORDER BY
  credit_amount_bucket

              */COMBINED RISK= INCOMETYPE&EDUCATION/
SELECT
  NAME_INCOME_TYPE,
  NAME_EDUCATION_TYPE,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  NAME_INCOME_TYPE, NAME_EDUCATION_TYPE
HAVING
  COUNT(*) >= 500
ORDER BY
  default_rate_percent DESC
LIMIT 10
        
        
        */LOAN TO INCOME RATIO/
SELECT
  CASE
    WHEN AMT_CREDIT / AMT_INCOME_TOTAL < 2 THEN '1. Under 2x income'
    WHEN AMT_CREDIT / AMT_INCOME_TOTAL < 4 THEN '2. 2x-4x income'
    WHEN AMT_CREDIT / AMT_INCOME_TOTAL < 6 THEN '3. 4x-6x income'
    ELSE '4. Over 6x income'
  END AS loan_to_income_ratio,
  COUNT(*) AS total_applicants,
  SUM(TARGET) AS total_defaults,
  ROUND(AVG(TARGET) * 100, 2) AS default_rate_percent
FROM
  `home-credit-risk-project.home_credit.application`
GROUP BY
  loan_to_income_ratio
ORDER BY
  loan_to_income_ratio

**Loan-to-income ratio:**
I also tested whether borrowing a large loan relative 
to income  predicts default. This also showed 
no clear linear trend — risk actually peaked in the middle range (2x-4x income, 
8.77%) and was lowest at both extremes. This suggests loan-to-income ratio, on 
its own, is not a strong standalone risk driver in this dataset — though it may 
still add value combined with other factors in a predictive model.
