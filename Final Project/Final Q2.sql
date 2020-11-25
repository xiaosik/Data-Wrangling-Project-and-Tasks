select * from dbo.[Text] t
select * from dbo.Demographics


--Question 2:
select * into sxiao.Q2 from dbo.Demographics d
inner join dbo.[Text] t
on d.contactid = t.tri_contactId; --join demographics and text together into a new table

select * into sxiao.table2 from sxiao.Q2 q
inner join dbo.Conditions c
on q.contactid = c.tri_patientid ;
--now that demographics, text and conditions are all joined into a a new table with all their data

-- drop duplicated columns to make the table more tidy
alter table sxiao.table2
drop column tri_patientid, tri_contactId;


-- find out only the latest date when the text is sent for each id
select contactid, latest_sent_date = max(TextSentDate) into sxiao.table22
from sxiao.table2 t
group by contactid;

----the table are now given each id their latest text sent date and the whole date is in latest date descending order
select contactid, latest_sent_date from sxiao.table22
order by latest_sent_date DESC  ;

---

----- filtered inner join based on the latest text send date
select t.*
from sxiao.Q2
inner join (select tri_contactId, max(TextSentDate) as Latest_Date
            from dbo.[Text] t3
            group by tri_contactId) t3
on t.contactid = t3.tri_contactId and t.TextSentDate = t3.Latest_Date
