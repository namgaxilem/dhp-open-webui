from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
import os

app = FastAPI()

# Absolute path to the frontend dist folder
dist_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../frontend/dist"))

# Mount the static assets folder (e.g. /assets, /vite.svg)
app.mount("/about/assets", StaticFiles(directory=os.path.join(dist_dir, "assets")), name="assets")
app.mount("/about/vite.svg", StaticFiles(directory=dist_dir), name="vite-svg")

@app.get("/about/{full_path:path}")
async def serve_about_subpath(full_path: str):
    index_path = os.path.join(dist_dir, "index.html")
    return HTMLResponse(open(index_path).read())

@app.get("/about")
async def serve_about():
    index_path = os.path.join(dist_dir, "index.html")
    return HTMLResponse(open(index_path).read())

