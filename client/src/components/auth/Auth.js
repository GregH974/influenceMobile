// // auth.js
// import axios from 'axios';

// const API_URL = 'http://localhost:3000';

// export const setAuthToken = (token) => {
//   if (token) {
//     axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
//   } else {
//     delete axios.defaults.headers.common['Authorization'];
//   }
// };

// export const getToken = () => localStorage.getItem('token');

// export const isAuthenticated = async () => {
//   const token = getToken();
//   if (token) {
//     setAuthToken(token);
//     try {
//       const response = await axios.get(`${API_URL}/users/me`); // Ensure you have this route in your Rails API
//       return response.data;
//     } catch (err) {
//       console.error('User not authenticated', err);
//       return null;
//     }
//   }
//   return null;
// };
import axios from 'axios';

const API_URL = 'http://localhost:3002';

export const setAuthToken = (token) => {
  if (token) {
    axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  } else {
    delete axios.defaults.headers.common['Authorization'];
  }
};

export const getToken = () => localStorage.getItem('token');

export const isAuthenticated = async () => {
  const token = getToken();
  if (token) {
    setAuthToken(token);
    try {
      const response = await axios.get(`${API_URL}/users/me`); // Ensure you have this route in your Rails API
      return response.data;
    } catch (err) {
      console.error('User not authenticated', err);
      return null;
    }
  }
  return null;
};
