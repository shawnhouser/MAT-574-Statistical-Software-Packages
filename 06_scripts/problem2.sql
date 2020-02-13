select distinct
    stname,
    cname,
    sname,
    age,
    totrev,
    population
from senators
inner join corporations using (stname)
inner join states using (stname)
where
    totrev > (3*population)/2
    and gender = 'Female'
    and party = 'Democrat'
order by stname, cname, sname