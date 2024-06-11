import { useRef, useEffect, useState, useContext } from "react";
import AuthContext from './context/AuthProvider';
import axios from './api/axios';

const LOGIN_URL = '/users/sign_in';

const Login = () => {
  const { setAuth } = useContext(AuthContext)
  const userRef = useRef();
  const errRef = useRef();

  const [user, setUser] = useState('');
  const [pwd, setPwd] = useState('');
  const [errMsg, setErrMsg] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    userRef.current.focus();
  }, []);

  useEffect(() => {
    setErrMsg('');
  }, [user, pwd]);


  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post(LOGIN_URL,
        JSON.stringify({user: {email: user, password: pwd}}),
        {
          headers: {
            'Content-Type': 'application/json',
            'withCredentials': true
          }
        }
      );

      const accessToken = JSON.stringify(response?.headers?.authorization).split(' ')[1];

      setAuth({user, pwd, accessToken});
      setUser('');
      setPwd('');
      setSuccess(true);
    } catch (err) {
      if (!err?.response) {
        setErrMsg('No server response');
      } else if (err.response?.status === 400) {
        setErrMsg('Missing Email or password');
      } else if (err.response?.status === 401) {
        setErrMsg('Unauthorized');
      } else {
        setErrMsg('Login failed');
      }
      errRef.current.focus();
    }

  }

  return (
    <>
      {success ? (
        <section>
          <h1>Your are logged in !</h1>
          <ul>
            <li>book</li>
          </ul>
          <br />
          <p>
            <a href="#">Go to home</a>
          </p>
        </section>
      ) : (
        <section>
          <p ref={errRef} className={errMsg ? "errmsg" : "offscreen"} aria-live="assertive">{errMsg}</p>
          <h1>Sign In</h1>
          <form onSubmit={handleSubmit}>
            <label htmlFor="username">Username</label>
            <input
              type="text"
              id="username"
              ref={userRef}
              autoComplete="off"
              onChange={(e) => setUser(e.target.value)}
              value={user}
              required
            />
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              onChange={(e) => setPwd(e.target.value)}
              value={pwd}
              required
            />
            <button>Sign In</button>
            <p>
              Need an Account?<br />
              <span className="line">
                <a href="#">Sign Up</a>
              </span>
            </p>
          </form>
        </section>
      )}
      </>
  )
}

export default Login;
