import axios from "axios";
import React from "react";

const baseURL = "http://localhost:3002/api/v1/books"

export default function UserOffers() {

  const [offer, setOffer] = React.useState(null);

  React.useEffect(() => {
    axios.get(baseURL).then((response) => {
      setOffer(response.data);
    });
  }, []);

  if (!offer) return null;

  return (
    <div>
      <p>My offer 1</p>
    </div>
  );
}
