
/*question;what are the most in demand skills for data analyst?


*/

SELECT 
     skills,
     count(*) as skills_demand
from 
     job_postings_fact
inner join
 skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join 
 skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
   job_title_short ='Data Analyst' 
group by 
   skills
order by 
   skills_demand DESC
limit 5