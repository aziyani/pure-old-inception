#!/bin/bash
# This is called a shebang. 
# It tells the system that this script should be executed using the bash shell.

#clears any cached privileges
echo "FLUSH PRIVILEGES;" > file.sql

#creates a new database
echo "CREATE DATABASE IF NOT EXISTS $DATABASE ;" >> file.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTPASSWORD' ;" >> file.sql

echo "CREATE USER IF NOT EXISTS '$USERNAME'@'%' IDENTIFIED BY '$USERPASSWORD' ;" >> file.sql

echo "GRANT ALL PRIVILEGES ON *.* TO '$USERNAME'@'%' ;" >> file.sql

echo "FLUSH PRIVILEGES;" >> file.sql

mariadbd -u mysql --bootstrap < file.sql

rm -f file.sql

exec "$@"


#!/bin/bash
# This is called a shebang. 
# It tells the system that this script should be executed using the bash shell.

#clears any cached privileges
echo "\
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DATABASE;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTPASSWORD';
CREATE USER IF NOT EXISTS '$USERNAME'@'%' IDENTIFIED BY '$USERPASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$USERNAME'@'%';
FLUSH PRIVILEGES;" > file.sql

mariadbd -u mysql --bootstrap < file.sql

rm -f file.sql

exec "$@"
