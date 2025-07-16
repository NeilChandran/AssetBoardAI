-- Exit Performance Dashboard

-- Top 10 Exits by Value
SELECT
    pc.name,
    e.exit_type,
    e.exit_date,
    e.exit_valuation,
    i.investment_amount,
    ROUND(e.exit_valuation / NULLIF(i.investment_amount, 0), 2) AS multiple
FROM exits e
JOIN portfolio_companies pc ON e.company_id = pc.id
JOIN investments i ON i.company_id = pc.id
ORDER BY e.exit_valuation DESC
LIMIT 10;

-- IPO Tracking
SELECT
    pc.name,
    e.ipo_ticker,
    e.exit_date,
    e.exit_valuation
FROM exits e
JOIN portfolio_companies pc ON pc.id = e.company_id
WHERE e.exit_type = 'IPO';


