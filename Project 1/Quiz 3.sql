select count(tri_patientid),tri_name from dbo.Conditions 
where tri_name like '%hypertension%' or tri_name like '%COPD' 
or tri_name like '%betes' or tri_name like '%failure' or tri_name like '%monitoring'
group by tri_name 
having count(tri_patientid)>100
order by count(tri_patientid)

-----------------------------------





select *from dbo.Inpatient a
join
dbo.Outpatient b
on a.DOB_CATEGORY =b.PATIENT_DOB_CATEGORY 
where PATIENT_DOB_CATEGORY like '%over 64%'




select *from dbo.Flowsheets f 

