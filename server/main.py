from fastapi import FastAPI
from database import engine
from routes import auth
from appmodels.appbase import Base

app = FastAPI()

app.include_router(auth.router, prefix= '/auth') 

@app.get("/url-list")
def get_all_urls():
    url_list = [{"path": route.path, "name": route.name} for route in app.routes]
    return url_list

Base.metadata.create_all(engine)
