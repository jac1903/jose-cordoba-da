# Executive Summary: Customer Churn Analysis

**Project**: Customer Churn Prediction  
**Author**: Jose Cordoba  
**Date**: July 2026  
**Client**: Telecom Company (Portfolio Project)

---

## 1. Executive Overview

This report analyzes customer churn for a telecom company using historical data from 7,043 customers. Using **SQL**, **Python**, and **Machine Learning**, we identified the key drivers of churn and built a predictive model to flag at-risk customers proactively.

---

## 2. Key Findings

### 2.1 Overall Churn Rate
- **Total Customers**: 7,043
- **Churned Customers**: ~1,865
- **Churn Rate**: **26.5%**

### 2.2 Highest Risk Groups

| Risk Factor | Impact |
|-------------|--------|
| **Month-to-month contracts** | **5x higher churn** than 2-year contracts |
| **Tenure < 12 months** | **2x higher churn** than loyal customers |
| **Fiber optic internet** | Higher churn than DSL or no internet |
| **Electronic check** | Highest churn among payment methods |
| **Missing security services** | Customers without Online Security & Tech Support churn at much higher rates |

### 2.3 Average Customer Profile (All Customers)
- **Avg Tenure**: 32.4 months
- **Avg Monthly Charges**: $64.76
- **Avg Total Charges**: $2,279.73

---

## 3. Predictive Model Performance

We built a **Logistic Regression** model to predict churn risk.

| Metric | Score |
|--------|-------|
| **Accuracy** | ~80% |
| **ROC-AUC** | **0.85** (Excellent) |
| **Precision (Churn)** | ~65% |
| **Recall (Churn)** | ~55% |

**The ROC-AUC score of 0.85** means our model is highly reliable at distinguishing customers who will churn from those who will stay.

---

## 4. Top Factors Driving Churn

| Factor | Impact on Churn |
|--------|----------------|
| **Short Tenure** | ⬆️ Strongly increases churn risk |
| **Month-to-month contract** | ⬆️ Increases churn risk |
| **Fiber optic internet** | ⬆️ Increases churn risk |
| **No Online Security** | ⬆️ Increases churn risk |
| **No Tech Support** | ⬆️ Increases churn risk |
| **Long Tenure** | ⬇️ Decreases churn risk (protective) |
| **2-year contract** | ⬇️ Decreases churn risk (protective) |

---

## 5. Business Recommendations

### 5.1 Short-Term (Next 3 Months)
1. **Target new customers**: Offer loyalty incentives in the first 6 months (when churn risk is highest).
2. **Bundle security services**: Provide free Online Security + Tech Support for Fiber customers.
3. **Switch payment methods**: Encourage automatic credit card payments over electronic checks.

### 5.2 Long-Term (6-12 Months)
1. **Push long-term contracts**: Offer discounts for 1-year or 2-year commitments.
2. **Proactive retention**: Use the model to score customers weekly and flag high-risk groups.
3. **Customer feedback**: Survey churned customers to validate model insights.

---

## 6. Limitations

- **No profit data**: The analysis focuses on churn volume, not revenue impact.
- **External factors**: Marketing campaigns and competitor actions were not included.
- **Data snapshot**: The data covers a specific period; churn patterns may evolve over time.

---

## 7. Conclusion

This project successfully:
- Identified **high-risk customer segments**.
- Built a **reliable predictive model** (AUC = 0.85).
- Provided **actionable recommendations** to reduce churn.

**Next Steps**:
1. Integrate the model with a CRM system for real-time scoring.
2. Run A/B tests on retention campaigns.
3. Re-forecast monthly with new data.

---

**Prepared by**: Jose Cordoba  
**Contact**: www.linkedin.com/in/alejandro-córdoba-a76b54126
