
# 1. Usamos la imagen oficial de Java 21 que descargaste por PowerShell
FROM eclipse-temurin:21-jre

# 2. Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiamos el archivo compilado .jar que va a generar Maven
COPY target/*.jar app.jar

# 4. Le indicamos a Docker cómo debe arrancar el programa
ENTRYPOINT ["java", "-jar", "app.jar"]