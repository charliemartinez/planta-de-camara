# Quirinux Planta de Cámara

Aplicación para dibujar **plantas de cámara** de cine, animación y storyboard:
escenas y planos, cámaras con su cono de visión según la lente, actores, objetos
y flechas de movimiento. Exporta a PDF y guarda los proyectos en `.json`.

Programado por **Charlie Martínez** <cmartinez@quirinux.org> · [Quirinux GNU/Linux](https://quirinux.org)
© 2023 Charlie Martínez · Licencia **GPLv2** (ver [LICENSE](LICENSE)).

Hay dos formas de usarla, con el mismo código:

| Versión | Qué es | Archivo |
|---|---|---|
| **Online** | Un único `.html`, funciona en cualquier navegador y se puede incrustar en una web | `online/Planta_de_camara.html` |
| **Escritorio** | Ventana propia (Python + WebKitGTK) y paquete `.deb` para Quirinux/Debian/Ubuntu | `src/` |

---

## Uso rápido de la versión online

1. Abre `online/Planta_de_camara.html` con el navegador (doble clic).
2. No necesita servidor ni internet. Al abrirla empieza en blanco: **guarda tu trabajo con «Guardar»** (archivo `.json`) y recupéralo con «Abrir…».

**Para ponerla en una web (por ejemplo WordPress):** sube el archivo a tu servidor y
enlázalo, o pega su contenido en un bloque «HTML personalizado». Es un único archivo,
sin dependencias externas.

---

## Versión de escritorio

### Dependencias

```
python3, python3-gi, gir1.2-gtk-3.0, gir1.2-webkit2-4.1 | gir1.2-webkit2-4.0
```

### Probarla sin instalar

```bash
sudo apt install python3 python3-gi gir1.2-gtk-3.0 gir1.2-webkit2-4.1
./src/quirinux-planta-de-camara
```

(En sistemas más antiguos cambia `gir1.2-webkit2-4.1` por `gir1.2-webkit2-4.0`;
el programa detecta cuál hay instalado.)

### Instalarla con `make`

```bash
sudo make install          # se instala en /usr
sudo make uninstall        # para quitarla
```

### Construir e instalar el `.deb`

```bash
sudo apt install build-essential debhelper devscripts fakeroot
dpkg-buildpackage -us -uc -b
# el .deb queda un nivel por encima de esta carpeta
sudo apt install ../quirinux-planta-de-camara_1.0.9+q2_all.deb
```

Para limpiar lo que deja la construcción: `fakeroot debian/rules clean`.

---

## Cómo se usa

1. **Escena y plano:** cada escena tiene uno o más planos. Se añaden con `+ Plano` y `+ Escena` en la bandeja inferior; las miniaturas sirven para moverse entre ellos.
2. **Elementos:** `+ Cámara`, `+ Actor`, `+ Objeto…` y `+ Texto`. Haz clic en el plano para colocarlos. Arrástralos para moverlos; el círculo morado de la selección los rota.
3. **Cámaras:** elige la lente (cambia el cono de visión), cuántos **paneles (PNL)** de storyboard usa esa cámara y, si quieres, la **altura** (baja / normal / alta) y la **angulación** (normal / picada / contrapicada / cenital). Aparece un pequeño dibujo lateral junto a la cámara. Las notas de cada cámara se escriben en la tabla de la derecha.
4. **Flechas de movimiento:** pulsa `Flecha de movimiento`, elige un elemento y haz clic para marcar el recorrido. **Para terminar, pulsa Esc o haz doble clic**; hasta entonces cada clic añade un punto nuevo. Ya terminada, la flecha se edita con la herramienta *Seleccionar*.
   - Con el elemento seleccionado, el panel muestra **Recta / Curva**. En *Curva* la flecha se suaviza sola pasando por los nodos.
   - Arrastra un círculo para mover un nodo. **Arrastra la línea** para crear un nodo nuevo y doblarla.
   - Con un nodo seleccionado (modo curva) aparecen dos manijas moradas para curvar solo ese nodo; «Curva automática» las quita. «Borrar nodo» o `Supr` lo elimina.
5. **Selección múltiple:** `Mayús`+clic, o arrastrar sobre el fondo para dibujar un recuadro. Con varios elementos puedes **Agrupar**, **Duplicar**, **Copiar** y **Pegar** (también en otro plano u otra escena).
6. **Duplicar plano:** crea una copia nombrada «… (cont)», pensada para planos de continuación.
7. **PDF:** elige si quieres todas las escenas o solo la actual, y *varias plantas por página* o *una planta por página*. La información de las cámaras y las notas salen completas: si un texto no cabe, continúa en una página aparte y los planos siguientes pasan a la página siguiente.
8. **Proyectos:** `Abrir…` y `Guardar` están al principio de la barra superior. El proyecto no se guarda solo: si cierras sin pulsar «Guardar», se pierde. Al cerrar con cambios sin guardar, la aplicación avisa (el navegador en la versión web; un cuadro «Hay cambios sin guardar» en la de escritorio).

El botón **Agradecimientos** (arriba en la versión online, abajo a la derecha en la de escritorio) recoge las mejoras sugeridas por Gustavo Deveze.

### Atajos

| Atajo | Acción |
|---|---|
| Ctrl+Z / Ctrl+D | Deshacer |
| Ctrl+Y / Ctrl+Mayús+Z | Rehacer |
| Ctrl+C / Ctrl+V | Copiar / pegar elementos |
| Ctrl+A | Seleccionar todo |
| Supr | Borrar el elemento o el nodo seleccionado |
| Esc | Terminar la herramienta actual |
| Ctrl++ / Ctrl+- / Ctrl+0 | Zoom (escritorio) |
| F11 | Pantalla completa (escritorio) |
| Ctrl+Q | Salir (escritorio) |

---

## Dónde se guardan los datos (escritorio)

- Caché: `~/.cache/quirinux-planta-de-camara/`
- `Guardar` y `Generar PDF` abren un diálogo «Guardar como» (carpeta Documentos por defecto).

Desinstalar el paquete no borra esos datos.

## Problemas conocidos

- **Ventana en negro:** en algunos equipos WebKitGTK falla con el renderizador DMABUF. El programa lo desactiva por defecto; para volver a activarlo: `QPC_GPU=1 quirinux-planta-de-camara`.
- **Probar otro HTML sin reinstalar:** `QPC_HTML=/ruta/a/otro.html ./src/quirinux-planta-de-camara`.

---

## Estructura del repositorio

```
online/Planta_de_camara.html     Versión online (un solo archivo)
src/planta-de-camara.html        La aplicación para la versión de escritorio
src/quirinux-planta-de-camara    Ventana de escritorio (Python 3 + WebKitGTK)
data/                            Lanzador de menú (.desktop) e icono (.svg)
debian/                          Archivos para construir el .deb
Makefile                         install / uninstall
LICENSE                          GNU GPL versión 2
```

No hay nada que compilar. Las dos versiones comparten el mismo JavaScript; la única
diferencia es dónde se muestra el crédito (barra superior en la online, línea gris
inferior en la de escritorio).

## Publicar una nueva versión

1. Copia el `planta-de-camara.html` nuevo a `src/` (y a `online/` con su barra superior).
2. Sube el número antes del `+` en `debian/changelog` (el sufijo `+q2` no cambia):
   ```bash
   dch -v 1.0.10+q2 "Descripción del cambio"
   ```
3. Vuelve a ejecutar `dpkg-buildpackage -us -uc -b`.

Revisa antes el nombre y el correo del mantenedor en `debian/control` y `debian/changelog`.

## Licencia

Este programa es software libre: puedes redistribuirlo y/o modificarlo según los
términos de la Licencia Pública General de GNU, versión 2, publicada por la Free
Software Foundation. Se distribuye sin ninguna garantía. El texto completo está en
[LICENSE](LICENSE).
