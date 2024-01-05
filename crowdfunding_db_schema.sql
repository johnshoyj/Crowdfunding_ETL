--Run on down in the new Database
--Then Import the CSV files into the tables
--Database:crowdfunding_db->Schema:crowdfunding_db_schema->Tables->Right click and import data on the relevant table and make sure to have header on.
--import in order of contacts->subcategory->category->campaign
--verify through view/edit data and all rows
create database crowdfunding_db;
--import this SQL file into the new database query;

CREATE SCHEMA IF NOT EXISTS crowdfunding_db_schema
    AUTHORIZATION postgres;
--run this after creating the schema	
CREATE TABLE crowdfunding_db_schema."campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);


CREATE TABLE crowdfunding_db_schema."category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);



CREATE TABLE crowdfunding_db_schema."subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);


CREATE TABLE crowdfunding_db_schema."contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);


ALTER TABLE crowdfunding_db_schema."campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES crowdfunding_db_schema."contacts" ("contact_id");

ALTER TABLE crowdfunding_db_schema."campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES crowdfunding_db_schema."category" ("category_id");


ALTER TABLE crowdfunding_db_schema."campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES crowdfunding_db_schema."subcategory" ("subcategory_id");
