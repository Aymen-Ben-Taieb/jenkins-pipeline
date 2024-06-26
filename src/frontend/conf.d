server {
    listen 3000;
    server_name frontendaymen;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }

    # Reverse proxy for /api/users
    location /api/users {
        proxy_pass http://backendaymen:3700/api/users;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
