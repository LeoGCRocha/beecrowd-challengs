SELECT temperature, count(*) as number_of_records
FROM records
group by temperature, mark
order by mark;
