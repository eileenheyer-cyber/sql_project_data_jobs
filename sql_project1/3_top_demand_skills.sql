SELECT *
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join  skills_dim on skills_job_dim.skill_id = skills_dim.skill_id