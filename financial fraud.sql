create database Financial_Fraud
use Financial_Fraud

select * from Financial_Fraud_dataset

DESCRIBE Financial_Fraud_dataset;

SELECT
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud) / COUNT(*), 4) AS fraud_ratio
FROM financial_fraud_dataset;

SELECT
    is_fraud,
    COUNT(*) AS txn_count,
    ROUND(AVG(device_risk_score), 3) AS avg_device_risk,
    ROUND(AVG(ip_risk_score), 3) AS avg_ip_risk,
    ROUND(AVG(amount), 2) AS avg_amount
FROM financial_fraud_dataset
GROUP BY is_fraud;




SELECT
    'device_risk_score' AS feature,
    ROUND(
        AVG(CASE WHEN is_fraud = 1 THEN device_risk_score END) -
        AVG(CASE WHEN is_fraud = 0 THEN device_risk_score END),
        3
    ) AS separation_score
FROM financial_fraud_dataset

UNION ALL

SELECT
    'ip_risk_score',
    ROUND(
        AVG(CASE WHEN is_fraud = 1 THEN ip_risk_score END) -
        AVG(CASE WHEN is_fraud = 0 THEN ip_risk_score END),
        3
    )
FROM financial_fraud_dataset

UNION ALL

SELECT
    'amount',
    ROUND(
        AVG(CASE WHEN is_fraud = 1 THEN amount END) -
        AVG(CASE WHEN is_fraud = 0 THEN amount END),
        2
    )
FROM financial_fraud_dataset

UNION ALL

SELECT
    'hour',
    ROUND(
        AVG(CASE WHEN is_fraud = 1 THEN hour END) -
        AVG(CASE WHEN is_fraud = 0 THEN hour END),
        2
    )
FROM financial_fraud_dataset;


SELECT
    hour,
    SUM(is_fraud = 0) AS legit_txns,
    SUM(is_fraud = 1) AS fraud_txns
FROM financial_fraud_dataset
GROUP BY hour
ORDER BY hour;


SELECT
    is_fraud,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    ROUND(AVG(amount), 2) AS avg_amount
FROM financial_fraud_dataset
GROUP BY is_fraud;


SELECT
    transaction_id,
    amount
FROM financial_fraud_dataset
WHERE is_fraud = 1
ORDER BY amount DESC
LIMIT 10;


SELECT
    FLOOR(device_risk_score * 10) / 10 AS risk_bucket,
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns
FROM financial_fraud_dataset
GROUP BY risk_bucket
ORDER BY risk_bucket;


SELECT
    FLOOR(ip_risk_score * 10) / 10 AS risk_bucket,
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns
FROM financial_fraud_dataset
GROUP BY risk_bucket
ORDER BY risk_bucket;

SELECT
    country,
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns
FROM financial_fraud_dataset
GROUP BY country
ORDER BY fraud_txns DESC;


ALTER TABLE financial_fraud_dataset
ADD COLUMN time_range VARCHAR(15);

UPDATE financial_fraud_dataset
SET time_range =
    CASE
        WHEN hour BETWEEN 5 AND 11 THEN 'Morning'
        WHEN hour BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN hour BETWEEN 18 AND 22 THEN 'Evening'
        ELSE 'Night'
    END;


SELECT
    transaction_id,
    amount,
    device_risk_score,
    ip_risk_score,
    CASE
        WHEN device_risk_score > 0.8
         AND ip_risk_score > 0.8
         AND amount > 1000
        THEN 'High Fraud Risk'
        ELSE 'Low Risk'
    END AS risk_flag
FROM financial_fraud_dataset
LIMIT 6;





