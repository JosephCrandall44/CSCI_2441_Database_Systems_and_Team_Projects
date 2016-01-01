/* If all tables need to be cleared...
drop table if exists Properties cascade;
drop table if exists Specifications cascade;
drop table if exists Owners cascade;
drop table if exists Buyers cascade;
drop table if exists Agents cascade;
drop table if exists Agencies cascade;
drop table if exists Contractors cascade;
drop table if exists Visitors cascade;
drop table if exists Cities cascade;
drop table if exists Universities cascade;
*/

drop table if exists Properties cascade;
create table Properties (
	property_ID 	varchar(6) primary key,
	owner_SSN 		int(9),
	agent_SSN 		int(9),
	contractor_ID 	varchar(6) );

drop table if exists Specifications cascade;
create table Specifications (
	property_ID 	varchar(6) primary key,
	city 			varchar(30),
	price 			double,
	sqft 			int(9) );

drop table if exists Owners cascade;
create table Owners (
	SSN 		int(9) primary key,
	owner_name 	varchar(30),
	city 		varchar(30)
	CHECK (SSN>0) );

drop table if exists Buyers cascade;
create table Buyers (
	SSN 		int(9) primary key,
	buyer_name 	varchar(30),
	city 		varchar(30),
	budget 		double,
	CHECK (SSN>0) );

drop table if exists Agents cascade;
create table Agents (
	SSN 		int(9) primary key,
	agent_name 	varchar(30),
	agency_ID 	varchar(6),
	CHECK (SSN>0) );

drop table if exists Agencies cascade;
create table Agencies (
	agency_ID 	varchar(6) primary key,
	agency_name varchar(30),
	rating 		int(2) );

drop table if exists Contractors cascade;
create table Contractors (
	contractor_ID 	varchar(6) primary key,
	contractor_name varchar(30),
	rating 			int(2) );

drop table if exists Visitors cascade;
create table Visitors (
	log_ID 		varchar(6) primary key,
	property_ID varchar(6),
	buyer_SSN 	int(9) );

drop table if exists Cities cascade;
create table Cities (
	city_name 	varchar(30) primary key,
	population 	int(9),
	avg_income 	double );

drop table if exists Universities cascade;
create table Universities (
	uni_ID 		varchar(6) primary key,
	uni_name 	varchar(50),
	city 		varchar(30));
