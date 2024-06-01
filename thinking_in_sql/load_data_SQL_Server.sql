-- 生成 SQL Server 初始化数据
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

INSERT INTO employee VALUES (1, '刘备', '男', 1, NULL, CAST('2000-01-01' AS DATE), 1, 30000, 10000, 'liubei@shuguo.com');
INSERT INTO employee VALUES (2, '关羽', '男', 1, 1, CAST('2000-01-01' AS DATE), 2, 26000, 10000, 'guanyu@shuguo.com');
INSERT INTO employee VALUES (3, '张飞', '男', 1, 1, CAST('2000-01-01' AS DATE), 2, 24000, 10000, 'zhangfei@shuguo.com');
INSERT INTO employee VALUES (4, '诸葛亮', '男', 2, 1, CAST('2006-03-15' AS DATE), 3, 24000, 8000, 'zhugeliang@shuguo.com');
INSERT INTO employee VALUES (5, '黄忠', '男', 2, 4, CAST('2008-10-25' AS DATE), 4, 8000, NULL, 'huangzhong@shuguo.com');
INSERT INTO employee VALUES (6, '魏延', '男', 2, 4, CAST('2007-04-01' AS DATE), 4, 7500, NULL, 'weiyan@shuguo.com');
INSERT INTO employee VALUES (7, '孙尚香', '女', 3, 1, CAST('2002-08-08' AS DATE), 5, 12000, 5000, 'sunshangxiang@shuguo.com');
INSERT INTO employee VALUES (8, '孙丫鬟', '女', 3, 7, CAST('2002-08-08' AS DATE), 6, 6000, NULL, 'sunyahuan@shuguo.com');
INSERT INTO employee VALUES (9, '赵云', '男', 4, 1, CAST('2005-12-19' AS DATE), 7, 15000, 6000, 'zhaoyun@shuguo.com');
INSERT INTO employee VALUES (10, '廖化', '男', 4, 9, CAST('2009-02-17' AS DATE), 8, 6500, NULL, 'liaohua@shuguo.com');
INSERT INTO employee VALUES (11, '关平', '男', 4, 9, CAST('2011-07-24' AS DATE), 8, 6800, NULL, 'guanping@shuguo.com');
INSERT INTO employee VALUES (12, '赵氏', '女', 4, 9, CAST('2011-11-10' AS DATE), 8, 6600, NULL, 'zhaoshi@shuguo.com');
INSERT INTO employee VALUES (13, '关兴', '男', 4, 9, CAST('2011-07-30' AS DATE), 8, 7000, NULL, 'guanxing@shuguo.com');
INSERT INTO employee VALUES (14, '张苞', '男', 4, 9, CAST('2012-05-31' AS DATE), 8, 6500, NULL, 'zhangbao@shuguo.com');
INSERT INTO employee VALUES (15, '赵统', '男', 4, 9, CAST('2012-05-03' AS DATE), 8, 6000, NULL, 'zhaotong@shuguo.com');
INSERT INTO employee VALUES (16, '周仓', '男', 4, 9, CAST('2010-02-20' AS DATE), 8, 8000, NULL, 'zhoucang@shuguo.com');
INSERT INTO employee VALUES (17, '马岱', '男', 4, 9, CAST('2014-09-16' AS DATE), 8, 5800, NULL, 'madai@shuguo.com');
INSERT INTO employee VALUES (18, '法正', '男', 5, 2, CAST('2017-04-09' AS DATE), 9, 10000, 5000, 'fazheng@shuguo.com');
INSERT INTO employee VALUES (19, '庞统', '男', 5, 18, CAST('2017-06-06' AS DATE), 10, 4100, 2000, 'pangtong@shuguo.com');
INSERT INTO employee VALUES (20, '蒋琬', '男', 5, 18, CAST('2018-01-28' AS DATE), 10, 4000, 1500, 'jiangwan@shuguo.com');
INSERT INTO employee VALUES (21, '黄权', '男', 5, 18, CAST('2018-03-14' AS DATE), 10, 4200, NULL, 'huangquan@shuguo.com');
INSERT INTO employee VALUES (22, '糜竺', '男', 5, 18, CAST('2018-03-27' AS DATE), 10, 4300, NULL, 'mizhu@shuguo.com');
INSERT INTO employee VALUES (23, '邓芝', '男', 5, 18, CAST('2018-11-11' AS DATE), 10, 4000, NULL, 'dengzhi@shuguo.com');
INSERT INTO employee VALUES (24, '简雍', '男', 5, 18, CAST('2019-05-11' AS DATE), 10, 4800, NULL, 'jianyong@shuguo.com');
INSERT INTO employee VALUES (25, '孙乾', '男', 5, 18, CAST('2018-10-09' AS DATE), 10, 4700, NULL, 'sunqian@shuguo.com');
