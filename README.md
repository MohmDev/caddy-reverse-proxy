**Combine your separate frontend and backend services into one domain!**

Access the storefront from `raverclub.com` and the admin panel from `admin.raverclub.com` using Caddy as a reverse proxy.

**Storefront - Next.js:** https://raverclub.com/
**Admin Panel - Medusa Admin:** https://admin.raverclub.com/

The proxy configurations are done in the [`Caddyfile`](https://github.com/yourusername/reverse-proxy/blob/main/Caddyfile) everything is commented for your ease of use!

When deploying your Reverse Proxy service it will require you to set four service variables: **FRONTEND_DOMAIN** / **FRONTEND_PORT** and **BACKEND_DOMAIN** / **BACKEND_PORT**

**Note:** You will first need to set a fixed `PORT` variable in both the frontend and backend services before deploying this template.

These are the four template variables that you will be required to fill out during the first deployment of this service, it is highly recommended to use reference variables.