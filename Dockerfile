# Usamos una imagen ligera de Go
FROM golang:1.22-alpine

# Instalamos 'git' por si alguna dependencia de Go lo necesita
RUN apk add --no-cache git

# Instalamos 'Air' para tener Hot Reload (recarga automática)
# Esto hace que cuando tú o tu compa guarden un archivo, el programa se reinicie solo
RUN go install github.com/air-verse/air@latest

WORKDIR /app

# Copiamos los archivos de dependencias
COPY go.mod ./
# Si ya tienes un go.sum, descomenta la siguiente línea:
# COPY go.sum ./

RUN go mod download

# Copiamos el resto del código
COPY . .

# Ejecutamos Air para iniciar la app en modo desarrollo
CMD ["air"]