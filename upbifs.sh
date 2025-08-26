#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "This script must not be run as root. Please run as a regular user."
    exit 1
fi

# Проверка существования файла
if [ ! -f "./etc/os-release" ]; then
    echo "File ./etc/os-release not found!"
    exit 1
fi

# Получение текущей даты в формате YYYYMMDD
CURRENT_DATE=$(date +%Y%m%d)

# Создание временного файла
TMP_FILE=$(mktemp)

# Обновление BUILD_ID в файле
if grep -q "^BUILD_ID=" ./etc/os-release; then
    # Если BUILD_ID уже существует - заменяем его значение
    sed "s/^BUILD_ID=.*/BUILD_ID=$CURRENT_DATE/" ./etc/os-release > "$TMP_FILE"
else
    # Если BUILD_ID нет - добавляем его в конец файла
    cp /etc/os-release "$TMP_FILE"
    echo "BUILD_ID=$CURRENT_DATE" >> "$TMP_FILE"
fi

# Замена оригинального файла
mv "$TMP_FILE" ./etc/os-release

echo "BUILD_ID successfully updated to:$CURRENT_DATE"
