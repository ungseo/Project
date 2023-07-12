import styles from "./App.module.css";
import { useState, useEffect } from "react";

function Hello() {
  useEffect(() => {
    console.log("created!!");
    return () => console.log("Destroyed!!");
  }, []);
  return <h1>HELLO!</h1>;
}

function App() {
  const [counter, setCounter] = useState(0);
  const [keyword, setKeyword] = useState("");
  const [showing, setShowing] = useState(false);
  const upCounter = () => setCounter((prev) => (prev += 1));
  const onChange = (event) => {
    setKeyword(event.target.value);
  };
  const onClick = () => setShowing((prev) => !prev);
  useEffect(() => {
    console.log("Call an API!");
  }, []);
  useEffect(() => {
    console.log("SEARCH FOR...", keyword);
  }, [keyword]);
  useEffect(() => {
    console.log("Change Counter");
  }, [counter]);
  return (
    <div className="App">
      <h1 className={styles.title}>hi</h1>
      <input
        type="text"
        placeholder="Search here..."
        onChange={onChange}
        value={keyword}
      />
      <p>현재까지 버튼 누른 횟수는: {counter} 입니다.</p>
      <button onClick={upCounter}>Click me!</button>
      <hr />
      <button onClick={onClick}>{showing ? "HIDE" : "SHOWING"}</button>
      {showing ? <Hello /> : null}
    </div>
  );
}

export default App;
