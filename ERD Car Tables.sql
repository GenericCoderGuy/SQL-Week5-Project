CREATE TABLE "dealership" (
	"dealership_id" serial NOT NULL,
	"address" varchar(255) NOT NULL,
	"inventory_id" integer NOT NULL,
	CONSTRAINT "dealership_pk" PRIMARY KEY ("dealership_id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"phone_number" char(10) NOT NULL,
	"billing_info" varchar(255) NOT NULL,
	"car_id" integer NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "inventory" (
	"inventory_id" serial NOT NULL,
	"dealership_id" int NOT NULL,
	"stock_qty" integer NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "car" (
	"car_id" serial NOT NULL,
	"model_name" varchar(255) NOT NULL,
	"color" varchar(255) NOT NULL,
	"price" money NOT NULL,
	"mechanic_id" integer NOT NULL,
	"inventory_id" integer NOT NULL,
	CONSTRAINT "car_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "salesperson" (
	"salesperson_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"dealership_id" integer NOT NULL,
	CONSTRAINT "salesperson_pk" PRIMARY KEY ("salesperson_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "mechanic" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanic_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "dealership" ADD CONSTRAINT "dealership_fk0" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id");

ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");

ALTER TABLE "car" ADD CONSTRAINT "car_fk0" FOREIGN KEY ("mechanic_id") REFERENCES "mechanic"("mechanic_id");

ALTER TABLE "car" ADD CONSTRAINT "car_fk1" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id");

ALTER TABLE "salesperson" ADD CONSTRAINT "salesperson_fk0" FOREIGN KEY ("dealership_id") REFERENCES "dealership"("dealership_id");