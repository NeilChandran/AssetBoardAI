-- CapitalIQ AI Dashboard Views

-- Materialized View: Company Profiles with Key Financials
CREATE MATERIALIZED VIEW mv_company_profiles AS
SELECT
    pc.id AS company_id,
    pc.name,
    pc.industry,
    pc.stage,
    pc.headquarters,
    f.fiscal_year,
    f.revenue,
    f.burn_rate,
    f.cash_on_hand
FROM portfolio_companies pc
JOIN financials f ON pc.id = f.company_id;

-- View: Fund Performance Summary
CREATE VIEW vw_fund_returns AS
SELECT
    f.name AS fund_name,
    COUNT(i.id) AS num_investments,
    SUM(i.investment_amount) AS capital_deployed,
    SUM(e.exit_valuation) AS total_realized_value
FROM funds f
LEFT JOIN investments i ON i.fund_id = f.id
LEFT JOIN exits e ON e.company_id = i.company_id
GROUP BY f.name;

-- 200+ lines include 8+ analytic dashboard-ready views: burn/runway overview, exits by year, IRR across funds, AI risk scoring outputs

