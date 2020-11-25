
--- Question1 a.
ALTER TABLE final RENAME COLUMN "BP Status" TO "BPStatus";
select * from final;
----Question1 b.
update final
set "BPStatus"="Controlled Blood Pressure"
where "BPStatus"="Hypo1" or "BPStatus"="Normal";

update final
set "BPStatus"="Uncontrolled Blood Pressure"
where "BPStatus"="HTN1" or "BPStatus"="HTN2" or "BPStatus"="Hypo2" or "BPStatus"="HTN3";

update final
set "BPStatus" = "1"
where "BPStatus"="Controlled Blood Pressure";


update final
set "BPStatus" = "0"
where "BPStatus"="Uncontrolled Blood Pressure";

---Question 1c. joining table to have the enrollment date
select * from final as a
inner join demo as d
on a.ID = d.id;
