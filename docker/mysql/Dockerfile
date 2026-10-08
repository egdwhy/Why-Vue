FROM mysql:8.0
COPY docker/mysql/conf.d/charset.cnf /etc/mysql/conf.d/charset.cnf
COPY docker/mysql/init/01-database-charset.sql /docker-entrypoint-initdb.d/01-database-charset.sql
COPY sql/why_20260417.sql /tmp/why_20260417.sql
COPY sql/quartz.sql /tmp/quartz.sql
RUN { echo "SET NAMES utf8mb4;"; cat /tmp/why_20260417.sql; } > /docker-entrypoint-initdb.d/02-why_data.sql \
 && { echo "SET NAMES utf8mb4;"; cat /tmp/quartz.sql; } > /docker-entrypoint-initdb.d/03-quartz.sql \
 && rm -f /tmp/why_20260417.sql /tmp/quartz.sql
