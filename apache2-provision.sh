# Copiar el apache2.conf
cp -v /vagrant/files/mercurio.olimpo.test/apache2.conf /etc/apache2/apache2.conf

# Copiar VirtualHosts
cp -v /vagrant/files/mercurio.olimpo.test/apolo.olimpo.test.conf /etc/apache2/sites-available/
cp -v /vagrant/files/mercurio.olimpo.test/atenea.olimpo.test.conf /etc/apache2/sites-available/

# Habilitar módulos necesarios
a2enmod autoindex
a2enmod dir

# Activar los sitios
a2ensite apolo.olimpo.test.conf
a2ensite atenea.olimpo.test.conf

# Desactivar el sitio por defecto
a2dissite 000-default.conf

# Aplicar permisos correctos a las carpetas sincronizadas
chown -R www-data:www-data /var/www

# Reiniciar Apache
systemctl restart apache2