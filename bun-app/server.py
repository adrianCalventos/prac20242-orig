from aiohttp import web
import os

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "src")

async def index(request):
    return web.FileResponse(os.path.join(BASE_DIR, "index.html"))

app = web.Application()
# Sirve archivos estáticos bajo /src/ y también en la raíz /
app.router.add_static('/src/', BASE_DIR, show_index=False)
app.router.add_static('/', BASE_DIR, show_index=False)
app.router.add_get('/', index)

if __name__ == '__main__':
    web.run_app(app, port=3000)
