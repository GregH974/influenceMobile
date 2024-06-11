import logo from './logo.svg';
import './App.css';
import React from 'react';


/**
 * AuthWrapper et BrowserRouter test de login
 */
import { AuthWrapper } from './auth/AuthWrapper';
import { BrowserRouter } from 'react-router-dom';
import PrivateRoute from'./components/routing/PrivateRoute'
// import axios from 'axios'; // MyButton

// import Login from './components/auth/Login';

// 2 - login
// import Login from './Login';// <Login />

// function MyButton() {
//   function handleClick() {
//     let data = JSON.stringify({
//       "user": {
//         "email": "user4@example.com",
//         "password": "password"
//       }
//     });

//     let config = {
//       method: 'post',
//       maxBodyLength: Infinity,
//       url: 'http://localhost:3002/users/sign_in',
//       headers: {
//         'Content-Type': 'application/json',
//         'withCredentials': true
//       },
//       data : data
//     };

//     axios.request(config)
//     .then((response) => {
//       console.log(JSON.stringify(response.data));
//     })
//     .catch((error) => {
//       console.log(error);
//     });
//   }

//   return (
//     <button onClick={handleClick}>
//       Click me
//     </button>
//   );
// }

function App() {

  return (
    <main className="App">
      <header className="App-header">
        {/* <MyButton /> */}
        {/* <Login /> */}

        <BrowserRouter>
          <AuthWrapper />
        </BrowserRouter>

        <img src={logo} className="App-logo" alt="logo" />
        <h1>Assesment</h1>
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </main>

  );
}





export default App;

