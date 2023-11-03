#!/bin/bash
# Resets the local Django database, adding an admin login and migrations
set -e
echo -e "\n>>> Resetting the database"
./manage.py reset_db --close-sessions --noinput


#DUMP_FILE="~/PycharmProjects/FutsalStatTrack/docker_files/db_dumps/db.dump"
#pg_restore \
#    --clean \
#    --dbname postgres \
#    --host localhost \
#    --port 5432 \
#    --username postgres \
#    --no-owner \
#    $DUMP_FILE
pg_restore -U postgres -v -d postgres < ~/PycharmProjects/FutsalStatTrack/docker_files/db_dumps/db.dump

echo -e "\n>>> Running migrations"
./manage.py migrate

echo -e "\n>>> Creating new superuser 'admin'"
./manage.py createsuperuser \
   --username admin \
   --email admin@example.com \
   --noinput

echo -e "\n>>> Setting superuser 'admin' password to 12345"
./manage.py shell_plus --quiet-load -c "
u=User.objects.get(username='admin')
u.set_password('12345')
u.save()
"

echo -e "\n>>> Database restore finished."