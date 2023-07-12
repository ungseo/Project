import { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";

function Detail() {
  const param = useParams();
  const [detail, setDetail] = useState({});

  const getDetail = () => {
    fetch(`https://yts.mx/api/v2/movie_details.json?movie_id=${param.movie_id}
    `)
      .then((res) => res.json())
      .then((res) => {
        setDetail(res.data.movie);
      });
  };
  useEffect(getDetail, []);

  return (
    <div>
      <h1>디테일</h1>
      <hr />
      <h1>Title: {detail.title}</h1>
      <img src={detail.large_cover_image} alt="Movie_Poster" />
      <h3>Downloaded: {detail.download_count} times</h3>
      <h5>Summary: {detail.description_full}</h5>
      <Link to="/movies">
        <button>BACK</button>
      </Link>
    </div>
  );
}

export default Detail;
