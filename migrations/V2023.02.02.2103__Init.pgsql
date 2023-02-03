create table users
(
    id    serial unique not null,
    name  varchar(255)  not null,
    email varchar(255)  not null
);

create type task_status as enum ('OPEN', 'IN_PROGRESS', 'DONE');

create table tasks
(
    id          serial unique              not null,
    title       text                       not null,
    description text                       not null,
    status      task_status default 'OPEN' not null
);
