
--create table username.table_name(ID int)
--insert into sxiao.table_1 
--values(1)
--select * from sxiao.table_1 


--select * into sxiao.Demographics from dbo.Demographics 



alter table sxiao.Demographics 
--add age int
add avgage float


update sxiao.Demographics 
--set age=tri_age 
set avgage=AVG(tri_age) 
where tri_age >30


--ALTER table sxiao.Demographics 
--drop column age
alter table sxiao.Demographics 
drop column avgage


select * from sxiao.Demographics d

--select contactid,gendercode,tri_age from sxiao.Demographics d 

--select sxiao.Demographics.parentcustomeridname,AVG(tri_age) as average_age into parent_average from sxiao.Demographics d 
--group by sxiao.Demographics.parentcustomeridname 

-- integer "int"
-- float "float"
--varchar
--datetime
--nvarchar


--To convert data type e.g:
--select * from sxiao.Demographics
--where try_convert(int,gendercode)=2

--cast
--convert
--try_convert # can be used to convert data type

