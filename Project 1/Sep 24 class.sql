--select min/max(column name) from table_name
--where conditions

--select count((distinct) column_name) from table_name

--e.g: select COUNT(contactid) from sxiao.Demographics d 
--e.g: select count(distinct contactid) from sxiao.Demographics d2 

--e.g: select max(tri_age) from sxiao.Demographics d 

--e.g: select parentcustomeridname,min(tri_age) as minimum_age from dbo.Demographics 
--     group  by parentcustomeridname 

-- 'where' conditions go before 'group by'

--e.g: select parentcustomeridname,min(tri_age) as minimum_age from dbo.Demographics 
--     where tri_age>40 and try_convert(int,gendercode)=2 or/and/and not tri_age<40
--     where try_convert(int,gendercode) is NULL #convert to int for null values 
--     group  by parentcustomeridname 
--     order by min(tri_age) DESC #desc means descending order 
--     order by minimum_age DESC 



--SQL TEXT Mining -'like'
-- e.g: select column1, column 2,...
--      from table_name
--      where column LIKE pattern
-- e.g: where customername LIKE 'a%' (values starts with a); 
--'%a': ends with a; '% or %';any values have or in any postiton
--'_r%': second position is r; 'a_%_%': a starts with at least 3 in length; 'a%o': starts with a ends with o
--int, float, varchar: variable character , nvarchar, datetime 

--SQL joins: inner joins: A intersect B: 
--e.g:select * from dbo.Demographics a
--    inner join
--    dbo.Conditions b 
--    on
--    a.contactid=b.tri_patientid
--    where tri_name like 'hyper%' 


--, full join, left join, right join