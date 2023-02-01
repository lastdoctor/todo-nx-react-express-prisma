#!/bin/zsh
set -e
source ./set-env.sh

# Wait ready database
until docker exec --tty $(docker ps -aqf "name=todo-postgres") pg_isready -U postgres; do
    echo "Waiting for postgres..."
    sleep 2
done

export PSQL_PORT=11432
export PSQL_HOST=localhost
export ROOT_POSTGRES_URL=postgres://${ROOT_POSTGRES_USER}:${ROOT_POSTGRES_PASSWORD}@${PSQL_HOST}:${PSQL_PORT}/postgres?schema=public
export SERVER_POSTGRES_URL=postgres://${PSQL_USERNAME}:${PSQL_PASSWORD}@${PSQL_HOST}:${PSQL_PORT}/${PSQL_DATABASE}?schema=public
# Create all need application databases by exists match evn key and nx app name
# for app: "server" - env: SERVER_POSTGRES_URL
# for app: "core-server" - env: CORE_SERVER_POSTGRES_URL

npm run rucken -- postgres --app-database-url=$SERVER_POSTGRES_URL

# Run migrate database for specific database
cd ../
export SERVER_POSTGRES_URL=$SERVER_POSTGRES_URL
npm run migrate
prisma db pull
prisma generate
cd ./devops
