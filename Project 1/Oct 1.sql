----------------------------------------------------------
select * from dbo.Demographics union select * from dbo.Conditions 
--have error because columns names are not the same and also not same number 
----------------------------------------------------------

select top 10 * from dbo.Inpatient 
union 
select top 10 * from dbo.Outpatient 

-----------------------------------------------------------

select top 10 new_patient_DHMC_MRN,patient_sex from dbo.Inpatient 
union all ----'union' try to remove duplicate entries 
select top 10 new_patient_DHMC_MRN,patient_sex from dbo.Outpatient 

-----------------------------------------------------------

select count(contactid),parentcustomeridname from dbo.Demographics 
group by parentcustomeridname
--or 'having count(contactid)>100 '
having avg(tri_age)<50
order by count(contactid) DESC 
-------'group by' before 'having' coomand
-----where not work, using 'having'
---------error: cannot use aggregate function in where class 


select count(contactid),parentcustomeridname from dbo.Demographics 
where parentcustomeridname like '%dartmouth%'
group by parentcustomeridname 
order by count(contactid) DESC 

-------------------------------------------------------------

select * from dbo.Demographics 
where tri_age in(20,30,40)

select * from dbo.Demographics 
where tri_age=20 or tri_age =30 or tri_age=40

select * from dbo.Demographics 
where tri_age between 20 and 30   ----- 'between' includes both ends 




