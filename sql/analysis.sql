-- ============================================
-- CREDIT RISK EARLY WARNING SYSTEM
-- Author: Albee Manoj Thomas
-- Tool: MySQL
-- Dataset: UCI Credit Card Default (30,000 clients)
-- ============================================

USE credit_risk_project;

-- ============================================
-- STEP 1: INSPECT THE DATA
-- ============================================

SELECT *
FROM uci_credit_card
LIMIT 10;

SELECT COUNT(*) AS total_clients
FROM uci_credit_card;

DESCRIBE uci_credit_card;

-- ============================================
-- STEP 2: RENAME DEFAULT COLUMN FOR CLARITY
-- Run this only once
-- ============================================

ALTER TABLE uci_credit_card
CHANGE COLUMN `default.payment.next.month` default_next_month INT;

-- ============================================
-- STEP 3: VERIFY RENAME WORKED
-- ============================================

SELECT default_next_month
FROM uci_credit_card
LIMIT 5;

-- ============================================
-- STEP 4: OVERALL DEFAULT RATE
-- ============================================

SELECT
    COUNT(*) AS total_clients,
    SUM(default_next_month) AS total_defaults,
    ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM uci_credit_card;

-- ============================================
-- STEP 5: ADD DERIVED COLUMNS
-- Run this only once
-- ============================================

ALTER TABLE uci_credit_card
ADD COLUMN late_payment_count INT,
ADD COLUMN risk_tier VARCHAR(20),
ADD COLUMN age_band VARCHAR(20),
ADD COLUMN credit_limit_bucket VARCHAR(20);

-- ============================================
-- STEP 6: CALCULATE LATE PAYMENT COUNT
-- PAY_0 through PAY_6 (no PAY_1 in this dataset)
-- Values > 0 indicate a late payment that month
-- ============================================

SET SQL_SAFE_UPDATES = 0;

UPDATE uci_credit_card
SET late_payment_count =
    (CASE WHEN PAY_0 > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN PAY_2 > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN PAY_3 > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN PAY_4 > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN PAY_5 > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN PAY_6 > 0 THEN 1 ELSE 0 END);

-- ============================================
-- STEP 7: ASSIGN RISK TIERS
-- Low: 0 late months
-- Medium: 1-3 late months
-- High: 4+ late months
-- ============================================

UPDATE uci_credit_card
SET risk_tier = CASE
    WHEN late_payment_count = 0 THEN 'risk_tier_low'
    WHEN late_payment_count BETWEEN 1 AND 3 THEN 'risk_tier_medium'
    WHEN late_payment_count >= 4 THEN 'risk_tier_high'
END;

-- ============================================
-- STEP 8: ASSIGN AGE BANDS
-- ============================================

UPDATE uci_credit_card
SET age_band = CASE
    WHEN AGE BETWEEN 20 AND 29 THEN 'cohort_age_20_29'
    WHEN AGE BETWEEN 30 AND 39 THEN 'cohort_age_30_39'
    WHEN AGE BETWEEN 40 AND 49 THEN 'cohort_age_40_49'
    WHEN AGE BETWEEN 50 AND 59 THEN 'cohort_age_50_59'
    ELSE 'cohort_age_60_plus'
END;

-- ============================================
-- STEP 9: ASSIGN CREDIT LIMIT BUCKETS
-- ============================================

UPDATE uci_credit_card
SET credit_limit_bucket = CASE
    WHEN LIMIT_BAL < 50000 THEN 'limit_below_50K'
    WHEN LIMIT_BAL BETWEEN 50000 AND 100000 THEN 'limit_50K_100K'
    WHEN LIMIT_BAL BETWEEN 100001 AND 200000 THEN 'limit_100K_200K'
    WHEN LIMIT_BAL BETWEEN 200001 AND 500000 THEN 'limit_200K_500K'
    ELSE 'limit_above_500K'
END;

-- ============================================
-- STEP 10: RISK TIER SUMMARY
-- ============================================

SELECT
    risk_tier,
    COUNT(*) AS total_clients,
    SUM(default_next_month) AS total_defaults,
    ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LIMIT_BAL), 0) AS avg_credit_limit,
    ROUND(SUM(LIMIT_BAL), 0) AS total_exposure
FROM uci_credit_card
GROUP BY risk_tier
ORDER BY default_rate_pct DESC;

-- ============================================
-- STEP 11: DEFAULT RATE BY AGE BAND
-- ============================================

SELECT
    age_band,
    COUNT(*) AS total_clients,
    SUM(default_next_month) AS total_defaults,
    ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LIMIT_BAL), 0) AS avg_credit_limit
FROM uci_credit_card
GROUP BY age_band
ORDER BY default_rate_pct DESC;

-- ============================================
-- STEP 12: DEFAULT RATE BY EDUCATION LEVEL
-- ============================================

SELECT
    CASE
        WHEN EDUCATION = 1 THEN 'Graduate'
        WHEN EDUCATION = 2 THEN 'University'
        WHEN EDUCATION = 3 THEN 'High School'
        ELSE 'Other'
    END AS education_level,
    COUNT(*) AS total_clients,
    SUM(default_next_month) AS total_defaults,
    ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LIMIT_BAL), 0) AS avg_credit_limit
FROM uci_credit_card
GROUP BY EDUCATION
ORDER BY default_rate_pct DESC;

-- ============================================
-- STEP 13: DEFAULT RATE BY CREDIT LIMIT BUCKET
-- ============================================

SELECT
    credit_limit_bucket,
    COUNT(*) AS total_clients,
    SUM(default_next_month) AS total_defaults,
    ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct,
    ROUND(SUM(LIMIT_BAL), 0) AS total_exposure
FROM uci_credit_card
GROUP BY credit_limit_bucket
ORDER BY default_rate_pct DESC;

-- ============================================
-- STEP 14: HIGH RISK COHORT ANALYSIS
-- Cross: risk_tier x age_band x education
-- ============================================

WITH cohort_analysis AS (
    SELECT
        risk_tier,
        age_band,
        CASE
            WHEN EDUCATION = 1 THEN 'Graduate'
            WHEN EDUCATION = 2 THEN 'University'
            WHEN EDUCATION = 3 THEN 'High School'
            ELSE 'Other'
        END AS education_level,
        COUNT(*) AS total_clients,
        SUM(default_next_month) AS total_defaults,
        ROUND(SUM(default_next_month) * 100.0 / COUNT(*), 2) AS default_rate_pct,
        ROUND(SUM(LIMIT_BAL), 0) AS total_exposure
    FROM uci_credit_card
    GROUP BY risk_tier, age_band, EDUCATION
)
SELECT *
FROM cohort_analysis
ORDER BY default_rate_pct DESC
LIMIT 20;

-- ============================================
-- STEP 15: PORTFOLIO EXPOSURE BY RISK TIER
-- ============================================

WITH exposure_summary AS (
    SELECT
        risk_tier,
        COUNT(*) AS total_clients,
        ROUND(SUM(LIMIT_BAL), 0) AS total_exposure,
        ROUND(SUM(LIMIT_BAL) * 100.0 / SUM(SUM(LIMIT_BAL)) OVER (), 2) AS exposure_rate_pct
    FROM uci_credit_card
    GROUP BY risk_tier
)
SELECT *
FROM exposure_summary
ORDER BY total_exposure DESC;

-- ============================================
-- STEP 16: CREATE FINAL CLEAN EXPORT TABLE
-- Run this only once; drop first if it already exists
-- ============================================

DROP TABLE IF EXISTS credit_risk_clean;

CREATE TABLE credit_risk_clean AS
SELECT
    ID,
    LIMIT_BAL,
    SEX,
    EDUCATION,
    MARRIAGE,
    AGE,
    PAY_0,
    PAY_2,
    PAY_3,
    PAY_4,
    PAY_5,
    PAY_6,
    BILL_AMT1,
    BILL_AMT2,
    BILL_AMT3,
    BILL_AMT4,
    BILL_AMT5,
    BILL_AMT6,
    PAY_AMT1,
    PAY_AMT2,
    PAY_AMT3,
    PAY_AMT4,
    PAY_AMT5,
    PAY_AMT6,
    default_next_month,
    late_payment_count,
    risk_tier,
    age_band,
    credit_limit_bucket
FROM uci_credit_card;

-- ============================================
-- STEP 17: VERIFY FINAL TABLE
-- ============================================

SELECT *
FROM credit_risk_clean
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM credit_risk_clean;
