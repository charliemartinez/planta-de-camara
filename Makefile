# Quirinux Planta de Cámara - instalación
# Programado por Charlie Martínez <cmartinez@quirinux.org> - GPLv2
# Uso:  make install DESTDIR=/ruta/staging PREFIX=/usr
PREFIX  ?= /usr
DESTDIR ?=
NAME     = quirinux-planta-de-camara

all:
	@echo "Nada que compilar (script Python + HTML). Usa 'make install' o dpkg-buildpackage."

install:
	install -Dm755 src/$(NAME)              $(DESTDIR)$(PREFIX)/bin/$(NAME)
	install -Dm644 src/planta-de-camara.html $(DESTDIR)$(PREFIX)/share/$(NAME)/planta-de-camara.html
	install -Dm644 data/$(NAME).desktop     $(DESTDIR)$(PREFIX)/share/applications/$(NAME).desktop
	install -Dm644 data/$(NAME).svg         $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/$(NAME).svg

uninstall:
	rm -f  $(DESTDIR)$(PREFIX)/bin/$(NAME)
	rm -rf $(DESTDIR)$(PREFIX)/share/$(NAME)
	rm -f  $(DESTDIR)$(PREFIX)/share/applications/$(NAME).desktop
	rm -f  $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/$(NAME).svg

.PHONY: all install uninstall
