insert into dealership (address, inventory_id)
values 
	('25 8th st', 1),
	('45 Seaside Ave', 1);

insert into mechanic (first_name, last_name)
values 
	('Jeffry', 'Toyota'),
	('Josue', 'Miranda');

insert into inventory (dealership_id, stock_qty)
values 
	(1, 34),
	(2, 58);

insert into customer (first_name, last_name, phone_number, billing_info, car_id)
values 
	('Ruby', 'Lahila', 6666666667, '1800 Sinaloa st', 4),
	('Bryan', 'Rodriguez', 6666666666, '25 Lynn st', 5);
	
insert into car (model_name, color, price, mechanic_id, inventory_id)
values 
	('Toyota', 'Neon Green', 16000, 1, 1),
	('Subaru', 'Blue', 18000, 1, 1),
	('Pontiac', 'Red', 8000, 2, 2);

	
create or replace procedure hiresalesman(
	_first_name varchar(255),
	_last_name varchar(255),
	_dealership_id integer
)
LANGUAGE plpgsql AS $$
begin
	insert into salesperson (first_name, last_name, dealership_id) 
	values
		(_first_name, _last_name, _dealership_id);
end;
$$

call hiresalesman ('Christopher', 'Thrutchley', 1);

call hiresalesman ('Lucas', 'Land', 1);