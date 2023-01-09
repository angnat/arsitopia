CREATE SCHEMA "arsitopia";

CREATE TYPE "arsitopia"."products_status" AS ENUM (
  'out_of_stock',
  'in_stock',
  'running_low'
);

CREATE TABLE "arsitopia"."merchants" (
  "id" bigserial PRIMARY KEY,
  "country_code" int,
  "merchant_name" varchar,
  "created at" varchar,
  "admin_id" int
);

CREATE TABLE "arsitopia"."order_items" (
  "order_id" int,
  "product_id" int,
  "quantity" int DEFAULT 1
);

CREATE TABLE "arsitopia"."orders" (
  "id" int PRIMARY KEY,
  "user_id" int UNIQUE NOT NULL,
  "status" varchar,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "arsitopia"."products" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "merchant_id" int NOT NULL,
  "price" int,
  "status" arsitopia.products_status,
  "title" varchar,
  "image" varchar,
  "description" varchar,
  "rating" int,
  "isFavourite" bool,
  "colors" varchar[][],
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "arsitopia"."product_tags" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "arsitopia"."arsitek" (
  "id" bigserial PRIMARY KEY,
  "name" varchar,
  "country_code" int,
  "rating" int,
  "createdate" date,
  "createdby" varchar,
  "modifieddate" date,
  "modifiedby" varchar
);

CREATE TABLE "arsitopia"."skill" (
  "id" bigserial PRIMARY KEY,
  "skill_name" varchar,
  "createdate" date,
  "createdby" varchar,
  "modifieddate" date,
  "modifiedby" varchar
);

CREATE TABLE "arsitopia"."arsitek_skill" (
  "id" bigserial PRIMARY KEY,
  "id_arsitek" bigserial,
  "id_skill" bigserial,
  "createdate" date,
  "createdby" varchar,
  "modifieddate" date,
  "modifiedby" varchar
);

CREATE TABLE "users" (
  "id" BIGSERIAL PRIMARY KEY,
  "full_name" varchar,
  "created_at" timestamptz DEFAULT (now()),
  "country_code" int
);

CREATE TABLE "countries" (
  "code" int PRIMARY KEY,
  "name" varchar,
  "continent_name" varchar
);

CREATE INDEX "product_status" ON "arsitopia"."products" ("merchant_id", "status");

CREATE UNIQUE INDEX ON "arsitopia"."products" ("id");

COMMENT ON COLUMN "arsitopia"."orders"."created_at" IS 'When order created';

ALTER TABLE "arsitopia"."merchants" ADD FOREIGN KEY ("admin_id") REFERENCES "users" ("id");

ALTER TABLE "arsitopia"."merchants" ADD FOREIGN KEY ("country_code") REFERENCES "countries" ("code");

ALTER TABLE "arsitopia"."order_items" ADD FOREIGN KEY ("order_id") REFERENCES "arsitopia"."orders" ("id");

ALTER TABLE "arsitopia"."order_items" ADD FOREIGN KEY ("product_id") REFERENCES "arsitopia"."products" ("id");

ALTER TABLE "arsitopia"."products" ADD FOREIGN KEY ("merchant_id") REFERENCES "arsitopia"."merchants" ("id");

CREATE TABLE "arsitopia"."product_tags_products" (
  "product_tags_id" int,
  "products_id" int,
  PRIMARY KEY ("product_tags_id", "products_id")
);

ALTER TABLE "arsitopia"."product_tags_products" ADD FOREIGN KEY ("product_tags_id") REFERENCES "arsitopia"."product_tags" ("id");

ALTER TABLE "arsitopia"."product_tags_products" ADD FOREIGN KEY ("products_id") REFERENCES "arsitopia"."products" ("id");

ALTER TABLE "arsitopia"."arsitek_skill" ADD FOREIGN KEY ("id_arsitek") REFERENCES "arsitopia"."arsitek" ("id");

ALTER TABLE "arsitopia"."arsitek_skill" ADD FOREIGN KEY ("id_skill") REFERENCES "arsitopia"."skill" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("country_code") REFERENCES "countries" ("code");
