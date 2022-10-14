CREATE TABLE dimDate
    (
      date_key integer NOT NULL PRIMARY KEY,
        date date NOT NULL,
        year smallint NOT NULL,
        quarter smallint NOT NULL,
        month smallint NOT NULL,
		week smallint NOT NULL,
        day smallint NOT NULL,
        is_weekend boolean
    );


insert into dimdate
	(date_key, date, year, quarter, month, week, day, is_weekend)
	select 
	distinct(to_char(payment_date :: Date, 'yyyymmdd'):: integer) as date_key,
	date(payment_date) as date,
	extract(year from payment_date) as year,
	extract(quarter from payment_date) as quarter,
	extract(month from payment_date) as month,
	extract(week from payment_date) as week,
	extract(day from payment_date) as day,
	case when extract(isodow from payment_date) in(6,7) then true else false end as is_weekend
	from payment;
	

