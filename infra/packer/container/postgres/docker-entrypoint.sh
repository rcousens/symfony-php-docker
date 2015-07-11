#!/bin/bash
set -e

if [ "$1" = 'postgres' ]; then
	chown -R postgres "$PGDATA"

	if [ -z "$(ls -A "$PGDATA")" ]; then
		gosu postgres initdb

		sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

		# check password first so we can ouptut the warning before postgres
		# messes it up
		if [ "$POSTGRES_PASSWORD" ]; then
			pass="PASSWORD '$POSTGRES_PASSWORD'"
			authMethod=md5
		else
			pass=
			authMethod=trust
		fi

		gosu postgres postgres --single -jE <<-EOSQL
			ALTER USER "postgres" WITH SUPERUSER $pass ;
		EOSQL
		echo

		{ echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
	fi

	exec gosu postgres "$@"
fi

exec "$@"