# Logical database implementation

Fourth project challenge of [DIO](https://www.dio.me/) "SQL Database Specialist" course.

## 🚗 Car Workshop

- **Entities:** Client, Vehicle, Mechanic, Team, ServiceOrder, Service, Part

## 📖 Story

- Control and management system for executing work orders in a car workshop. 
- Customers take vehicles to the shop to be repaired or to go through periodic inspections.
- Each vehicle is assigned to a team of mechanics who identify the services to be performed and fill out an WO with a delivery date.
- From the WO, the price of each service is calculated, consulting a reference table.
- The price of each part will also be a part of the WO.
- The customer authorizes the execution of the services.
- The same team evaluates and performs the services. 
- Mechanics have a code, name, address and specialty.
- Each WO has: number, issue date, value ($), status and completion date.
- An WO can be made up of several services and the same service can be in more than one WO.
- An WO can have several types of parts and a part can be present in more than one WO.

## 💻 Challenge description 

For this scenario, you will use your conceptual schema, created in the DB modeling module challenge with ER model, to create the logical schema for the context of a workshop. In this challenge, you will define all the steps, from the schema to the implementation of the database. Therefore, in this project, you will be the protagonist. Take the same precautions, pointed out in the previous challenge, when modeling the schema using the relational model.

After creating the logical schema, create the SQL Script to create the database schema. Afterwards, persist the data for testing. Also specify more complex queries than those presented during the challenge explanation. Therefore, create SQL queries with the clauses below:

- Simple queries with `SELECT` Statement;
- Filters with `WHERE` Statement;
- Create expressions to generate derived attributes;
- Define data ordering with `ORDER BY`;
- Filter conditions for groups – `HAVING` Statement;
- Create joins between tables to provide a more complex perspective of the data;

## ✅ Solution

<img align="center" src="https://github.com/pedrobinelo/LogicalSchema-CarWorkshop/blob/main/er.png" width=""/> 

## 💻 Technologies 

![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-ffffff?style=for-the-badge&logo=mysql&logoColor=black)


