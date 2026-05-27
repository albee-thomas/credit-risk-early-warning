# Credit Risk Early Warning System
#### SQL Findings Summary

> A portfolio-level credit risk analysis built on the **UCI Credit Card Default** dataset, focused on early-warning signals, customer segmentation, and exposure concentration.

---

## Portfolio Snapshot

| Metric | Value |
|---|---:|
| Total Clients | 30,000 |
| Total Defaults | 6,636 |
| Overall Default Rate | 22.12% |

---

## Risk Tier Distribution

Customers were segmented into **Low**, **Medium**, and **High** risk tiers based on repayment behavior across recent months.

| Risk Tier | Clients | Defaults | Default Rate | Avg Credit Limit | Total Exposure |
|---|---:|---:|---:|---:|---:|
| Low | 19,931 | 2,334 | 11.71% | 187,259 | 3,732,267,680 |
| Medium | 7,479 | 2,643 | 35.34% | 141,087 | 1,055,192,000 |
| High | 2,590 | 1,659 | 64.05% | 91,533 | 237,070,000 |

**Observation:** the high-risk segment is small, but its default rate is materially elevated, making it the most urgent monitoring group.

---

## Age Cohorts

| Age Band | Clients | Defaults | Default Rate | Avg Credit Limit |
|---|---:|---:|---:|---:|
| 60+ | 339 | 96 | 28.32% | 187,847 |
| 50–59 | 2,341 | 582 | 24.86% | 163,909 |
| 40–49 | 6,464 | 1,485 | 22.97% | 180,786 |
| 20–29 | 9,618 | 2,197 | 22.84% | 124,209 |
| 30–39 | 11,238 | 2,276 | 20.25% | 197,001 |

The oldest cohort shows the highest default rate, while the 30–39 group has the lowest default incidence.

---

## Education Segmentation

| Education Level | Clients | Defaults | Default Rate | Avg Credit Limit |
|---|---:|---:|---:|---:|
| High School | 4,917 | 1,237 | 25.16% | 126,550 |
| University | 14,030 | 3,330 | 23.73% | 147,062 |
| Graduate School | 10,585 | 2,036 | 19.23% | 212,956 |
| Other | 468 | 33 | 7.05% | 148,235 |

Higher education levels tend to align with lower default rates and higher average credit limits.

---

## Credit Limit Buckets

| Credit Limit Bucket | Clients | Defaults | Default Rate | Total Exposure |
|---|---:|---:|---:|---:|
| Below 50K | 4,311 | 1,555 | 36.07% | 101,982,000 |
| 50K–100K | 8,187 | 2,129 | 26.00% | 557,670,000 |
| 100K–200K | 7,880 | 1,535 | 19.48% | 1,247,620,000 |
| 200K–500K | 9,416 | 1,394 | 14.80% | 2,993,987,680 |
| Above 500K | 206 | 23 | 11.17% | 123,270,000 |

Lower-limit customers show the highest default concentration, which suggests stronger repayment stress in smaller-credit segments.

---

## Highest-Risk Cohort

The most vulnerable segment in the portfolio is the **High-risk / 40–49 / University** cohort.

| Risk Tier | Age Band | Education Level | Clients | Defaults | Default Rate | Total Exposure |
|---|---|---|---:|---:|---:|---:|
| High | 40–49 | University | 250 | 178 | 71.20% | 21,650,000 |

This cohort combines high default probability with meaningful exposure, making it the single most important group for early intervention.

---

## Exposure Concentration

| Risk Tier | Clients | Total Exposure | Share of Portfolio |
|---|---:|---:|---:|
| Low | 19,931 | 3,732,267,680 | 74.28% |
| Medium | 7,479 | 1,055,192,000 | 21.00% |
| High | 2,590 | 237,070,000 | 4.72% |

Most exposure is held in the low-risk group, but the medium- and high-risk segments still deserve close attention due to their elevated default rates.

---

## Key Takeaways

- The portfolio default rate is **22.12%**.
- High-risk clients have a **64.05%** default rate, compared with **11.71%** in the low-risk segment.
- The **Below 50K** credit-limit bucket has the highest default concentration at **36.07%**.
- The **High / 40–49 / University** cohort is the most critical risk pocket in the portfolio.
- Risk is concentrated not only by customer count, but also by repayment behavior and exposure profile.

---

## Business Meaning

This analysis supports an early-warning framework for retail banking by identifying where default risk is concentrated, which customer groups should be monitored most closely, and how portfolio exposure is distributed across those groups. It can inform collections strategy, limit management, and proactive customer outreach.
