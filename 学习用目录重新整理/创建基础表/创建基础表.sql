-- **7828wowi**

-- 删除示例表
DROP TABLE employee;
DROP TABLE department;
DROP TABLE job;

-- 创建 3 个示例表
CREATE TABLE department
    ( dept_id    INTEGER NOT NULL PRIMARY KEY
    , dept_name  VARCHAR(50) NOT NULL
    ) ;
CREATE TABLE job
    ( job_id         INTEGER NOT NULL PRIMARY KEY
    , job_title      VARCHAR(50) NOT NULL
    ) ;
CREATE TABLE employee
    ( emp_id    INTEGER NOT NULL PRIMARY KEY
    , emp_name  VARCHAR(50) NOT NULL
    , sex       VARCHAR(10) NOT NULL
    , dept_id   INTEGER NOT NULL
    , manager   INTEGER
    , hire_date DATE NOT NULL
    , job_id    INTEGER NOT NULL
    , salary    NUMERIC(8,2) NOT NULL
    , bonus     NUMERIC(8,2)
    , email     VARCHAR(100) NOT NULL
    , CONSTRAINT ck_emp_sex CHECK (sex IN ('男', '女'))
    , CONSTRAINT ck_emp_salary CHECK (salary > 0)
    , CONSTRAINT uk_emp_email UNIQUE (email)
    , CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES department(dept_id)
    , CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES job(job_id)
    , CONSTRAINT fk_emp_manager FOREIGN KEY (manager) REFERENCES employee(emp_id)
    ) ;
CREATE INDEX idx_emp_name ON employee(emp_name);
CREATE INDEX idx_emp_dept ON employee(dept_id);
CREATE INDEX idx_emp_job ON employee(job_id);
CREATE INDEX idx_emp_manager ON employee(manager);


-- 生成 MySQL 初始化数据
INSERT INTO department(dept_id, dept_name) VALUES (1, '行政管理部');
INSERT INTO department(dept_id, dept_name) VALUES (2, '人力资源部');
INSERT INTO department(dept_id, dept_name) VALUES (3, '财务部');
INSERT INTO department(dept_id, dept_name) VALUES (4, '研发部');
INSERT INTO department(dept_id, dept_name) VALUES (5, '销售部');
INSERT INTO department(dept_id, dept_name) VALUES (6, '保卫部');

INSERT INTO job(job_id, job_title) VALUES (1, '总经理');
INSERT INTO job(job_id, job_title) VALUES (2, '副总经理');
INSERT INTO job(job_id, job_title) VALUES (3, '人力资源总监');
INSERT INTO job(job_id, job_title) VALUES (4, '人力资源专员');
INSERT INTO job(job_id, job_title) VALUES (5, '财务经理');
INSERT INTO job(job_id, job_title) VALUES (6, '会计');
INSERT INTO job(job_id, job_title) VALUES (7, '开发经理');
INSERT INTO job(job_id, job_title) VALUES (8, '程序员');
INSERT INTO job(job_id, job_title) VALUES (9, '销售经理');
INSERT INTO job(job_id, job_title) VALUES (10, '销售人员');

INSERT INTO employee VALUES (1, '刘备', '男', 1, NULL, DATE('2000-01-01'), 1, 30000, 10000, 'liubei@shuguo.com');
INSERT INTO employee VALUES (2, '关羽', '男', 1, 1, DATE('2000-01-01'), 2, 26000, 10000, 'guanyu@shuguo.com');
INSERT INTO employee VALUES (3, '张飞', '男', 1, 1, DATE('2000-01-01'), 2, 24000, 10000, 'zhangfei@shuguo.com');
INSERT INTO employee VALUES (4, '诸葛亮', '男', 2, 1, DATE('2006-03-15'), 3, 24000, 8000, 'zhugeliang@shuguo.com');
INSERT INTO employee VALUES (5, '黄忠', '男', 2, 4, DATE('2008-10-25'), 4, 8000, NULL, 'huangzhong@shuguo.com');
INSERT INTO employee VALUES (6, '魏延', '男', 2, 4, DATE('2007-04-01'), 4, 7500, NULL, 'weiyan@shuguo.com');
INSERT INTO employee VALUES (7, '孙尚香', '女', 3, 1, DATE('2002-08-08'), 5, 12000, 5000, 'sunshangxiang@shuguo.com');
INSERT INTO employee VALUES (8, '孙丫鬟', '女', 3, 7, DATE('2002-08-08'), 6, 6000, NULL, 'sunyahuan@shuguo.com');
INSERT INTO employee VALUES (9, '赵云', '男', 4, 1, DATE('2005-12-19'), 7, 15000, 6000, 'zhaoyun@shuguo.com');
INSERT INTO employee VALUES (10, '廖化', '男', 4, 9, DATE('2009-02-17'), 8, 6500, NULL, 'liaohua@shuguo.com');
INSERT INTO employee VALUES (11, '关平', '男', 4, 9, DATE('2011-07-24'), 8, 6800, NULL, 'guanping@shuguo.com');
INSERT INTO employee VALUES (12, '赵氏', '女', 4, 9, DATE('2011-11-10'), 8, 6600, NULL, 'zhaoshi@shuguo.com');
INSERT INTO employee VALUES (13, '关兴', '男', 4, 9, DATE('2011-07-30'), 8, 7000, NULL, 'guanxing@shuguo.com');
INSERT INTO employee VALUES (14, '张苞', '男', 4, 9, DATE('2012-05-31'), 8, 6500, NULL, 'zhangbao@shuguo.com');
INSERT INTO employee VALUES (15, '赵统', '男', 4, 9, DATE('2012-05-03'), 8, 6000, NULL, 'zhaotong@shuguo.com');
INSERT INTO employee VALUES (16, '周仓', '男', 4, 9, DATE('2010-02-20'), 8, 8000, NULL, 'zhoucang@shuguo.com');
INSERT INTO employee VALUES (17, '马岱', '男', 4, 9, DATE('2014-09-16'), 8, 5800, NULL, 'madai@shuguo.com');
INSERT INTO employee VALUES (18, '法正', '男', 5, 2, DATE('2017-04-09'), 9, 10000, 5000, 'fazheng@shuguo.com');
INSERT INTO employee VALUES (19, '庞统', '男', 5, 18, DATE('2017-06-06'), 10, 4100, 2000, 'pangtong@shuguo.com');
INSERT INTO employee VALUES (20, '蒋琬', '男', 5, 18, DATE('2018-01-28'), 10, 4000, 1500, 'jiangwan@shuguo.com');
INSERT INTO employee VALUES (21, '黄权', '男', 5, 18, DATE('2018-03-14'), 10, 4200, NULL, 'huangquan@shuguo.com');
INSERT INTO employee VALUES (22, '糜竺', '男', 5, 18, DATE('2018-03-27'), 10, 4300, NULL, 'mizhu@shuguo.com');
INSERT INTO employee VALUES (23, '邓芝', '男', 5, 18, DATE('2018-11-11'), 10, 4000, NULL, 'dengzhi@shuguo.com');
INSERT INTO employee VALUES (24, '简雍', '男', 5, 18, DATE('2019-05-11'), 10, 4800, NULL, 'jianyong@shuguo.com');
INSERT INTO employee VALUES (25, '孙乾', '男', 5, 18, DATE('2018-10-09'), 10, 4700, NULL, 'sunqian@shuguo.com');


CREATE TABLE emp_sales(
  emp_id     INTEGER NOT NULL,
  sale_year  INTEGER NOT NULL,
  sale_month INTEGER NOT NULL,
  amount     NUMERIC(8,2) NOT NULL,
  CONSTRAINT pk_emp_sales PRIMARY KEY (emp_id, sale_year, sale_month)
);

INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,1,15672.53);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,1,11160.46);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,1,13763.75);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,1,11210.34);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,1,14610.88);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,1,13747.64);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,1,12816.20);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,2,14413.77);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,2,14266.04);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,2,16984.42);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,2,15272.97);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,2,16103.39);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,2,15465.84);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,2,14824.55);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,3,14352.10);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,3,15116.63);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,3,13766.24);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,3,15410.53);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,3,16377.44);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,3,14856.07);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,3,16371.59);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,4,16660.24);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,4,17730.30);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,4,17898.77);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,4,18044.52);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,4,18061.82);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,4,18744.78);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,4,14441.28);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,5,19108.85);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,5,19466.56);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,5,16984.75);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,5,17029.43);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,5,18389.50);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,5,15220.30);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,5,18506.34);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (19,2021,6,20154.83);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (20,2021,6,17350.87);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (21,2021,6,16034.62);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (22,2021,6,16308.70);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (23,2021,6,19910.08);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (24,2021,6,16072.75);
INSERT INTO emp_sales (emp_id,sale_year,sale_month,amount) VALUES (25,2021,6,18373.68);

