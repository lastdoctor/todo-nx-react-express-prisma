CREATE TABLE IF NOT EXISTS "Users"
(
    id       SERIAL       NOT NULL,
    name     VARCHAR(255) NOT NULL,
    password VARCHAR      NOT NULL,
    email    VARCHAR(255) NOT NULL,
    CONSTRAINT "PK_USERS" PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS "IDX_USERS__NAME" ON "Users" (name);

CREATE TYPE "TaskStatus" AS ENUM ('OPEN', 'IN_PROGRESS', 'DONE');

CREATE TABLE IF NOT EXISTS "Tasks"
(
    id          SERIAL                      NOT NULL,
    title       TEXT                        NOT NULL,
    description TEXT                        NOT NULL,
    status      "TaskStatus" DEFAULT 'OPEN' NOT NULL,
    userId      INTEGER                     NOT NULL,
    CONSTRAINT "PK_TASKS" PRIMARY KEY (id),
    CONSTRAINT "FK_TASKS__USER_ID" FOREIGN KEY (userId) REFERENCES "Users" ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS "IDX_TASKS__TITLE" ON "Tasks" (title);
CREATE INDEX IF NOT EXISTS "IDX_TASKS__DESCRIPTION" ON "Tasks" (description);
