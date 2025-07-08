PROCEDIMIENTO PARA EL BORRADO DE DISCOS COMPLETOS O CARPETAS COMPATIBLES CON EL ESQUEMA NACIONAL DE SEGURIDAD (ENS)

Con objeto de borrar de forma segura discos completos o carpetas específicas en cumplimientos del ENS la mejor manera de conseguirlo consiste en montar el ordenador a borrar dentro de un operativo completo Linux construido en un USB. Desde dicho operativo podremos acceder a los archivos y carpetas borrándolos sin problema. 
El script utiliza shred, compliant con el ENS.
Para el borrado debemos disponer de :
1.	Pendrive con al menos 4GB de capacidad
2.	Live USB Linux Mint XCFE (o cualquier otra distribución Linux con o sin GUI)
3.	Rufus o Yumi

•	Descargamos Live USB Linux Mint XCFE (o similar) : https://linuxmint.com/
•	Descargamos (si no disponemos del mismo) Rufus o Yumi
•	Procedemos a generar una iso instalable en el USB

 

•	Es importante fijar un Tamaño de partición persistente (puede ser 100, 500 ó 1000 MB, dependiendo del pendrive que utilicéis) para almacenar software adicional que se pudiera necesitar.  Generalmente Linux Mint o Ubuntu Desktop suelen venir bastante completos pero no está de más prevenir eventualidades.
•	Una vez hemos grabado el iso procedemos a cambiar la BIOS del ordenador a borrar de manera que el boot comience por el usb. Esto se logra reiniciando la máquina y pulsando F2, F12 o Supr, dependiendo del modelo, teniendo ya instalado el pendrive en la ranura.
•	 Si todo ha ido bien se iniciará Linux Mint como operativo del sistema, quedando Windows en la carpeta /home/mint/media   
•	La carga del operativo puede llevar entre 3 y 5 minutos, dependiendo de la máquina que estéis empleando.
•	Cuando cargue aparecerá un escritorio parecido a Windows.
•	En la barra inferior pulsamos sobre la carpeta que abre el explorador de archivos (similar al que podemos encontrar en Windows10/11). Lo emplearemos para buscar de manera fácil la carpeta que queremos borrar. Si por ejemplo queremos borrar el directorio de un usuario llamado “Miguel”, iremos hasta /home/mint/media/22121212/Users/Miguel  Nos cercioraremos de que es esa la carpeta que de verdad queremos borrar.
•	Ahora abrimos un Terminal (barra inferior) para introducir comandos por CLI. Lo primero que haremos será crear una clave para el superusuario

•	sudo passwd root

•	Si fuera necesario, crearemos la conexión de red del ordenador en Linux (por si se tuviera que descargar algún programa).

•	Descargamos o cargamos por medio de otro pendrive el archivo borrado_ens.sh y lo situamos en la carpeta /home/mint

•	En el terminal nos movemos hasta /home/mint ($cd /home/mint ) y pasamos a superusuario :  $su 

•	Damos permiso de ejecución a borrado_ens.sh :  # chmod +x borrado_ens.sh

•	Ejecutamos el script con # ./borrado_ens.sh

•	Se abrirá un navegador que nos permitirá ir hasta el disco o carpeta a borrar (recordad que siempre estará en /home/mint/media….)

•	Pulsamos sobre la carpeta y nos pide confirmar el borrado. Damos ok y comenzará el mismo, con líneas que empezarán con “shred /home/mint/media/232323…434/User/Miguel (o la carpeta que hayáis elegido).

•	El borrado podrá tomar pocos minutos u horas, dependiendo de la cantidad de archivos.

•	Terminado el proceso podemos apagar el ordenador, extraer el pendrive e iniciar de nuevo la máquina o cargarle otro operativo, según deseemos.


