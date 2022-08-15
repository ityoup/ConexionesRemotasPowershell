#Se crea una variable con el hostname de la computadora a la cual se va a conectar

#Recordemos que todos estos son archivos que se encuentran dentro de una computadora local.
#Proximamente tutorial para sacar la informacion de un FTP
        
$Hostname = "DESKTOP-643UEIK" #Use de hostname

#$Mucha = Get-Content "C:\Users\jclizarraga\Desktop\hostnames\Hostnames.txt"

#Un método especial para la carpeta de instalación

$Sesion = New-PSSession -ComputerName $Hostname
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\Cliente.zip" -Destination "C:\" -ToSession -Force $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\Cliente.zip" -DestinationPath "C:\"
Remove-Item -Path "C:\Cliente.zip" -Force
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\tiCERO.RN\Desktop\Innsist.lnk")
$Shortcut.TargetPath = "C:\Cliente\TCAFrontOffice.exe"
$Shortcut.Save()
}

#Metodo para pasar ClienteRM y crear acceso directo
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\ClienteRM.zip" -Destination "C:\" -ToSession -Force $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\ClienteRM.zip" -DestinationPath "C:\"
Remove-Item -Path "C:\ClienteRM.zip" -Force
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\practicanteti\Desktop\RM.lnk")
$Shortcut.TargetPath = "C:\ClienteRM\TCAFrontOffice.exe"
$Shortcut.Save()
}

#Metodo para la carpeta de mitrol
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\ippad Grand Velas.zip" -Destination "C:\" -ToSession -Recurse $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\ippad Grand Velas.zip" -DestinationPath "C:\"
Remove-Item -Path "C:\ippadGrand Velas.zip" -Force
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\tiCERO.RN\Desktop\Mitrol.lnk")
$Shortcut.TargetPath = "C:\ippad Grand Velas\Mitrol.CT.Agent.Windows.exe"
$Shortcut.Save()
}

#Instalación de Chocolatey
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y tightvnc -ia 'ADDLOCAL=Server SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 SERVER_ALLOW_SAS=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=gvcc20, SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=gvcc20, SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=gvcc20,'
choco install googlechrome
choco install firefox
#si quieres agregar más, utiliza choco
}

#Instalador de Office 
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\office2007.zip" -Destination "C:\" -ToSession -Recurse $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\office2007.zip" -DestinationPath "C:\"
C:\office2007\install.msp /adminfile install.msp
Remove-Item -Path "C:\office2007.zip" -Force
Remove-Item -Path "C:\office2007\" -Force
}


#Softphone
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\SoftPhone.zip" -Destination "C:\" -ToSession -Recurse $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\SoftPhone.zip" -DestinationPath "C:\"
Remove-Item -Path "C:\SoftPhone.zip" -Force
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\tiCERO.RN\Desktop\Telefono.lnk")
$Shortcut.TargetPath = "C:\ippadGrand Velas\Mitrol.CT.Agent.Windows.exe"
$Shortcut.Save()
}


#Instalador de vcreditsMit
Copy-Item "C:\Users\jclizarraga\Desktop\instalaciones\vcredistMit.zip" -Destination "C:\" -ToSession -Recurse $Sesion
Invoke-Command -ComputerName $Hostname -ScriptBlock{
Expand-Archive -LiteralPath "C:\vcredistMit.zip" -DestinationPath "C:\"
C:\vcredistMit\install_all.bat
Remove-Item -Path "C:\vcredistMit.zip" -Force
Remove-Item -Path "C:\vcredistMit\" -Force
C:\vcredistMit\install_all.bat /adminfile install_all.bat

}




#Puede modificarse a voluntad, dependiendo de lo que se quiera instalar de chocolatey
#Puede consultar los paquetes que se quieran instalar en: https://community.chocolatey.org/