use viasat_payments;
WITH subset (last_revenue) AS 
(select sum(v.OpenAmount + v.VoucherTotal) as revenue
FROM inserttablehere e
Left JOIN insertvouchtablehere v ON v.fsm_id = e.fsm_id),
subset_2 (last_jobs) AS 
(select count(distinct e.fsm_id)
FROM inserttablehere e)
Select sum(v.OpenAmount + v.VoucherTotal) - (select last_revenue from subset)  as revenue_difference, count(distinct e.fsm_id) - (select last_jobs from subset_2) as work_order_dif
FROM inserttablehere e
Left JOIN insertvouchtablehere v ON v.fsm_id = e.fsm_id
