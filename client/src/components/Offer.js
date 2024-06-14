import { Link } from "react-router-dom"
import axios from '../api/axios';
import { useEffect, useState } from "react";
const OFFER_URL = '/api/v1/players/offers';

const Offer = () => {
    const [offers, setOffers] = useState([]);
    const [claimOffers, setClaimOffers] = useState([]);
    const [totalScore, setTotalScore] = useState(0);

    useEffect(() => {
        const fetchOffers = async () => {
            try {
                const response = await axios.get(OFFER_URL,
                    {
                        headers: {
                            'Content-Type': 'application/json',
                            'authorization': `Bearer ${localStorage.getItem("token")}`
                        }
                    }
                );
                setOffers(response.data.offers);
                setClaimOffers(response.data.claim_offers);
                setTotalScore(response.data.total_score)
            } catch(err) {
                console.error('Failed to fetch offers', err);
            }
        };
        fetchOffers();
    }, []);



    return (
        <section className="offer-list">
            <Link to="/">Home</Link>
            <h1>The Offer</h1>
            <br />
            <div className="flexGrow">
                <p>Your score: {totalScore}</p>
            </div>
            <div className="flexGrow2">
                <p>Here is the list of offers.</p>
                <div>
                <h2>Offers</h2>
                <ul>
                    {offers.map(offer => (
                    <li key={offer.id}>
                        <p>ID: {offer.id}</p>
                        <p>Title: {offer.title}</p>
                        <p>Description: {offer.description}</p>
                        <p>Score to Achieve: {offer.score_to_achieve}</p>
                    </li>
                    ))}
                </ul>
                </div>
            </div>

            <div className="flexGrow2">
                <h2>Claim Offers</h2>
                <ul>
                {claimOffers.map(offer => (
                    <li key={offer.id}>
                    <p>ID: {offer.id}</p>
                    <p>Title: {offer.title}</p>
                    <p>Description: {offer.description}</p>
                    <p>Score to Achieve: {offer.score_to_achieve}</p>
                    </li>
                ))}
                </ul>
            </div>
</section>
    )
}

export default Offer
