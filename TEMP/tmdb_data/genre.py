import requests
import json

url = "https://api.themoviedb.org/3/genre/movie/list?language=ko"

headers = {
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOTQ4M2ViNzM3MDNiOWY5NmNlNmUzYjJlNjZjZWVmMyIsInN1YiI6IjYzZDMxNzQ2NjZhZTRkMDA3YmY2ZTA2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PJm7n0FWzXNNVxvP5NSykV6OFcURt_f9FO8B2jbCPMI"
}

genres = []

response = requests.get(url, headers=headers)
data = json.loads(response.text)
data_genres = data.get("genres")

for item in data_genres:
    genres.append({
        "model": "movies.genre",
        "pk": item.get("id"),
        "fields": {
            "name": item.get('name')
        }
    })

with open('genres.json', 'w', encoding='UTF-8') as f:
    f.write(json.dumps(genres, ensure_ascii=False))

f.close()