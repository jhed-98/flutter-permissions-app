# Miscelaneos

## Sección 3

Esta sección tiene por objetivo aprender sobre:

- Estado de la aplicación
  - Resumed
  - Paused
  - Detached
  - Inactive
- Reaccionar basado en el estado de la misma
- Manejo de permisos
  - Cámara
  - Localización
  - Body Sensors
  - Galería
  - Y cualquier otro permiso requerido
- Riverpod y centralización de permisos.

## Sección 4

En esta sección veremos:

- Bloqueo de orientación del teléfono
- Giroscópio
- Acelerómetro
- Magnetómetro
- Providers y Streams
- Mover Widget basado en el giroscopio
- Brújula
- Animaciones para la brújula

## Sección 5

(no se considero esta seccion x q el proyecto estaba en su ultima version)

Esta sección cuenta con sólo dos videos:

1. [Actualización de Flutter y Proyecto](https://docs.flutter.dev/release/upgrade)

2. [Revisión del Dart Fix y sugerencias](https://dart.dev/tools/dart-fix)

El objetivo es actualizar nuestro proyecto para poder utilizar la nueva sintaxis de incluye los records, desestructuración y una nueva estructura de control switch para trabar con los mismos, (entre otras cosas)

Esto lo usaremos en la siguiente sección.

## Sección 6

Esta sección es importante ya que quiero que preparemos la aplicación para realizar el deep-linking después.

Puntualmente veremos:

- Rutas con argumentos
- Peticiones HTTP
- DDD - Domain Driven Design
- FutureProviders
- Share Plus
- Y más

El objetivo es tener una aplicación real, que sirva de base para compartir páginas con IDs que luego servirán para ir directamente a la aplicación si el usuario la tiene instalada.

Esta sección tiene por objetivo crear la configuración del DeepLinking en nuestra aplicación y sitio web.

## Sección 7

Esta sección tiene por objetivo crear la configuración del DeepLinking en nuestra aplicación y sitio web.

Puntualmente veremos:

- Configuraciones para IOS y Android
- Sitio web para compartir que implementa el DeepLinking
- Desplegar sitio web en Railway
- Ejemplos de otros sitios web como Facebook
- Explicación de todo lo necesario
- Cambiar bundle ID y App ID

La sección prácticamente es lo que necesitamos para implementar esta funcionalidad.

Renombrar App ID

```
flutter pub run change_app_package_name:main com.jhedsalas.miscelaneos
```

sha-256

```
cd android
./gradlew signingReport
```

### Pruebas IOS

```
xcrun simctl openurl booted https://flutter-deep-linking-website.vercel.app/pokemons/1/

xcrun simctl openurl booted https://flutter-deep-linking-website.vercel.app/pokemons
```

## Sección 8

El objetivo de la sección es ser capaz de autenticar localmente un usuario mediante biométricos o el PIN del usuario, el cual puede desactivarse si así lo desean y forzar biométricos únicamente.

Puntualmente veremos:

1. Patrón adaptador alrededor de un paquete
2. Diversos proveedores de Riverpod (opcional) pero recomendado
3. FadeID
4. FingerPrint reader
5. Probar en Android e IOS

## Sección 9

Esta sección tiene por objetivo manejar los mapas y ubicación de usuario, junto a llaves de configuración necesarias para Google Maps.

Importante:

La parte de mapas, es sólo mostrarlo y configuraciones generales, pero en la siguiente sección haremos un control mediante código del mapa usando su controlador, y marcadores.

## Sección 10

Esta sección tiene por objetivo aprender sobre:

- Controladores del mapa
- Marcadores
- Eventos
- InfoWindow
- Seguimiento de ubicación
- Streams

Esto nos ayudará a poder controlar la forma como interactuamos con el mapa y nos dará el control que necesitamos para mover la toma, seguir el usuario, agregar marcadores, trabajar con Sets y muchas cosas más.
