#!/bin/bash
# Borrado Seguro ENS
# Autor: Javier Molina
# Co-desarrollado con asistencia técnica de ChatGPT (OpenAI)
# Fecha: 2025-07-08
# Descripción: Este script permite el borrado seguro de carpetas seleccionadas
# mediante interfaz gráfica con Zenity, cumpliendo con los requisitos del
# Esquema Nacional de Seguridad (ENS) usando shred -n 3 -z -v.


LOGFILE="/var/log/ens_borrado.log"
ENS_OPTIONS="-n 3 -z -v"

log_action() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

# Selector gráfico de carpetas (múltiple)
SELECCIONADOS=$(zenity --file-selection --directory --multiple \
  --separator=" " --title="Selecciona carpetas a borrar con método ENS" \
  --filename="/media/" 2>/dev/null)

if [[ -z "$SELECCIONADOS" ]]; then
    zenity --info --text="No se seleccionaron carpetas." 2>/dev/null
    exit 0
fi

zenity --question \
  --text="¿Seguro que quieres BORRAR las carpetas seleccionadas con método ENS?\n\n$SELECCIONADOS" \
  --width=400 2>/dev/null

if [[ $? -ne 0 ]]; then
    log_action "Cancelado por el usuario."
    exit 0
fi

for DIR in $SELECCIONADOS; do
    if [[ -d "$DIR" ]]; then
        log_action "Borrando carpeta: $DIR"
        find "$DIR" -type f -exec shred $ENS_OPTIONS {} \; -exec rm -f {} \;
        find "$DIR" -depth -type d -exec rmdir --ignore-fail-on-non-empty {} \; 2>/dev/null
        log_action "Borrado completado de: $DIR"
    else
        log_action "No se encontró el directorio: $DIR"
    fi
done

zenity --info --text="Borrado completado." 2>/dev/null
