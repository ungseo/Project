import { useEffect, useState } from "react";
import MoviesList from "../components/MovieList";

function Movies() {
  const [movieList, setMovieList] = useState([]);
  const [loading, setLoading] = useState(false);

  const getAPI = () => {
    fetch(
      "https://yts.mx/api/v2/list_movies.json?minimum_rating=8.5&sort_by=year"
    )
      .then((res) => res.json())
      .then((res) => {
        setMovieList(res.data.movies);
        setLoading(true);
      });
  };

  useEffect(getAPI, []);
  return (
    <div>
      <h1>Movies List</h1>
      <hr />
      {loading ? (
        <div>
          {movieList.map((movie) => (
            <MoviesList movie={movie} key={movie.id} />
          ))}
        </div>
      ) : (
        <h1>로딩중입니다...</h1>
      )}
    </div>
  );
}

export default Movies;
