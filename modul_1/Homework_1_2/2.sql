SELECT `projects`.`name_project` AS 'Project name', sum(`developers`.`salary`) AS 'Project cost'
FROM `db_developers`.`projects`
JOIN `db_developers`.`work_on_projects` ON `projects`.`project_id`=`work_on_projects`.`project_id`
JOIN `db_developers`.`developers` ON `developers`.`developer_id`=`work_on_projects`.`developer_id`
GROUP BY `projects`.`name_project`
ORDER BY MAX('Project cost') limit 1