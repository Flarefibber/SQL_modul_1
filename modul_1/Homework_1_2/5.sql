select q.`name_company` AS 'Company name', min(S) AS 'Minimum', q.`name_customer` AS 'Customer name'
from(select co.`name_company`, sum(pr.`cost`) as S, cu.`name_customer`
	from `db_developers`.`projects` pr
    inner join `db_developers`.`order` ord on pr.`project_id`=ord.`project_id`
    inner join `db_developers`.`customers` cu on cu.`customer_id`=ord.`customer_id` 
	inner join `db_developers`.`companies` co on co.`company_id`=ord.`company_id`
	group by co.`name_company`,cu.`name_customer`
    order by S) q
group by q.`name_company`