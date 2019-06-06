echo "Starting mysql"
sudo service mysql start

echo "Setting up vault's grant in mysql"

passwd=`openssl rand -base64 12 | base32 | cut -b -24`
echo $passwd > .mysql-vault-passwd

sudo mysql -uroot <<EOF
DROP DATABASE IF EXISTS db1;
CREATE DATABASE db1;
GRANT ALL ON *.* to 'vault'@'localhost' IDENTIFIED BY "$passwd";
GRANT GRANT OPTION ON *.* to 'vault'@'localhost';
FLUSH PRIVILEGES;





USE db1;
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
CREATE TABLE IF NOT EXISTS users (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
EOF



