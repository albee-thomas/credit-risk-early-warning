<div align="center">

# 🏦 Credit Risk Early Warning System
### Identifying High-Risk Borrowers Before Default

![Status](https://img.shields.io/badge/Status-In%20Progress-orange?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-pandas%20·%20numpy-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

</div>

---

## 📌 Business Question

> *"Which retail bank customers show the highest short-term risk of default, and what financial behaviour is driving that risk?"*

---

## 🎯 Project Overview

This project builds a forward-looking early-warning system using 30,000 real credit card client records to identify deteriorating borrowers before default occurs — giving the risk team time to act earlier and more precisely.

This is not retrospective reporting. Every analytical decision here is framed around a question a credit risk manager would bring to their team on a Monday morning.

---

## ⚙️ Pipeline

Raw Data → SQL (segment & structure) → Python (feature engineering & analysis) → Power BI (executive dashboard)

---

## 📊 Dataset

| Attribute | Detail |
|-----------|--------|
| Source | UCI Machine Learning Repository |
| Dataset | Default of Credit Card Clients |
| Size | 30,000 clients · 25 variables |
| Period | April – September 2005 |
| Key Variables | 6-month payment history · credit limit · age · education · bill & payment amounts |

---

## 🛠️ Tools & Techniques

| Layer | Tool | Purpose |
|-------|------|---------|
| Storage & Segmentation | MySQL | Schema design · risk tier logic · CTE-based cohort analysis |
| Feature Engineering | Python — pandas · numpy | Trend features · correlation matrix · z-score outlier detection |
| Business Intelligence | Power BI | 3-page executive dashboard with What-If stress scenario |
| Communication | PDF Analyst Brief | Actionable recommendations for a credit risk manager |

---

## 🔍 Key Analytical Steps

**SQL**
- Segment 30,000 clients into Low / Medium / High risk tiers using 6-month payment behaviour
- Build cohort profiles crossing age band × education × credit limit bucket
- Rolling default rate per segment using CTEs and CASE WHEN logic

**Python**
- Engineer features: utilisation trend slope · months since last late payment · payment consistency score
- Correlation matrix of all default predictors
- Z-score outlier detection to flag extreme-risk clients

**Power BI**
- Page 1: Executive KPI overview
- Page 2: Cohort heatmap deep-dive
- Page 3: What-If stress scenario simulator

---

## 📈 Dashboard Pages

**Page 1 — Executive Overview**
Default rate · total credit exposure · % exposure in high-risk tier · top-risk segment card

**Page 2 — Cohort Deep-Dive**
Age band × education × credit limit heatmap · segment concentration analysis

**Page 3 — Stress Scenario**
What-If parameter slider: if default rate rises by X% · projected additional exposure

---

## ⚠️ Limitations & Assumptions

- Dataset reflects Taiwan credit card clients from 2005 — patterns may differ across modern banking markets
- This is a descriptive and segmentation analysis, not a predictive model — findings indicate elevated risk behaviour, not a probability score
- Credit limit and payment history are used as proxies for financial health — external factors such as income or employment status are not available in this dataset

---

## 📁 Repository Structure

sql — Schema creation · risk tier segmentation · cohort queries
notebooks — [▶ Open in Google Colab](https://colab.research.google.com/drive/1GuXs8o8wFAQJ4-ZZN0iU5ZQO4qDV4i1N?usp=sharing) · Feature engineering · EDA · correlation analysis
exports — Cleaned dataset feeding Power BI
dashboard — Interactive Power BI dashboard (.pbix)
brief — 1-page executive PDF summary

---

## 📬 Author

**Albee Manoj Thomas**
MSc Business Consulting & Decision Intelligence — SKEMA Business School, Paris

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Albee%20Manoj%20Thomas-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/albeemanojthomas)
[![GitHub](https://img.shields.io/badge/GitHub-albee--thomas-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/albee-thomas)
