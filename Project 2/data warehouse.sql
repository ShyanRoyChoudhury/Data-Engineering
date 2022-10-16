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
	

DROP TABLE IF EXISTS dimcustomer;
CREATE TABLE dimcustomer
    (
      customer_key SERIAL PRIMARY KEY,
      customer_id  smallint NOT NULL,
      customer_first_name   varchar(45) NOT NULL,
      customer_last_name    varchar(45) NOT NULL,
      email        varchar(50),
      address      varchar(50) NOT NULL,
      address2     varchar(50),
      district     varchar(20) NOT NULL,
      city         varchar(50) NOT NULL,
      country      varchar(50) NOT NULL,
      postal_code  varchar(10),
      phone        varchar(20) ,
      create_date  timestamp NOT NULL,
      start_date   date NOT NULL,
      end_date     date NOT NULL
    );

insert into dimcustomer(customer_key, customer_id, customer_first_name, customer_last_name,
						email, address, address2, district, city, country, postal_code, 
					   create_date, start_date, end_date)
					   select 
					   c.customer_id as customer_key,
					   c.customer_id,
					   c.first_name,
					   c.last_name,
					   c.email,
					   a.address,
					   a.address2,
					   a.district,
					   ci.city,
					   co.country,
					   a.postal_code,
					   c.create_date,
					   now() as start_date,
					   now() as end_date
					   from customer c
					   join address a on (c.address_id = a.address_id)
					   join city ci on a.city_id = ci.city_id
					   join country co on ci.country_id = co.country_id;
					   
					   
					   
DROP TABLE IF EXISTS dimfilm;
CREATE TABLE dimfilm
    (
      movie_key          SERIAL PRIMARY KEY,
      film_id            smallint NOT NULL,
      title              varchar(255) NOT NULL,
      description        text,
      release_year       year,
      ratings             varchar(5) NOT NULL,
      language           varchar(20) NOT NULL,
      length             smallint NOT NULL,
    );
    
insert into dimfilm(film_key, film_id, title, description, 
					release_year, ratings, language, length)
			select 
			f.film_id as film_key,
			f.film_id,
			f.title,
			f.description,
			f.release_year,
			f.rating,
			l.name,
			f.length
			from film f left join language l
			on f.language_id = l.language_id;
