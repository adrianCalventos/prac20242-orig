from aiohttp import web
import os
import asyncpg

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "src")

def get_env(key, default=None):
    return os.environ.get(key, default)

async def api_recipes(request):
    try:
        conn = await asyncpg.connect(
            user=get_env("POSTGRES_USER"),
            password=get_env("POSTGRES_PASSWORD"),
            database=get_env("POSTGRES_DB", "dbname"),
            host=get_env("POSTGRES_HOST", "localhost"),
            port=int(get_env("POSTGRES_PORT", 5432)),
        )
        rows = await conn.fetch("SELECT * FROM recipes")
        receipts = [dict(row) for row in rows]
        await conn.close()
        return web.json_response({
            "receipts": receipts,
            "student": get_env("POSTGRES_USER", ""),
            "created": None
        })
    except Exception as e:
        return web.json_response({"error": str(e)}, status=500)

async def spa_handler(request):
    # Intenta servir el archivo si existe, si no, sirve index.html
    path = request.match_info.get('path', '')
    file_path = os.path.join(BASE_DIR, path)
    if os.path.isfile(file_path):
        return web.FileResponse(file_path)
    return web.FileResponse(os.path.join(BASE_DIR, "index.html"))

app = web.Application()
app.router.add_get('/api/recipes', api_recipes)
# Middleware SPA: sirve archivos estáticos o index.html
app.router.add_get('/{path:.*}', spa_handler)

if __name__ == '__main__':
    web.run_app(app, port=3000)
