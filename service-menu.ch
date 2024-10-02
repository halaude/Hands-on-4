#!/bin/bash

# Función para listar el contenido de un fichero (carpeta)
function listar_contenido() {
    echo "Introduce la ruta absoluta del directorio:"
    read ruta
    if [ -d "$ruta" ]; then
        echo "Contenido de $ruta:"
        ls "$ruta"
    else
        echo "El directorio $ruta no existe."
    fi
}

# Función para crear un archivo de texto con una línea de texto
function crear_archivo() {
    echo "Introduce la cadena de texto que deseas almacenar en el archivo:"
    read texto
    echo "Introduce la ruta completa donde se guardará el archivo (incluyendo el nombre del archivo):"
    read archivo
    echo "$texto" > "$archivo"
    echo "Archivo $archivo creado con éxito."
}

# Función para comparar dos archivos de texto
function comparar_archivos() {
    echo "Introduce la ruta completa del primer archivo:"
    read archivo1
    echo "Introduce la ruta completa del segundo archivo:"
    read archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Función para mostrar ejemplos del uso de awk
function usar_awk() {
    echo "Introduce la ruta de un archivo para ejecutar un comando simple de awk (mostrar la primera columna):"
    read archivo
    if [ -f "$archivo" ]; then
        awk '{print $1}' "$archivo"
    else
        echo "El archivo $archivo no existe."
    fi
}

# Función para mostrar ejemplos del uso de grep
function usar_grep() {
    echo "Introduce la cade de texto a buscar:"
    read cadena
    echo "Introduce la ruta del archivo donde buscar la cadena:"
    read archivo
    if [ -f "$archivo" ]; then
        grep "$cadena" "$archivo"
    else
        echo "El archivo $archivo no existe."
    fi
}

# Menú de opcones
while true; do
    echo "----- Menú de Servicios -----"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso de awk"
    echo "5. Mostrar uso de grep"
    echo "6. Salir"
    echo "Elige una opción:"
    read opcion

    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) usar_awk ;;
        5) usar_grep ;;
        6) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida, por favor elige una opción del 1 al 6." ;;
    esac
done

#no olvides los permisos chmod +x services-menu.sh
#se ejecuta asi ./services-menu.sh

