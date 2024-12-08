#!/bin/bash
# Instalar Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Verificar la instalación de Flutter
flutter doctor

# Construir la aplicación Flutter para la web
flutter build web
