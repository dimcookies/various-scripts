#!/bin/bash

array=( table1 table2 table3 )
export SRC_PG_HOST="host"
export SRC_PG_PORT=5432
export SRC_PG_DB="database"
export SRC_PG_SCHEMA="schena"
export SRC_PG_USER="username"
export DST_PG_HOST="host"
export DST_PG_PORT=5432
export DST_PG_DB="database"
export DST_PG_SCHEMA="schena"
export DST_PG_USER="password"

#in case password is common across servers, you can set it
#export PGPASSWORD="upstream"

#truncate
for i in "${array[@]}"
do
   :
	 psql -U $DST_PG_USER -h $DST_PG_HOST -p $DST_PG_PORT -d $DST_PG_DB -c "truncate $DST_PG_SCHEMA.$i cascade " 
done


#export from src and add to dst
for i in "${array[@]}"
do
   :
	pg_dump -h $SRC_PG_HOST -p $SRC_PG_PORT -U $SRC_PG_USER -a -t $SRC_PG_SCHEMA.$i  $SRC_PG_DB | psql -U $DST_PG_USER -h $DST_PG_HOST -p $DST_PG_PORT -d $DST_PG_DB
done
