from fastapi import FastAPI
import joblib
import uvicorn

API_Key='testapikey'

app = FastAPI()

@app.get("/")
async def read_root(age :int, gender :int):
   
    model = joblib.load('music-recommender.joblib')
    predictions = model.predict([[age, gender]])
    print(predictions[0])
    return {"predictions: "+ predictions[0]}

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8001)
