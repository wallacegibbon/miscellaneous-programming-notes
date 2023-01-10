## Introduction

SSH is the best way to provide Git repository service as it is secure and convenient on Linux.
But on Windows, HTTP is more convenient.

## CGI

Git privides a CGI program to provide HTTP based way, the program can be found in
```
/usr/lib/git-core/git-http-backend
```

Nginx does not support CGI, but it do support **FastCGI**, with the help of `fcgiwrap`,
you can provide HTTP service with Nginx.
```
location ~ /git(/.*) {
  client_max_body_size 0;
  fastcgi_param SCRIPT_FILENAME /usr/lib/git-core/git-http-backend;
  include fastcgi_params;
  fastcgi_param GIT_HTTP_EXPORT_ALL "";
  fastcgi_param GIT_PROJECT_ROOT /home/ticp/git-repos;
  fastcgi_param PATH_INFO $1;
  fastcgi_param REMOTE_USER $remote_user;
  fastcgi_pass unix:/var/run/fcgiwrap.socket;
}
```

You may need to install **fcgiwrap** first,

```
sudo apt install fcgiwrap
```

## Node.js

There is an [npm package](https://www.npmjs.com/package/git-http-backend) that provides
HTTP Git service, which is very convenient and powerful. (you can also do `push`)
