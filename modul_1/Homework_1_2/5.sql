USE `db_developers`;

CREATE TEMPORARY TABLE `profit_company`
SELECT `companies`.`name_company` AS 'Company name', `customers`.`name_customer` AS 'Customer name', sum(`projects`.`cost`)  AS   'Profit of the company'
FROM `projects`
JOIN `order` ON `projects`.`project_id`=`order`.`project_id`
JOIN `customers` ON `customers`.`customer_id`=`order`.`customer_id`
JOIN `companies` ON `companies`.`company_id`=`order`.`company_id`
GROUP BY `Company name`,`Customer name`;

CREATE TEMPORARY TABLE `min_profit_company`
SELECT `Company name` AS 'Company name', min(`Profit of the company`) AS 'Minimum'
FROM `profit_company`
GROUP BY `Company name`;

SELECT `profit_company`.`Customer name`, `profit_company`.`Company name`, `profit_company`.`Profit of the company`
FROM `profit_company`
JOIN `min_profit_company` ON `profit_company`.`Profit of the company`= `min_profit_company`.`Minimum`
AND `profit_company`.`Company name`= `min_profit_company`.`Company name`;