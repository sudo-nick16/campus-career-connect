### Campus Career Connect

A simple web-based application for streamlining the placement process for educational institutions.
Built using Servlet and JSP technologies, this application allows placement officers to easily manage and
organize several aspects of the placement process, from creating job listings and tracking application.

#### How to run this on your system?
- Install jdk and maven on your system.
- Install docker. 
- cd into the project's root directory.
- Execute the following commands.

```
mvn clean package

docker compose up -d

cat ./init.sql | docker exec -i postgresql_ccc psql -U root -d ccc

```


