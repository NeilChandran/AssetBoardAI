# AssetBoardAI

**AssetBoardAI** is a SQL-powered analytics engine for Venture Capital and Private Equity professionals. It helps firms track KPIs, analyze portfolio performance, monitor exits, and surface early risk signals — all using clean, modular SQL.

## 🚀 Features

- 📊 Key Financial Metrics: IRR, MOIC, TVPI, Revenue Growth, Burn Rate
- 🧠 AI Rule-Based Risk Engine: Runway risk, revenue decline, delayed fundraising
- 🧾 Portfolio Breakdown: Sector, geography, stage, fund allocation
- 💼 Exit Intelligence: Multiples, IPO outcomes, write-offs
- 🔄 Integration-Ready Views: Ideal for BI dashboards (Tableau, Power BI, Metabase)

## 🛠️ Structure

- `schema.sql` – Database tables: companies, investments, financials, funds, etc.
- `seed_data.sql` – Sample VC/PE-backed companies and mock data
- `kpi_metrics.sql` – Core VC metrics and performance benchmarking
- `portfolio_analysis.sql` – Sector/stage/fund/geography breakdowns
- `exit_tracker.sql` – Exit summaries and ROI analysis
- `dashboard_views.sql` – Prebuilt views for BI dashboards
- `risk_signals.sql` – Revenue decline, short runway, and other risk flags

## ⚡ Quick Start

1. Clone the repo  
   `git clone https://github.com/yourusername/assetboardai.git`

2. Load schema and data  
- psql -f schema.sql
- psql -f seed_data.sql

3. Run analyses  
- psql -f kpi_metrics.sql
- psql -f dashboard_views.sql
