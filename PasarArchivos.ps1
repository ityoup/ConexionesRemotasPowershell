﻿#Se crea una variable con el hostname de la computadora a la cual se va a conectar

#Recordemos que todos estos son archivos que se encuentran dentro de una computadora local.
#Proximamente tutorial para sacar la informacion de un FTP


$Sesion = New-PSSession -ComputerName "192.168.14.3"
Copy-Item "C:\Users\jclizarraga\Desktop\Pasodearchivos\ST.exe" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\switches.drawio" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\switch.pkt" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\ippadGrand Velas\" -Destination "C:\" -ToSession -Recurse $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\Cliente\" -Destination "C:\" -ToSession -Recurse $Sesion
#MUCHO OJO SE USA LA VARIABLE QUE SE ACABA DE CREAR


foreach ($comp in $computers)
{
   Invoke-Command -computername "CC-D4P" {Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))}
}

Invoke-Command -ComputerName "CC-D4P" -ScriptBlock{

choco install tightvnc -ia 'ADDLOCAL=Server SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 SERVER_ALLOW_SAS=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=gvcc20, SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=gvcc20, SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=gvcc20,'
choco install googlechrome
choco install firefox

#si quieres agregar más, utiliza choco

}

#Puede modificarse a voluntad, dependiendo de lo que se quiera instalar de chocolatey
#Puede consultar los paquetes que se quieran instalar en: https://community.chocolatey.org/