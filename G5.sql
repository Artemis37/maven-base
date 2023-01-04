DROP SCHEMA `swp391g5`;

CREATE SCHEMA IF NOT EXISTS `swp391g5`;

use `swp391g5`;

CREATE TABLE `swp391g5`.`account` (
  `id` VARCHAR(50) NOT NULL,
  `full_name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `user_name` VARCHAR(50) NULL,
  `password_hash` VARCHAR(50) NULL,
  `gender` BOOLEAN NULL,
  `email` VARCHAR(50) NULL,
  `phone` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `created_by` VARCHAR(50) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `swp391g5`.`role` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `swp391g5`.`permission` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `created_at` DATETIME NULL,
  `created_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `swp391g5`.`action` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `created_at` DATETIME NULL,
  `created_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `swp391g5`.`account_role` (
  `account_id` VARCHAR(50) NULL,
  `role_id` VARCHAR(50) NULL,
  INDEX `FOREIGN_ACCOUNTROLE_ACCOUNT_idx` (`account_id` ASC) VISIBLE,
  INDEX `FOREIGN_ACCOUNTROLE_ROLE_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_ACCOUNTROLE_ACCOUNT`
    FOREIGN KEY (`account_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_ACCOUNTROLE_ROLE`
    FOREIGN KEY (`role_id`)
    REFERENCES `swp391g5`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `swp391g5`.`role_permission_action` (
  `role_id` VARCHAR(50) NULL,
  `permission_id` VARCHAR(50) NULL,
  `action_id` VARCHAR(50) NULL,
  INDEX `FOREIGN_ROLEPERMISSIONACTION_ROLE_idx` (`role_id` ASC) VISIBLE,
  INDEX `FOREIGN_PERMISSIONACTION_ACTION_idx` (`action_id` ASC) VISIBLE,
  INDEX `FOREIGN_ROLEPERMISSIONACTION_PERMISSION_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_ROLEPERMISSIONACTION_ROLE`
    FOREIGN KEY (`role_id`)
    REFERENCES `swp391g5`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_PERMISSIONACTION_ACTION`
    FOREIGN KEY (`action_id`)
    REFERENCES `swp391g5`.`action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_ROLEPERMISSIONACTION_PERMISSION`
    FOREIGN KEY (`permission_id`)
    REFERENCES `swp391g5`.`permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


    
    -- ------------------ 
    -- BLOG 
    -- ------------------ 
CREATE TABLE `swp391g5`.`blog` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `author_id` VARCHAR(50) NULL,
  `content` VARCHAR(255) NULL,
  `like` INT NULL,
  `status` INT NULL,
  `created_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  INDEX `FOREIGN_ACCOUNT_idx` (`author_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `FOREIGN_ACCOUNT`
    FOREIGN KEY (`author_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `swp391g5`.`blog_category` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `swp391g5`.`blogcategory_blog` (
  `category_id` VARCHAR(50) NULL,
  `blog_id` VARCHAR(50) NULL,
  INDEX `FOREIGN_CATEGORY_idx` (`category_id` ASC) VISIBLE,
  INDEX `FOREIGN_BLOG_idx` (`blog_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_CATEGORY`
    FOREIGN KEY (`category_id`)
    REFERENCES `swp391g5`.`blog_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_BLOG`
    FOREIGN KEY (`blog_id`)
    REFERENCES `swp391g5`.`blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `swp391g5`.`blog_save` (
  `id` VARCHAR(50) NOT NULL,
  `blog_id` VARCHAR(50) NULL,
  `customer_id` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_ACCOUNT_idx` (`customer_id` ASC) VISIBLE,
  INDEX `FOREIGN_BLOG_idx` (`blog_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_ACCOUNT_BLOGSAVE`
    FOREIGN KEY (`customer_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_BLOG_BLOGSAVE`
    FOREIGN KEY (`blog_id`)
    REFERENCES `swp391g5`.`blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `swp391g5`.`tag` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `blog_id` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FOREIGN_BLOG_TAG`
    FOREIGN KEY (`id`)
    REFERENCES `swp391g5`.`blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `swp391g5`.`blog_comment` (
  `id` VARCHAR(50) NOT NULL,
  `content` VARCHAR(500) NULL,
  `reply_to` VARCHAR(50) NULL,
  `blog_id` VARCHAR(50) NULL,
  `author_id` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_BLOGCOMMENT_REPLYTO_idx` (`reply_to` ASC) VISIBLE,
  INDEX `FOREIGN_BLOGCOMMENT_AUTHOR_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_BLOGCOMMENT_BLOG`
    FOREIGN KEY (`id`)
    REFERENCES `swp391g5`.`blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_BLOGCOMMENT_REPLYTO`
    FOREIGN KEY (`reply_to`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_BLOGCOMMENT_AUTHOR`
    FOREIGN KEY (`author_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- -----------------
    -- COURSE
    -- -----------------
CREATE TABLE `swp391g5`.`course` (
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `status` INT NULL,
  `describe` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `intro` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `author_id` VARCHAR(50) NULL,
  `goal` VARCHAR(200) NULL,
  `chapter_quantity` INT NULL,
  `total_lesson` INT NULL,
  `length` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_COURSE_ACCOUNT_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_COURSE_ACCOUNT`
    FOREIGN KEY (`author_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `swp391g5`.`chapter` (
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `course_id` VARCHAR(50) NULL,
  `level` INT NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_CHAPTER_COURSE_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_CHAPTER_COURSE`
    FOREIGN KEY (`course_id`)
    REFERENCES `swp391g5`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `swp391g5`.`lesson` (
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `chapter_id` VARCHAR(50) NULL,
  `content` VARCHAR(10000) NULL,
  `order` INT NULL,
  `type` INT NULL,
  `length` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_LESSON_CHAPTER_idx` (`chapter_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_LESSON_CHAPTER`
    FOREIGN KEY (`chapter_id`)
    REFERENCES `swp391g5`.`chapter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `swp391g5`.`course_save` (
  `id` VARCHAR(50) NOT NULL,
  `course_id` VARCHAR(50) NULL,
  `customer_id` VARCHAR(50) NULL,
  `created_by` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `modify_by` VARCHAR(50) NULL,
  `modify_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `FOREIGN_COURSESAVE_COURSE_idx` (`course_id` ASC) VISIBLE,
  INDEX `FOREIGN_COURSESAVE_ACCOUNT_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `FOREIGN_COURSESAVE_COURSE`
    FOREIGN KEY (`course_id`)
    REFERENCES `swp391g5`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FOREIGN_COURSESAVE_ACCOUNT`
    FOREIGN KEY (`customer_id`)
    REFERENCES `swp391g5`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `swp391g5`.`role` (`id`, `name`)
VALUES ('ADM', 'SuperAdmin');

INSERT INTO `swp391g5`.`action` (`id`, `name`)
VALUES ('1', 'CREATE'), ('2','READ'), ('3','UPDATE'), ('4','DELETE');

INSERT INTO `swp391g5`.`permission` (`id`, `name`)
VALUES ('AC', 'Account'), ('BL', 'Blog'), ('COR', 'Course');

INSERT INTO `swp391g5`.`role_permission_action` (`role_id`, `permission_id`, `action_id`)
VALUES ('ADM', 'AC', '1'), ('ADM', 'AC', '2'), ('ADM', 'AC', '3'), ('ADM', 'AC', '4'),
	   ('ADM', 'BL', '1'), ('ADM', 'BL', '2'), ('ADM', 'BL', '3'), ('ADM', 'BL', '4'),
       ('ADM', 'COR', '1'), ('ADM', 'COR', '2'), ('ADM', 'COR', '3'), ('ADM', 'COR', '4');
       
INSERT INTO `swp391g5`.`account` (`id`, `user_name`, `password_hash`)
VALUES ('1', 'SuperAdmin', '123456');       
       
INSERT INTO `swp391g5`.`account_role` (`account_id`, `role_id`)
VALUES ('1', 'ADM');

-- select acc.user_name as 'User Name', r.`name` as 'Role', p.`name` as 'Permission Name', a.`name` as 'action'
-- from role as r
-- inner join role_permission_action as rpa on r.id = rpa.role_id
-- inner join permission as p on p.id = rpa.permission_id
-- inner join `action` as a on a.id = rpa.action_id
-- inner join `account_role` as ar on ar.role_id = r.id
-- inner join `account` as acc on acc.id = ar.account_id