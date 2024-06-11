// // PrivateRoute.js
// import React, { useEffect, useState } from 'react';
// import { Route, Navigate } from 'react-router-dom';
// import { isAuthenticated } from '../auth/Auth';

// const PrivateRoute = ({ component: Component, ...rest }) => {
//   const [loading, setLoading] = useState(true);
//   const [isAuth, setIsAuth] = useState(false);

//   useEffect(() => {
//     const checkAuth = async () => {
//       const user = await isAuthenticated();
//       setIsAuth(!!user);
//       setLoading(false);
//     };
//     checkAuth();
//   }, []);

//   if (loading) return <div>Loading...</div>;

//   return (
//     <Route
//       {...rest}
//       render={(props) =>
//         isAuth ? <Component {...props} /> : <Navigate to="/login" />
//       }
//     />
//   );
// };

// export default PrivateRoute;
// PrivateRoute.js
import React from 'react';
import { Navigate } from 'react-router-dom';
import { getToken } from '../auth/Auth';

const PrivateRoute = ({ children }) => {
  const token = getToken();
  return token ? children : <Navigate to="/login" />;
};

export default PrivateRoute;
