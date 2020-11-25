join: inner join, full join, left join, right join #can only join tables at a time #joining on columns
----------QA
select count(* ) from dbo.Demographics a
inner join
dbo.Conditions b
on a.contactid = b.tri_patientid


--select count(DISTINCT a.contactid) from dbo.Demographics a
--inner join
--dbo.Conditions b
--on a.contactid = b.tri_patientid

---------------------------------------------

--select count(DISTINCT a.contactid) from dbo.Demographics a
--left join
--dbo.Conditions b
--on a.contactid = b.tri_patientid

---------------------------------------------
--select a.contactid as ID,b.tri_patientid as ID2 from dbo.Demographics a  --a.contactid,b.tri_patientid --a.*,b.tri_patientid
--put 'into table_name' before from to create a new table
--right join --can also use right outer or left outer/ the default for join is always inner join
--dbo.Conditions b
--on a.contactid = b.tri_patientid
--where b.tri_patientid is null --is not null
-- put select coulmn 'AS' can giv the column a new name
---------------------------------------------

-----Join demographics, phonecall, conditions, text
--select * from demographics a
--inner join dbo.Conditions b
--on a.contactid =b.tri_patientid
--inner join dbo.[Text] c
--on c.tri_contactId =a.contactid
--inner join dbo.PhoneCall d
--on d.tri_CustomerIDEntityReference =b.tri_patientid
-----------------------------------------------

--self join
select contactid, tri_age, tri_name from dbo.Demographics a, dbo.Conditions b
where contactid =tri_age
on
a.contactid =b.tri_age
