
 select*
 from survey
 limit 10;
 
 select question, count(*) as number_of_responses
 from survey
 group by question;
 
  select question, count(*) as number_of_responses,
  round(((100*1.0* count(*))/
  
  (select count( DISTINCT user_id) 
   from survey)),0) as percent_answered
 from survey
 group by question;
 
 select count(DISTINCT user_id)
 from survey;
 
 select *
 from quiz 
 limit 5;
 select * 
 from home_try_on
 limit 5;
 select *
 from purchase 
 limit 5;

Home Try-on analysis
   WITH conversion_table as
(SELECT DISTINCT
q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
ON q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id = q.user_id)
select count(user_id), 
((1.0* (select sum(is_home_try_on)
from conversion_table
where number_of_pairs like '3%'
and is_purchase = 1))
/(select sum(is_home_try_on) as '3 Pairs'
from conversion_table
where number_of_pairs like '3%')) as "conversion rate of people who tried on three pairs of glasses",

((1.0* (select sum(is_home_try_on)
from conversion_table
where number_of_pairs like '5%'
and is_purchase = 1))
/(select sum(is_home_try_on) as '5 Pairs'
from conversion_table
where number_of_pairs like '5%')) as "conversion rate of people who tried on five pairs of glasses"
from conversion_table
;


 
select*
from browse
limit  5;

create table 