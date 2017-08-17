INSERT INTO `db_developers`.`developers`
(`name`,`surname`,`patronymic`)
VALUES
('Ivan','Ivanov','Ivanovich'),
('Petro','Petrov','Petrovich'),
('Taras','Tarasov','Tarasovich');

INSERT INTO `db_developers`.`skills`
(`skill`)
VALUES
('Java'),('C++'),('MySQL');

INSERT INTO `db_developers`.`projects`
(`name_project`,`projec_start_date`,`deadline`)
VALUES
('Homework 1_1','2017-8-09','2017-8-18'),
('Homework 1_2','2017-8-09','2017-8-18');

INSERT INTO `db_developers`.`customers`
(`name_customer`)
VALUES
('GoIT'),
('Go_IT');

INSERT INTO `db_developers`.`companies`
(`name_company`)
VALUES
('Homework Java Developer'),('Homework C++ Developer');

INSERT INTO `db_developers`.`developer_skills`
(`developer_id`,`skill_id`)
VALUES
(1,1),(1,3),(2,2),(2,3),(3,1),(3,3);

INSERT INTO `db_developers`.`work_on_projects`
(`developer_id`,`project_id`)
VALUES
(1,1),(1,2),(2,1),(2,2),(3,1);

INSERT INTO `db_developers`.`order`
(`company_id`,`project_id`,`customer_id`)
VALUES
(1,1,1),(1,2,1),(2,1,1),(2,2,1),(1,1,2);