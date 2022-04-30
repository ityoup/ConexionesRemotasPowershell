#Recibir archivos
#Se crea una nueva sesión en el cliente de powershell
$Computadora1 = New-PSSession -ComputerName "Insertar Hostname" #Se escribe el hostname de la computadora

#Se verifica que se haya creado la sesión
Get-PSSession

#Deberá salir la sesión con todo y su respectivo ID, nombre, etc