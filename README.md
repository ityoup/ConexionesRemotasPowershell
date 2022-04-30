# Conexiones remotas con Powershell
## Usando chocolatey
### By: Ityoup (JCLG)

### ¿Cómo utilizarlo?

Podemos encontrar 3 archivos, uno que servirá como emisor y otro como receptor.

Primero que nada. Debemos de tener activado WinRM en las computadoras a las cuales van a compartir archivos.
Para activarlo, basta con ejecutar como administrador powershell, y escribir el siguiente comando:

### WinRM quickconfig
(WinRM es un protocolo de maquinas remotas que permite la comunicación e intercambio de información entre computadoras windows)

Una vez activado, en la computadora la cual recibirá los datos, editamos el archivo "RecibirArchivos.ps1"

Y sigué los comentarios que vienen en el archivo.

Se ejecuta el archivo, una vez que haya modificado los datos.

Finalmente abre el archivo "PasarArchivos.ps1", modifica los parametros como indican los comentarios y listo

# Ya tiene los archivos en otra computadora remota

 