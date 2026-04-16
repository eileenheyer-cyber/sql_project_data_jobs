# Introduction

This project analyzes the **data job market in 2023**.

The objective is to identify:
- High-paying roles  
- In-demand skills across the data ecosystem  
- Skills that provide the best balance between **market demand and salary potential**  

SQL Queries ? [SQL_Project](/sql_project1/)

# Background

s the data field continues to grow, understanding the **skill landscape** is essential for career planning and business decision-making.

This project is based on a dataset provided in a YouTube SQL course:
https://www.youtube.com/watch?v=7mz73uXD9DA

### This project answers the following key questions:

- What are the highest-paying jobs in the data job market?
- Which skills are required for top-paying roles?
- What are the most in-demand skills across data jobs?
- Which skills are associated with the highest average salaries?
- Which skills offer the best combination of high demand and high salary?

# Tools I used

- **SQL (PostgreSQL)** → core data analysis  
- **VS Code** → development environment  
- **Postgres** → database management system
- **Git & GitHub** → version control & project documentation  

*(Next step: Power BI for interactive dashboards)*  

# The Analysis
Each query in this sproject aims at a specific aspects of data job market . Here is how i approched eachh question

### 1. Top Paying Jobs
- Identified highest-paying roles across the data job market  
- Filtered for valid salary entries  
- Included remote opportunities for broader comparability  

---

### 2. Skills in High-Paying Jobs
- Linked job postings with required skills  
- Identified which technologies appear in top-paying roles  
- Highlighted the importance of **specialized skill sets**  

---

### 3. Most In-Demand Skills
- Aggregated job postings using `COUNT(*)`  
- Identified frequently required skills across roles  
- Provided a view of **market demand independent of salary**  

---

### 4. Highest Paying Skills
- Calculated average salary per skill using `AVG()`  
- Revealed that:
  - Niche and technical skills often yield higher salaries  
  - Many high-paying skills appear in **low-frequency postings**  

---

### 5. Optimal Skills (Demand vs Salary)
- Combined:
  - `COUNT(*)` → demand  
  - `AVG(salary_year_avg)` → value  
- Used `HAVING` to exclude low-sample outliers  
- Identified **skills with both strong demand and strong compensation**

---

# what I learned

This analysis shows that the data job market rewards **both breadth and specialization**:

- Entry-level and core roles rely on foundational tools (SQL, Python)  
- Higher-paying roles increasingly require:
  - Data Engineering skills  
  - Machine Learning frameworks  
  - Cloud technologies  

The most strategic career approach is therefore:
> **Build a strong analytical foundation and extend into specialized domains**

---

# Conclusions
- Develop a **Power BI dashboard** to visualize insights  
- Analyze **skill combinations** (e.g., SQL + Python + Cloud)  
- Compare trends across different job roles and regions  
- Extend analysis with time-based trends (year-over-year changes) 
