SELECT
	r.date, 
    s.fist_name, 
    s.last_name , 
    s.hourly_rate,
    sh.start_time, 
    sh.end_time,
    ((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60 as hours_in_shift,
    ((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60 * s.hourly_rate as staff_cost
FROM rotations r
LEFT JOIN staff s ON r.staff_id = s.staff_id
LEFT JOIN shifts sh ON r.shift_id = sh.shift_id;