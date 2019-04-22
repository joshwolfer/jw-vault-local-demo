echo "> select Host,User,password_last_changed,authentication_string from user where User like 'v-approle%';"

mysql -uroot -D mysql -t -e "select Host,User,password_last_changed,authentication_string from user where User like 'v-approle%';"

