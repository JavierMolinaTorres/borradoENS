# borradoENS
Script sh para borrar carpetas o disco en un sistema Windows montado sobre Linux USB live
# 🧹 Borrado Seguro ENS desde Live USB Linux

Este repositorio contiene una herramienta práctica y efectiva para realizar **borrado seguro de carpetas o discos completos** cumpliendo con los requisitos del **Esquema Nacional de Seguridad (ENS)**, utilizando `shred`.

## 📦 Contenido

- `borrado_ens.sh` — Script en Bash + Zenity para selección gráfica de carpetas
- `procedimiento.md` — Guía paso a paso para crear el entorno Live USB y usar el script

## ⚙️ Requisitos

- Live USB Linux Mint XCFE (u otra distro con GUI)
- `zenity`, `shred`, `find` (normalmente ya preinstalados)
- Pendrive de 4GB o más

## 🚀 Uso

1. Graba un Live USB de Linux Mint usando [Rufus](https://rufus.ie/) o [YUMI](https://www.pendrivelinux.com/yumi-multiboot-usb-creator/)
2. Inicia el equipo desde el Live USB
3. Descarga o transfiere este repositorio al escritorio o `/home/mint`
4. Abre Terminal y ejecuta:

```bash
chmod +x borrado_ens.sh
./borrado_ens.sh
```

5. Se abrirá una interfaz gráfica para seleccionar las carpetas que deseas borrar
6. Confirma y espera a que el borrado termine (puede tardar según tamaño)

## 🔒 Compatibilidad ENS

Este script aplica:

- `shred -n 3 -z -v`
  - 3 pasadas aleatorias
  - 1 pasada final con ceros
  - Borrado seguro lógico, conforme a los requisitos del ENS para entornos de nivel medio o alto

## 👥 Autores

- **Javier Molina** — Diseño del procedimiento y pruebas reales
- **ChatGPT (OpenAI)** — Asistencia técnica y desarrollo conjunto del script y documentación

> Este repositorio es de libre uso. Puedes adaptarlo o mejorarlo libremente citando la autoría original.

## 📄 Licencia

MIT — Libre para usar, modificar y distribuir. ¡Pero úsalo con responsabilidad!
