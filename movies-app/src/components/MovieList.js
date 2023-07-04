import styles from "../styles/MovieList.module.css";
import { Link } from "react-router-dom";
function MovieList({ movie }) {
  return (
    <div className={styles.movieCard}>
      <img src={movie.large_cover_image} alt="MoviePoster"></img>
      <Link to={`/movies/detail/${movie.id}`}>
        <h1>Title:{movie.title}</h1>
      </Link>
      <h4>summary:{movie.summary}</h4>
    </div>
  );
}

export default MovieList;
