/*
Question: What are the most optimal skills to learn ?
-- identify high demand and high paying skills
--concentrates on remote positions with specified salary
--why? traget skills that offers high security and high salary , 
offering insights for career  development
*/
/*
with top_demand_skills as 
(SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(*) as demand_count
from 
     job_postings_fact
inner join
 skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join 
 skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
   job_title_short ='Data Analyst' and 
   salary_year_avg is NOT NULL
   and job_work_from_home = TRUE
group by 
   skills_dim.skill_id,
   skills_dim.skills
), avg_salary as
( select 
    skills_dim.skill_id,
    round (avg (salary_year_avg)) as salary_average
 from job_postings_fact
 inner join
 skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join 
 skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
 where 
 salary_year_avg is not NULL and job_title_short = 'Data Analyst'
 group by  skills_dim.skill_id
)

 select 
   top_demand_skills.skill_id,
   top_demand_skills.skills,
   demand_count,
   salary_average
from avg_salary
inner join 
 top_demand_skills on avg_salary.skill_id = top_demand_skills.skill_id
 where demand_count >= 10
 order by 
 salary_average desc,
 demand_count desc
 limit 25;
*/
 /*write a cleaner query:*/
select
    skills_dim.skill_id,
    skills_dim.skills,
    count(*) as demand_count,
    round (avg (salary_year_avg)) as salary_average
from job_postings_fact
inner join
 skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join 
 skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
 where 
   job_title_short ='Data Analyst' and 
   salary_year_avg is NOT NULL
   and job_work_from_home = TRUE
 group by skills_dim.skill_id
 having count(*) > 10
 order by 
 salary_average desc

