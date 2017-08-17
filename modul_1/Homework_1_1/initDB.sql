CREATE DATABASE `db_developers` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `db_developers`.`developers` (
  `developer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `patronymic` VARCHAR(45) NULL,
  PRIMARY KEY (`developer_id`),
  UNIQUE INDEX `developers_id_UNIQUE` (`developer_id` ASC))
COMMENT = 'Stores data about developers';

CREATE TABLE `db_developers`.`skills` (
  `skill_id` INT NOT NULL AUTO_INCREMENT,
  `skill` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE INDEX `skill_id_UNIQUE` (`skill_id` ASC))
COMMENT = 'Developer skills';

CREATE TABLE `db_developers`.`projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `name_project` VARCHAR(45) NULL,
  `projec_start_date` DATE NULL,
  `deadline` DATE NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE INDEX `project_id_UNIQUE` (`project_id` ASC))
COMMENT = 'Projects on which developers work';

CREATE TABLE `db_developers`.`companies` (
  `company_id` INT NOT NULL AUTO_INCREMENT,
  `name_company` VARCHAR(45) NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC))
COMMENT = 'IT companies in which developers work';

CREATE TABLE `db_developers`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name_customer` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
COMMENT = 'Clients who are customers of projects in IT companies';

CREATE TABLE `db_developers`.`developer_skills` (
  `developer_skills_id` INT NOT NULL AUTO_INCREMENT,
  `developer_id` INT NULL,
  `skill_id` INT NULL,
  PRIMARY KEY (`developer_skills_id`),
  UNIQUE INDEX `developer_skills_id_UNIQUE` (`developer_skills_id` ASC),
  INDEX `skill_id_idx` (`skill_id` ASC),
  INDEX `developer_id_idx` (`developer_id` ASC),
  CONSTRAINT `skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `db_developers`.`skills` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `developer_id`
    FOREIGN KEY (`developer_id`)
    REFERENCES `db_developers`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Developer skills';

CREATE TABLE `db_developers`.`work_on_projects` (
  `work_on_projects_id` INT NOT NULL AUTO_INCREMENT,
  `developer_id` INT NULL,
  `project_id` INT NULL,
  PRIMARY KEY (`work_on_projects_id`),
  UNIQUE INDEX `work_on_projects_id_UNIQUE` (`work_on_projects_id` ASC),
  INDEX `project_id_idx` (`project_id` ASC),
  INDEX `developer_id_idx` (`developer_id` ASC),
  CONSTRAINT `work_project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `db_developers`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `work_developer_id`
    FOREIGN KEY (`developer_id`)
    REFERENCES `db_developers`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Work of developers on projects';

CREATE TABLE `db_developers`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NULL,
  `project_id` INT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC),
  INDEX `order_company_id_idx` (`company_id` ASC),
  INDEX `order_project_id_idx` (`project_id` ASC),
  INDEX `order_customer_id_idx` (`customer_id` ASC),
  CONSTRAINT `order_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `db_developers`.`companies` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `db_developers`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `db_developers`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
