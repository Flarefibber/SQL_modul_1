SELECT `projects`.`name_project` as 'Name project', avg(`developers`.`salary`) as 'Average salary'
FROM `db_developers`.`developers`
JOIN `db_developers`.`work_on_projects` ON `developers`.`developer_id`=`work_on_projects`.`developer_id`
JOIN `db_developers`.`projects` ON `projects`.`project_id`= `work_on_projects`.`project_id`
WHERE `projects`.`cost`= (SELECT min(`cost`) FROM `db_developers`.`projects`)