-- Portfolio Analytics Breakdown

-- Sector Distribution
SELECT
    sector,
    COUNT(*) AS num_companies,
    AVG(current_employee_count) AS avg_headcount
FROM portfolio_companies
GROUP BY sector
ORDER BY num_companies DESC;

-- Investment by Stage
SELECT
    stage,
    COUNT(*) AS num_companies,
    AVG(i.investment_amount) AS avg_investment,
    SUM(i.investment_amount) AS total_investments
FROM investments i
JOIN portfolio_companies pc ON pc.id = i.company_id
GROUP BY pc.stage;

-- Investment Distribution per Fund
SELECT
    f.name AS fund_name,
    COUNT(i.id) AS num_deals,
    SUM(i.investment_amount) AS total_committed,
    ROUND(AVG(i.ownership_percent), 2) AS avg_equity
FROM funds f
LEFT JOIN investments i ON i.fund_id = f.id
GROUP BY fund_name;

