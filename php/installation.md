# On Windows

## Apache Server

You need to **Thread Safe** version of PHP to get `php8apache2_4.dll`.

Register a Windows service:

```cmd
httpd.exe -k install -n Apache
```

Remove the service:

```cmd
sc delete Apache
```

In `httpd.conf`, add the following lines:

```conf
LoadModule php_module C:/PHP/php8apache2_4.dll

<FilesMatch \.php$>
SetHandler application/x-httpd-php
</FilesMatch>

PHPIniDir C:/PHP
```

## PHP

In `php.ini`, uncomment the following line:

```init
extension=mysqli
```


# On Linux


