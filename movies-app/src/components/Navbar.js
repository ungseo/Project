import { Link } from "react-router-dom";

function Navbar() {
  return (
    <div>
      <Link to="/">Home</Link> | <Link to="/movies">Movies</Link>
    </div>
  );
}

export default Navbar;
