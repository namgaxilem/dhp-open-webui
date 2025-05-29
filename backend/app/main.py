from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
import os

app = FastAPI()

# Absolute path to the frontend dist folder
dist_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../frontend/dist"))

# Mount the static assets folder (e.g. /assets, /vite.svg)
app.mount("/assets", StaticFiles(directory=os.path.join(dist_dir, "assets")), name="assets")
app.mount("/vite.svg", StaticFiles(directory=dist_dir), name="vite-svg")

# Serve the index.html on root and all other routes (for SPA routing)
@app.get("/{full_path:path}")
async def serve_spa(full_path: str, request: Request):
    index_path = os.path.join(dist_dir, "index.html")
    if os.path.exists(index_path):
        return HTMLResponse(open(index_path).read())
    return {"error": "index.html not found"}

@app.get("/")
async def root():
    index_path = os.path.join(dist_dir, "index.html")
    return HTMLResponse(open(index_path).read())
