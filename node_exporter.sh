#!/bin/bash

# Копируем конфиг службы node exporter
cp /home/qqee/backend1-git/node_exporter.service /etc/systemd/system/node_exporter.service

# Перезапуск
systemctl daemon-reload

# Запускаем службу node_exporter
systemctl start node_exporter

# Проверяем статус службы node_exporter
systemctl status node_exporter

# Включаем автозапуск службы, при включении машины
systemctl enable node_exporter
