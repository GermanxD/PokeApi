# Pokédex Flutter App

Esta es una aplicación de Pokédex desarrollada en Flutter que utiliza la PokéAPI para mostrar información sobre los diferentes Pokémon.

## Características
- Lista de Pokémon con imágenes y nombres.
- Búsqueda de Pokémon por nombre o ID.
- Detalles de cada Pokémon, incluyendo tipo, habilidades y estadísticas.
- Interfaz atractiva y responsiva.

## Tecnologías utilizadas
- **Flutter**: Framework de UI para el desarrollo de aplicaciones móviles.
- **Dart**: Lenguaje de programación utilizado en Flutter.
- **PokéAPI**: API utilizada para obtener información de los Pokémon.
- **HTTP Package**: Para realizar solicitudes a la API.

## Instalación
1. Clona este repositorio:
   ```sh
   git clone https://github.com/tu-usuario/PokeApi.git
   ```
2. Navega al directorio del proyecto:
   ```sh
   cd poke_api
   ```
3. Instala las dependencias:
   ```sh
   flutter pub get
   ```
4. Ejecuta la aplicación en un emulador o dispositivo físico:
   ```sh
   flutter run
   ```

## Uso de la API
La aplicación obtiene datos desde la [PokéAPI](https://pokeapi.co/). Ejemplo de una petición para obtener información de Pikachu:
```dart
final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'));
if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  print(data);
} else {
  throw Exception('Error al cargar datos de la API');
}
```

## Contribución
Si deseas contribuir:
1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature-nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -m "Agrega nueva funcionalidad"`).
4. Sube tus cambios (`git push origin feature-nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia
Este proyecto está bajo la licencia MIT.

---
**Desarrollado con Flutter y PokéAPI** 🌟

