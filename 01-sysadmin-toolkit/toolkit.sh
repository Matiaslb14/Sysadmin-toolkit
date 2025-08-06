#!/bin/bash

# Toolkit Básico de Administración de Sistemas

clear
echo "====================================="
echo " 🧰 Linux Toolkit - SysAdmin Edition "
echo "====================================="
echo ""
echo "Selecciona una opción:"
echo "1) Información del sistema"
echo "2) Verificar actualizaciones"
echo "3) Ver puertos abiertos"
echo "4) Listar servicios activos"
echo "5) Ver logs del sistema"
echo "6) Hacer backup de una carpeta"
echo "7) Salir"
echo ""

read -p "Opción: " opcion

case $opcion in
  1)
    echo "[*] Información del sistema:"
    uname -a
    lscpu
    free -h
    df -h
    ;;
  2)
    echo "[*] Verificando actualizaciones del sistema..."
    sudo apt update && sudo apt upgrade -y
    ;;
  3)
    echo "[*] Puertos abiertos:"
    sudo ss -tuln
    ;;
  4)
    echo "[*] Servicios activos:"
    systemctl list-units --type=service --state=running
    ;;
  5)
    echo "[*] Logs del sistema (últimos 50):"
    sudo journalctl -n 50
    ;;
  6)
    read -p "Ingresa la ruta de la carpeta a respaldar: " carpeta
    tar -czvf backup_$(date +%F).tar.gz "$carpeta"
    echo "[+] Backup creado como backup_$(date +%F).tar.gz"
    ;;
  7)
    echo "Hasta la próxima, hacker del futuro. 🚀"
    exit 0
    ;;
  *)
    echo "❌ Opción inválida."
    ;;
esac
