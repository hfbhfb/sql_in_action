-- 第 23 篇思考题参考答案
-- 思考题 1：如何查找股票曲线图中的 W 型曲线呢？

-- Oracle 实现
SELECT *
  FROM stock MATCH_RECOGNIZE (
         PARTITION BY scode
         ORDER BY tradedate
         MEASURES STRT.tradedate AS start_date,
                  FINAL LAST(DOWN.tradedate) AS bottom_date,
                  FINAL LAST(UP.tradedate) AS end_date,
                  MATCH_NUMBER() AS match_num,
                  CLASSIFIER() AS var_match
         ALL ROWS PER MATCH
         AFTER MATCH SKIP TO LAST UP
         PATTERN (STRT DOWN+ UP+ DOWN+ UP+)
         DEFINE
           DOWN AS DOWN.price < PREV(DOWN.price),
           UP AS UP.price > PREV(UP.price)
        ) MR
  ORDER BY MR.scode, MR.tradedate;

SCODE|TRADEDATE          |START_DATE         |BOTTOM_DATE        |END_DATE           |MATCH_NUM|VAR_MATCH|PRICE|
-----|-------------------|-------------------|-------------------|-------------------|---------|---------|-----|
S001 |2019-01-01 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|STRT     |   79|
S001 |2019-01-02 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|DOWN     |   61|
S001 |2019-01-03 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|DOWN     |   57|
S001 |2019-01-04 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|DOWN     |   56|
S001 |2019-01-05 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|DOWN     |   50|
S001 |2019-01-06 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|UP       |   65|
S001 |2019-01-07 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|DOWN     |   53|
S001 |2019-01-08 00:00:00|2019-01-01 00:00:00|2019-01-07 00:00:00|2019-01-08 00:00:00|        1|UP       |   56|
S001 |2019-01-18 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|STRT     |   59|
S001 |2019-01-19 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|DOWN     |   58|
S001 |2019-01-20 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|DOWN     |   44|
S001 |2019-01-21 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   48|
S001 |2019-01-22 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|DOWN     |   32|
S001 |2019-01-23 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   37|
S001 |2019-01-24 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   42|
S001 |2019-01-25 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   49|
S001 |2019-01-26 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   51|
S001 |2019-01-27 00:00:00|2019-01-18 00:00:00|2019-01-22 00:00:00|2019-01-27 00:00:00|        2|UP       |   58|

-- 思考题 2：如何监控频繁转账的账号，例如 10 分钟之内转账 5 次以上？
-- Oracle 实现
SELECT from_user, first_t, current_t, last_t, total_count
  FROM (SELECT * FROM bank_log WHERE type = '转账')
  MATCH_RECOGNIZE
    (PARTITION BY from_user
     ORDER BY ts
     MEASURES FIRST(x.ts) first_t, COALESCE(y.ts, x.ts) current_t, y.ts last_t, COUNT(x.ts) + COUNT(y.ts) total_count
     ALL ROWS PER MATCH
     PATTERN ( x{4,} y)
     DEFINE x AS (type = '转账'),
            y AS (type = '转账' AND y.ts - FIRST(x.ts) <= 10/24/60)
    );

FROM_USER     |FIRST_T            |CURRENT_T          |LAST_T             |TOTAL_COUNT|
--------------|-------------------|-------------------|-------------------|-----------|
62221234567890|2019-01-12 07:10:01|2019-01-12 07:10:01|                   |          1|
62221234567890|2019-01-12 07:10:01|2019-01-12 07:11:12|                   |          2|
62221234567890|2019-01-12 07:10:01|2019-01-12 07:12:36|                   |          3|
62221234567890|2019-01-12 07:10:01|2019-01-12 07:13:55|                   |          4|
62221234567890|2019-01-12 07:10:01|2019-01-12 07:14:24|2019-01-12 07:14:24|          5|
