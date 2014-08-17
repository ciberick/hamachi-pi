#!/bin/bash
echo "Instalando Requerimientos"
sudo apt-get update
sudo apt-get -y install --fix-missing lsb lsb-core
echo "Descargando Hamachi"
sudo wget https://www.dropbox.com/s/yd471cw4u800tgq/logmein-hamachi-2.1.0.101-armel.tgz
echo "Extrayendo Hamachi"
tar xzvf logmein-hamachi-2.1.0.101-armel.tgz
cd log*
echo "Instalando hamachi"
sudo ./install.sh
/etc/init.d/logmein-hamachi start
echo "Instalando chkconfig"
sudo apt-get -y install chkconfig
sudo  chkconfig -s logmein-hamachi 2
echo "Iniciando hamachi"
sudo hamachi login
echo "Ingresar cuenta de logmein (email address)"
read email
sudo hamachi attach $email
echo "Ingresar un sobrenombre para el raspberry pi (nickname)"
read nick
sudo hamachi set-nick $nick
echo "Hamachi Instalado Correctamente"
