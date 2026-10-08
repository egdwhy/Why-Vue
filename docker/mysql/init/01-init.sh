#!/bin/bash
set -e
echo "Importing why-vue schema and data..."
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" why-vue < /opt/sql/why_20260417.sql
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" why-vue < /opt/sql/quartz.sql
echo "MySQL init done."
