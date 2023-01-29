drop table if exists students, applications, companies, officers, logs cascade;

create table if not exists students(
                                   id serial primary key not null,
                                   name varchar(50) not null,
    email varchar(50) not null,
    regId varchar(10) unique not null,
    password text not null,
    resume text default '',
    branch varchar(20) default '',
    placed boolean default false not null,
    cgpa float4 default 0.0
);

create table if not exists officers(
                                       id serial primary key not null,
                                       name varchar(50) not null,
    email varchar(50) not null,
    password text not null
);

create table if not exists companies(
                                        id serial primary key not null,
                                        name varchar(50) not null,
    site text default '',
    salary varchar(20) default '',
    venue text default '',
    date timestamp
);

create table if not exists applications(
                                           id serial unique not null,
                                           studentId int not null references students(id) on delete cascade,
    companyId int not null references companies(id) on delete cascade,
    placed boolean not null default false,
    primary key (studentId, companyId)
);

create table if not exists logs(
                                   id serial unique not null,
                                   log text not null
);

-- trigger procedure
create or replace function audit_log_func() returns trigger as $trig$
begin
insert into logs(log) values(concat('New student with usn id = ' , new.regId ,' just registered.'));
return new;
end;
$trig$ language 'plpgsql';

-- trigger
create or replace trigger log
after insert on students
for each row execute procedure audit_log_func();

-- procedure
create procedure apply(sid integer, cid integer)
language sql
as $$
insert into applications(studentid, companyid) values(sid, cid);,
$$;


insert into officers(name, email, password) values ('po', 'po@gmail.com', 'password');
