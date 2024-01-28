#!/bin/bash

DIR='/etc/nginx/sites-available/'
DIR1='/home/qqee/nginx-git/default'
DIR2='/etc/nginx/sites-available/default'

cp $DIR1 $DIR2
echo "Конфиг default, Nginx сервиса скопирован по пути $DIR"
nginx -t
if [ $? -eq 0 ]; then
        echo "Сервис Nginx настроен и готов к работе!"
        nginx -s reload
else
        echo "Возникла ошибка!"
fi
