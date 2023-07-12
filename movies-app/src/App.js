import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./routes/Home";
import Movies from "./routes/Movies";
import Detail from "./routes/Detail";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/movies" element={<Movies />} />
          <Route path="/movies/detail/:movie_id" element={<Detail />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
