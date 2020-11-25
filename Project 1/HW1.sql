


exec sp_rename 'sxiao.demographics.tri_age', 'age', 'COLUMN'
exec sp_rename 'sxiao.demographics.gendercode', 'gender', 'COLUMN'
exec sp_rename 'sxiao.demographics.contactid', 'id', 'COLUMN'
exec sp_rename 'sxiao.demographics.address1_stateorprovince', 'state', 'COLUMN'
exec sp_rename 'sxiao.demographics.tri_imaginecareenrollmentemailsentdate', 'EmailSentDate', 'COLUMN'
exec sp_rename 'sxiao.demographics.tri_enrollmentcompletedate', 'Completedate', 'COLUMN'

select * from sxiao.Demographics d 
-----------------------------------
---create a new column in the table
alter table sxiao.Demographics 
add enrollment_status nvarchar(100)

------a)
update sxiao.Demographics 
set enrollment_status='complete' 
where tri_imaginecareenrollmentstatus =167410011
------b)
update sxiao.Demographics 
set enrollment_status='Email sent'
where tri_imaginecareenrollmentstatus =167410001
------c)
update sxiao.Demographics 
set enrollment_status='No responder'
where tri_imaginecareenrollmentstatus =167410004
------d)
update sxiao.Demographics
set enrollment_status='Facilitated Enrollment'
where tri_imaginecareenrollmentstatus =167410005
------e)
update sxiao.Demographics
set enrollment_status='Incomplete Enrollment'
where tri_imaginecareenrollmentstatus =167410002
------f)
update sxiao.Demographics
set enrollment_status='opted out'
where tri_imaginecareenrollmentstatus =167410003
------g)
update sxiao.Demographics
set enrollment_status='unprocessed'
where tri_imaginecareenrollmentstatus =167410000
------h)
update sxiao.Demographics
set enrollment_status='second Email sent'
where tri_imaginecareenrollmentstatus =167410006
---------------------------------------------------------

select * from sxiao.Demographics d 
alter table sxiao.Demographics 
add Gender_1 nvarchar(100)
--named it 'gender_1' rather than 
--'gender' because from previous questions already named gendercode column to gender


select * from sxiao.Demographics d 
----a)
update sxiao.Demographics 
set gender_1='female'
where gender ='2'
----type is nvarchar for gender column

----b)
UPDATE sxiao.Demographics 
set gender_1='male'
where gender='1'

----c)
update sxiao.Demographics 
set gender_1='other'
where gender='167410000'

----d)
update sxiao.Demographics 
set gender_1='unknown'
where gender='NULL'

