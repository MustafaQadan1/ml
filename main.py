import os
from fastapi import FastAPI
import joblib
import uvicorn

app = FastAPI()

# Load API key from environment variable
  # Change "default_key" to a safer default if needed

@app.get("/")
async def read_root(age: int, gender: int, key: str):
    if key != API_KEY:
        return {"error": "Invalid API Key"}

    model = joblib.load("music-recommender.joblib")
    predictions = model.predict([[age, gender]])
    
    return {"predictions": predictions[0]}

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8001)

