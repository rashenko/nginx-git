#!/bin/bash

# Добавляем пользователей
useradd --no-create-home --shell /bin/false node_exporter

# Копируем файлы в /usr/local
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin
chown node_exporter: /usr/local/bin/node_exporter

# Копируем конфиг службы node exporter
cp /home/qqee/nginx-git/node_exporter.service /etc/systemd/system/node_exporter.service

# Перезапуск
systemctl daemon-reload

# Запускаем службу node_exporter
systemctl start node_exporter

# Проверяем статус службы node_exporter
systemctl status node_exporter

# Включаем автозапуск службы, при включении машины
systemctl enable node_exporter

# Удаляем установочные пакеты
rm -r node_exporter-1.6.1.linux-amd64.tar.gz
rm -r node_exporter-1.6.1.linux-amd64
