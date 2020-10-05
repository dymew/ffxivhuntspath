#!/bin/bash

set -x

mysql < /opt/ffxivhunts/database.sql
mysql -e "set PASSWORD FOR 'root'@'localhost' = PASSWORD('');"

service mysql restart
