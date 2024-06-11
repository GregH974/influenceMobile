import { createContext, useContext, useState } from "react"
import { RenderHeader } from "../components/structure/Header";
import { RenderMenu, RenderRoutes } from "../components/structure/RenderNavigation";
import axios from '../api/axios';

const LOGIN_URL = '/users/sign_in'
const LOGOUT_URL = '/users/sign_out'

const AuthContext = createContext();
export const AuthData = () => useContext(AuthContext);

export const AuthWrapper = () => {
  const [ user, setUser ] = useState({name: "", isAuthenticated: false})

  const login = (userName, password) => {

    // Make a call to the authentication API to check the username
    // TODO : prevent hard refresh or check the session
    return new Promise((resolve, reject) => {
      axios.post(LOGIN_URL,
        JSON.stringify({ user: { email: userName, password: password } }),
        {
          headers: {
            'Content-Type': 'application/json',
            'withCredentials': true
          }
        }
      )
      .then(response => {
        console.log("=============== response");
        console.log(response);
        const bearerToken = response?.headers?.getAuthorization(); // Note the correct way to access headers
        console.log("============= bearerToken");
        console.log(bearerToken.split(' ')[1]);
        localStorage.setItem("token", bearerToken.split(' ')[1]);
        setUser({ name: userName, isAuthenticated: true });
        resolve("success");

      })
      .catch(error => {
        console.error(error); // log the actual error for debugging
        reject("Incorrect email or password");
      });
    });
  }
  const logout = () => {
    return new Promise((resolve, reject) => {
      axios.delete(LOGOUT_URL,
        {
          headers: {
            'Content-Type': 'application/json',
            'authorization': `Bearer ${localStorage.getItem("token")}`,
            'withCredentials': true
          }
        }
      )
      .then(response => {
        localStorage.removeItem("token")
        setUser({...user, isAuthenticated: false})
      })
      .catch(error => {
        console.error(error); // log the actual error for debugging
        reject("Error logout");
      });
    });
  }

  return (
    <AuthContext.Provider value={{user, login, logout}}>
      <>
        <RenderHeader />
        <RenderMenu />
        <RenderRoutes />
      </>
    </AuthContext.Provider>
  )
}
