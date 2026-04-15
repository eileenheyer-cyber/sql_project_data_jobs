/*
quesstion: what are the top skills based on salary ?
-look at the higest slary for job analyst roles
-focus on roles with specific salaariess, regardless of location
-why? whata is the imapcct of differen skills on salary for data analyst role and 
find out skills that are most financially rewarding
*/


/*
 select 
    skills_dim.skills,
    count (DISTINCT job_postings_fact.job_id) as job_count,
    round (avg (salary_year_avg),2) as salary_average
 from job_postings_fact
 inner join
 skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join 
 skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
 where 
 salary_year_avg is not NULL and job_title_short = 'Data Analyst'
 group by  skills
 order by salary_average DESC
 limit 10
 */


/*
💰 Highest salaries come from specialized/advanced skills (ML, data engineering, DevOps), not core analyst tools like SQL or Excel.
⚠️ Top-paying skills are often rare and based on few jobs, so high salary ≠ high demand.
🚀 Best career path = combine analytics + engineering/ML skills to unlock higher-paying roles.
After i did skills count , i get the following result:
svn → 1 job
solidity → 1 job
couchbase → 1 job
vmware → 1 job
What this means ?
Your table is showing:
high salary, low demand skills
That is why adding count was important — without it, svn at 400000 looks amazing, but with job_count = 1, you know it is probably just one unusual posting.
new Query:
*/


select
    skills_dim.skills,
    count(distinct job_postings_fact.job_id) as job_count,
    round(avg(salary_year_avg), 2) as salary_average
from job_postings_fact
inner join skills_job_dim
    on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
where salary_year_avg is not null
  and job_title_short = 'Data Analyst'
group by skills_dim.skills
having count(distinct job_postings_fact.job_id) >= 5
order by salary_average desc; 