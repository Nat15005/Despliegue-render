# Usar una imagen base con Maven y Java 17
FROM maven:3.8.6-jdk-17 AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código fuente al contenedor
COPY pom.xml .
COPY src ./src

# Compilar el proyecto y generar el JAR
RUN mvn clean install -DskipTests

# Usar una imagen base más ligera para la ejecución
FROM openjdk:17

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo JAR generado en la etapa anterior
COPY --from=build /app/target/microservice-0.0.1-SNAPSHOT.jar .

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "microservice-0.0.1-SNAPSHOT.jar"]