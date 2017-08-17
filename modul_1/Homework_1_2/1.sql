ALTER TABLE `db_developers`.`developers`
ADD COLUMN `salary` DECIMAL NULL AFTER `patronymic`;

UPDATE `db_developers`.`developers`
SET
`salary` = 1000.00
WHERE `developer_id` = 1;

UPDATE `db_developers`.`developers`
SET
`salary` = 800.00
WHERE `developer_id` = 2;
