SELECT `skills`.`skill` AS 'Skills', sum(`developers`.`salary`) AS 'The salary sum of all developers'
FROM `db_developers`.`developers`
JOIN `db_developers`.`developer_skills` ON `developers`.`developer_id`=`developer_skills`.`developer_id`
JOIN `db_developers`.`skills` ON `developer_skills`.`skill_id`=`skills`.`skill_id`
WHERE `skills`.`skill` = 'Java';