-- Key Financial KPIs for CapitalIQ AI

-- 1. MOIC per Company
SELECT
    pc.name AS company_name,
    ROUND(SUM(i.ownership_percent * e.exit_valuation) / SUM(i.investment_amount), 2) AS MOIC
FROM investments i
JOIN exits e ON i.company_id = e.company_id
JOIN portfolio_companies pc ON i.company_id = pc.id
GROUP BY pc.name;

-- 2. Revenue CAGR
WITH rev_growth AS (
    SELECT
        company_id,
        MIN(fiscal_year) AS start_year,
        MAX(fiscal_year) AS end_year,
        MIN(revenue) AS start_rev,
        MAX(revenue) AS end_rev
    FROM financials
    GROUP BY company_id
)
SELECT
    pc.name,
    start_rev,
    end_rev,
    ROUND(POWER((end_rev / NULLIF(start_rev, 0)), 1.0 / NULLIF(end_year - start_year, 0)) - 1, 3) AS CAGR
FROM rev_growth
JOIN portfolio_companies pc ON pc.id = rev_growth.company_id;

