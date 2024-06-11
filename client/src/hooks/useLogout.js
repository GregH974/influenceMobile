import axios from "../api/axios";
import useAuth from "./useAuth";

const LOGOUT_URL = '/logout';

const useLogout = () => {

  const { setAuth } = useAuth();

  const logout = async () => {
    setAuth({});
    try {
      await axios.delete(LOGOUT_URL, {
        headers: {
            'Content-Type': 'application/json',
            'authorization': `Bearer ${localStorage.getItem("token")}`,
        },
      });
    } catch (err) {
        console.error(err);
    }
  }

  return logout;
}

export default useLogout
