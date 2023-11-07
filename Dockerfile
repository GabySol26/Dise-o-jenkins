FROM httpd:2.4
COPY index.html  /usr/local/apache2/htdocs/index.html
COPY Citas.html  /usr/local/apache2/htdocs/Citas.html
COPY Compras.html  /usr/local/apache2/htdocs/Compras.html
COPY Especialidades.html  /usr/local/apache2/htdocs/Especialidades.html
COPY Medicamentos.html  /usr/local/apache2/htdocs/Medicamentos.html
COPY Medicos.html  /usr/local/apache2/htdocs/Medicos.html
COPY menuM.html  /usr/local/apache2/htdocs/menuM.html
COPY menuP.html  /usr/local/apache2/htdocs/menuP.html
COPY Pacientes.html  /usr/local/apache2/htdocs/Pacientes.html
COPY Schedules.html  /usr/local/apache2/htdocs/Schedules.html
COPY Tratamientos.html  /usr/local/apache2/htdocs/Tratamientos.html
COPY style.css /usr/local/apache2/htdocs/style.css
COPY styles.css /usr/local/apache2/htdocs/styles.css