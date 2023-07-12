import "./Login.css";
import { useState } from "react";
function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const onChange = (event: any) => {
    if (event.target.id === "email") {
      setEmail(event.target.value);
    } else if (event.target.id === "password") {
      setPassword(event.target.value);
    }
  };
  return (
    <div className="container">
      <h1>
        로그인을 하고 나면
        <br />
        좋은 일만 있을 거에요.
      </h1>
      <form action="#">
        <div id="inputBox">
          <label htmlFor="email">이메일</label>
          <input
            id="email"
            type="text"
            placeholder="example@email.com"
            onChange={onChange}
            value={email}
          />
        </div>
        <div id="inputBox">
          <label htmlFor="password">비밀번호</label>
          <input
            id="password"
            type="text"
            placeholder="password"
            value={password}
            onChange={onChange}
          />
        </div>
        <button id="login-btn">Login</button>
      </form>
      <a href="#">SNS 간편 로그인</a>

      <hr />
    </div>
  );
}

export default Login;
