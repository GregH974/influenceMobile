import React from 'react';
import axios from '../api/axios';

const CLAIM_OFFER_URL = '/api/v1/players/offers/claim';

const ClaimButton = ({ offerId, scoreToAchieve, totalScore, onSuccess }) => {
    const handleClaim = async () => {
        try {
            const response = await axios.post(CLAIM_OFFER_URL, { offer_id: offerId }, {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem("token")}`
                }
            });
            if (response.status === 200) {
                onSuccess();
            }
        } catch (err) {
            console.error('Failed to claim offer', err);
        }
    };

    if (totalScore >= scoreToAchieve) {
        return <button onClick={handleClaim}>Claim</button>;
    }

    return null;
};

export default ClaimButton;
