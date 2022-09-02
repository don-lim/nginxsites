
server {

	server_name pwa.culturetech.com;

	root /var/www/pwa.culturetech.com/public_html;
	index index.php index.html;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.0-fpm.sock;
	}

	location ~ /\.ht {
		deny all;
	}
}
