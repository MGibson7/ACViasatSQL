USE viasatpayments;
SELECT count(distinct e.fsm_id), e.completed_date, sum(v.OpenAmount + v.VoucherTotal) as revenue, e.technician_first_name as tech, e.order_type, e.service_region as region
FROM insertablehere e
Left JOIN insertvouchertablehere v ON v.fsm_id = e.fsm_id
#group by v.fsm_id
#group by e.order_type
#HAVING tech = ""
#WHERE technician_first_name = ''
where e.service_region = ''
ORDER BY revenue DESC
