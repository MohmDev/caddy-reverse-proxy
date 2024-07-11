**Combine your separate frontend and backend services into one domain!**

Access the storefront from `raverclub.com` and the admin panel from `admin.raverclub.com` using Caddy as a reverse proxy.

**Storefront - Next.js:** https://raverclub.com/
**Admin Panel - Medusa Admin:** https://admin.raverclub.com/

The proxy configurations are done in the [`Caddyfile`](https://github.com/yourusername/reverse-proxy/blob/main/Caddyfile) everything is commented for your ease of use!

When deploying your Reverse Proxy service it will require you to set four service variables: **FRONTEND_DOMAIN** / **FRONTEND_PORT** and **BACKEND_DOMAIN** / **BACKEND_PORT**

**Note:** You will first need to set a fixed `PORT` variable in both the frontend and backend services before deploying this template.

These are the four template variables that you will be required to fill out during the first deployment of this service, it is highly recommended to use reference variables.

Example:

```sh
FRONTEND_DOMAIN = ${{Storefront.RAILWAY_PRIVATE_DOMAIN}}
FRONTEND_PORT = ${{Storefront.PORT}}

BACKEND_DOMAIN = ${{Backend.RAILWAY_PRIVATE_DOMAIN}}
BACKEND_PORT = ${{Backend.PORT}}
```


**Some prerequisites to help with common issues that could arise:**

- Both the frontend and backend need to listen on fixed ports, in my example project I have configured my frontend and backend to both listen on port `3000`
    - This can be done by [configuring your frontend and backend apps to listen on the `$PORT`](https://docs.railway.app/troubleshoot/fixing-common-errors) environment variable, then setting a `PORT` service variable to `3000`

- Since Railway's internal network is IPv6 only the frontend and backend apps will need to listen on `::` (all interfaces, both IPv4 and IPv6)

    **Start commands for some popular frameworks:**

    - **Next.js:** `next start -H :: --port ${PORT:-3000}`
    - **Express/Nest:** `app.listen(process.env.PORT || 3000, "::");`
