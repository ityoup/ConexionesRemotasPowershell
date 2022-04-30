#Se crea una variable con el hostname de la computadora a la cual se va a conectar

#Recordemos que todos estos son archivos que se encuentran dentro de una computadora local.
#Proximamente tutorial para sacar la informacion de un FTP


$Sesion = New-PSSession -ComputerName "CC-D4P"
Copy-Item "C:\Users\jclizarraga\Desktop\Pasodearchivos\ST.exe" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\ansible-main" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\switch.pkt" -Destination "C:\" -ToSession $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\ippadGrand Velas\" -Destination "C:\" -ToSession -Recurse $Sesion
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\Cliente\" -Destination "C:\" -ToSession -Recurse $Sesion
#MUCHO OJO SE USA LA VARIABLE QUE SE ACABA DE CREAR


foreach ($comp in $computers)
{
   Invoke-Command -computername "CC-D4P" {Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))}
}

Invoke-Command -ComputerName "CC-D4P" -ScriptBlock{

choco install googlechrome
choco install firefox

}

#Puede modificarse a voluntad, dependiendo de lo que se quiera instalar de chocolatey
#Puede consultar los paquetes que se quieran instalar en: https://community.chocolatey.org/