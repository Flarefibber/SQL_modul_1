ALTER TABLE `db_developers`.`projects`
ADD COLUMN `cost` DECIMAL NULL AFTER `deadline`;

UPDATE `db_developers`.`projects`
SET
`cost` = 5000.00
WHERE `project_id` = 1;

UPDATE `db_developers`.`projects`
SET
`cost` = 3500.00
WHERE `project_id` = 2;