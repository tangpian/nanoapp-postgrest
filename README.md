# nanoapp 
Lightweight rapid development scaffolding. happy solo dev.

# framework
- postgrest for backend api
- bun.js (or pnpm/npm)
- astro
- tailwindcss

# quickstart
1. modify .env for your own
1. modify docker/db/100-backend.sql
1. start backend service
1. [optional] check backend api
1. using astro fetch() to get data

# improve
- access control
- multiple tenancy

# ref
you can start your frontend by:
```
bun create astro --template asoluka/astro-commerce
```
some template:
- landing page: https://github.com/onwidget/astrowind
- admin: https://github.com/themesberg/flowbite-astro-admin-dashboard
- product: https://github.com/asoluka/astro-commerce
