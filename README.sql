# certif

/* 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds' */

delimiter //
create function time(seconds int)
returns char(15)
deterministic
begin
declare days char(3);
declare hours, minutes, sec char(2);
declare result char(15);
set days = cast(floor(seconds/60/60/24) as char(3));
set hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
set minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
set seconds = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
set result = concat(days, "days", hours, "hours", minutes, "minutes", seconds, "seconds");
return result;
end //
delimiter ;

select time(123456);

/* 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 */
delimiter //
create function numbers()
begin
  declare n int default 0;
  drop table if exists nums;
  create table nums (n int);
  while n < 10 do
    set n = n + 2;
  insert into nums values(n);
  end while;
select * from nums;
end //
delimiter ;

call numbers();
