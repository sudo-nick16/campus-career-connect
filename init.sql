drop table if exists students, applications, companies, officers;

create table if not exists students(
    id serial primary key not null,
    name varchar(50) not null,
    email varchar(50) not null,
    regId varchar(10) unique not null,
    password text not null,
    resume text default '',
    branch varchar(20) default '',
    cgpa float4 default 0.0,
    role varchar(10) default 'student'
);

create table if not exists officers(
   id serial primary key not null,
   name varchar(50) not null,
   email varchar(50) not null,
   password text not null,
   role varchar(10) default 'po'
);

create table if not exists companies(
     id serial primary key not null,
     name varchar(50) not null,
     site text default '',
     salary varchar(20) default ''
);

create table if not exists applications(
    id serial unique not null,
    studentId int not null references students(id),
    companyId int not null references companies(id) on delete cascade,
    primary key (studentId, companyId)
);

insert into officers(name, email, password) values ('po', 'po@gmail.com', 'password')
