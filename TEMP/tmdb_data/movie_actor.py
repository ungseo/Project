import requests
import json


headers = {
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOTQ4M2ViNzM3MDNiOWY5NmNlNmUzYjJlNjZjZWVmMyIsInN1YiI6IjYzZDMxNzQ2NjZhZTRkMDA3YmY2ZTA2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PJm7n0FWzXNNVxvP5NSykV6OFcURt_f9FO8B2jbCPMI"
}

movies = []
actors_name = set()
actors = []
cnt = 0

for i in range(1, 51):
    url = f"https://api.themoviedb.org/3/movie/popular?language=ko-KR&page={i}"

    response = requests.get(url, headers=headers)
    data = json.loads(response.text)
    data_results = data.get('results')

    for item in data_results:
        temp = {
            "model": "movies.movie",
            "pk": item.get('id', ""),
            "fields": {
                "title": item.get('title', ""),
                "original_title": item.get('original_title', ""),
                "release_date": item.get("release_date", ""),
                "popularity": item.get('popularity', 0),
                "vote_count": item.get('vote_count', 0),
                "vote_average": item.get('vote_average', 0),
                "overview": item.get('overview', ""),
                "poster_path": item.get('poster_path', ""),
                "genres": item.get('genre_ids', [])
            }
        }

        temp_id = item.get("id")

        TF = True
        fields = temp.get('fields')
        
        for key, value in fields.items():
            if key == "genres":
                if len(value) == 0:
                    TF = False
                    break
            elif key in ("popularity", "vote_count", "vote_average"):
                if value == 0:
                    TF = False
                    break
            else:
                if value.strip() == "":
                    TF = False
                    break

        if TF:
            cnt += 1
            temp['fields']["actors"] = []
            
            url2 = f"https://api.themoviedb.org/3/movie/{temp_id}/credits?language=ko"
            headers2 = {
                "accept": "application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOTQ4M2ViNzM3MDNiOWY5NmNlNmUzYjJlNjZjZWVmMyIsInN1YiI6IjYzZDMxNzQ2NjZhZTRkMDA3YmY2ZTA2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PJm7n0FWzXNNVxvP5NSykV6OFcURt_f9FO8B2jbCPMI"
            }

            ACT_raw = requests.get(url2, headers=headers)
            ACT = json.loads(ACT_raw.text)
            ACT_cast = ACT.get("cast")
            
            # print(ACT_cast[0].get("name"))
            
            actor_cnt = 0
            for item in ACT_cast:
                if item["known_for_department"] == "Acting":
                    if item.get("name", "") and item.get("character", "") and item.get("profile_path", ""):
                        actor_cnt += 1
                        if actor_cnt > 5:
                            break

                        temp['fields']["actors"].append(item.get('id'))

                        if item["name"] not in actors_name:
                            actors_name.add(item["name"])
                            actors.append({
                                "model": "movies.actor",
                                "pk": item.get("id"),
                                "fields": {
                                    "name": item.get("name", ""),
                                    "profile_path": item.get("profile_path", "")
                                }
                            })

            movies.append(temp)

# print(movies[0]['fields']['vote_average'])

with open('movies.json', 'w', encoding='UTF-8') as f:
    f.write(json.dumps(movies, ensure_ascii=False))

f.close()

actors = list(actors)
with open('actors.json', 'w', encoding='UTF-8') as f:
    f.write(json.dumps(actors, ensure_ascii=False))

f.close()

print(cnt)

# https://image.tmdb.org/t/p/original/89OXTk0ZHdoctE5axV9E7b1Nowf.jpg