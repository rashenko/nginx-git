#!/bin/bash

file_path="/etc/filebeat/filebeat.yml"
module_path="/etc/filebeat/modules.d/nginx.yml"
gz="prospector.scanner.exclude_files: ['.gz$']"

# Замена строк в файле
sed -i "s|- type: .*|- type: log|g" "$file_path"
sed -i "s|  enabled: .*|  enabled: true|g" "$file_path"
sed -i "s|    - /var/log/[^.]*.log|    - /var/log/nginx/*.log|g" "$file_path"
sed -i "s|#prospector.scanner.exclude_files: .*|$gz|g" "$file_path"
sed -i "s|output.elasticsearch:|#output.elasticsearch:|g" "$file_path"
sed -i "s|#output.logstash:|output.logstash:|g" "$file_path"
sed -i "s|  #hosts: .*|  hosts: ["192.168.1.14:5400"]|g" "$file_path"

# Добавление параметра exclude_files в конфигурационный файл, если он отсутствует
if [ -f "$file_path" ]; then
    if ! grep -q "exclude_files" "$file_path"; then
        echo "exclude_files: \['.gz$'\]" >> "$file_path"
    fi
fi

# Замена строк в файле
sed -i '/error:/,/enabled:/ s/enabled: .*/enabled: true/g' "$module_path"
sed -i '/access:/,/enabled:/ s/enabled: .*/enabled: true/g' "$module_path"

# Запуск сервиса Filebeat
systemctl restart filebeat

# Проверяем статус сервиса Filebeat
systemctl status filebeat
