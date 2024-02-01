 <!---Пример кода-->
[![Typing SVG](https://readme-typing-svg.herokuapp.com?color=%2336BCF7&lines=Computer+science+student)](https://git.io/typing-svg)

> [!CAUTION] 
> ## ЗАПУСКАТЬ СКРИПТЫ ОТ ПОЛЬЗОВАТЕЛЯ ROOT

### NGINX
   > #Установка Nginx

    sudo apt install nginx
 #
   > #Запуск Nginx

    sudo systemctl start nginx
 # 
   > #Проверка статуса
    
    sudo systemctl status nginx
 #

 ### NODE EXPORTER

   > #Скачиваем Node Exporter
    
    wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
#
   > #Распаковка архивов
   
    tar xzvf node_exporter-*.t*gz
#
   > #Добавляем пользователей
   
    useradd --no-create-home --shell /bin/false node_exporter
#

   > # Копируем файлы в /usr/local

    cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin
#    
    chown node_exporter: /usr/local/bin/node_exporter
#

### FILEBEAT

   > #Скачиваем Node Exporter

    wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.9.1-amd64.deb
#    
   > #Установка filebeat

    sudo dpkg -i filebeat-8.9.1-amd64.deb
#
> #Включаем модуль Ngnix для filebeat

    sudo filebeat modules enable nginx
#

### Настройка NGNIX
### 1. Настраиваем статические ip адреса:
   
* #### Запустить скрипт [networkd_static_ip.sh](https://github.com/rashenko/nginx-git/blob/main/networkd_static_ip.sh), он настроит статический ip

### 2. Копируем конфиги nginx:
   
* #### Запустить скрипт [nginx_script.sh](https://github.com/rashenko/nginx-git/blob/main/nginx_script.sh), он скопирует конфиг и перезапустит сервис nginx.


### 3. Установка node_exporter:
   
* #### Запустить скрипт [node_exporter.sh](https://github.com/rashenko/nginx-git/blob/main/node_exporter.sh), он установит и   настроит node_exporter

### 4. Установка Filebeat:
   
* #### Запустить скрипт [filebeat.sh](https://github.com/rashenko/nginx-git/blob/main/filebeat.sh), он установит и   настроит node_exporter


