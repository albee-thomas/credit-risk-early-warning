# SQL Analysis — Key Findings
## Credit Risk Early Warning System

---

## Overall Default Rate
- Total clients: 30,000
- Total defaults: 6,636
- Overall default rate: 22.12%

---

## Risk Tier Summary
| Risk Tier | Clients | Defaults | Default Rate | Avg Credit Limit | Total Exposure |
|-----------|---------|----------|--------------|------------------|----------------|
| risk_tier_high | 2,590 | 1,659 | 64.05% | 91,533 | 237,070,000 |
| risk_tier_medium | 7,479 | 2,643 | 35.34% | 141,087 | 1,055,192,000 |
| risk_tier_low | 19,931 | 2,334 | 11.71% | 187,259 | 3,732,267,680 |

---

## Default Rate by Age Band
| Age Band | Clients | Defaults | Default Rate | Avg Credit Limit |
|----------|---------|----------|--------------|------------------|
| cohort_age_60_plus | 339 | 96 | 28.32% | 187,847 |
| cohort_age_50_59 | 2,341 | 582 | 24.86% | 163,909 |
| cohort_age_40_49 | 6,464 | 1,485 | 22.97% | 180,786 |
| cohort_age_20_29 | 9,618 | 2,197 | 22.84% | 124,209 |
| cohort_age_30_39 | 11,238 | 2,276 | 20.25% | 197,001 |

---

## Default Rate by Education Level
| Education | Clients | Defaults | Default Rate | Avg Credit Limit |
|-----------|---------|----------|--------------|------------------|
| High School | 4,917 | 1,237 | 25.16% | 126,550 |
| University | 14,030 | 3,330 | 23.73% | 147,062 |
| Graduate | 10,585 | 2,036 | 19.23% | 212,956 |
| Other | 468 | 33 | 7.05% | 148,235 |

---

## Default Rate by Credit Limit Bucket
| Bucket | Clients | Defaults | Default Rate | Total Exposure |
|--------|---------|----------|--------------|----------------|
| limit_below_50K | 4,311 | 1,555 | 36.07% | 101,982,000 |
| limit_50K_100K | 8,187 | 2,129 | 26.00% | 557,670,000 |
| limit_100K_200K | 7,880 | 1,535 | 19.48% | 1,247,460,000 |
| limit_200K_500K | 9,416 | 1,394 | 14.80% | 2,993,987,680 |
| limit_above_500K | 206 | 23 | 11.17% | 123,270,000 |

---

## Top Risk Cohort
The single highest-risk segment is high-tier clients aged 40–49 with University education, carrying a 71% default rate across 250 clients and 21,650,000 in total exposure — the most dangerous concentration in the entire portfolio.

---

## Portfolio Exposure by Risk Tier
| Risk Tier | Clients | Total Exposure | % of Portfolio |
|-----------|---------|----------------|----------------|
| risk_tier_low | 19,931 | 3,732,267,680 | 74.28% |
| risk_tier_medium | 7,479 | 1,055,192,000 | 21.00% |
| risk_tier_high | 2,590 | 237,070,000 | 4.72% |

---

## Key Insight
Despite high-risk clients representing only 8.6% of the total client base, they carry a 64.05% default rate — nearly 5.5x higher than low-risk clients. The below-50K credit limit bucket shows the highest default concentration at 36.07%, signalling that lower-limit clients represent a disproportionate risk to the portfolio.
