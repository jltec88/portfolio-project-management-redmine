FROM redmine:4.2

# Instalar el adaptador de PostgreSQL
RUN apt-get update && apt-get install -y postgresql-client

# Copiar la carpeta descomprimida del plugin al contenedor
COPY ./plugins/redmine_agile /usr/src/redmine/plugins/redmine_agile

# Instalar las dependencias del plugin
RUN cd /usr/src/redmine && bundle install --without development test

# Configurar el archivo de configuración de la base de datos
COPY database.yml /usr/src/redmine/config/database.yml

# Configurar el archivo de configuración del correo electrónico
COPY configuration.yml /usr/src/redmine/config/configuration.yml

# No hacer la migración aquí, se hará manualmente más tarde.