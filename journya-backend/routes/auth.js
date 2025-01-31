const express = require("express");
const { OAuth2Client } = require("google-auth-library");
const jwt = require("jsonwebtoken");
const User = require("../models/User");

const router = express.Router();
const client = new OAuth2Client("YOUR_GOOGLE_CLIENT_ID");

// Google Sign-In API
router.post("/google", async (req, res) => {
    const { idToken } = req.body;

    try {
        // Verify Google ID Token
        const ticket = await client.verifyIdToken({
            idToken,
            audience: "YOUR_GOOGLE_CLIENT_ID",
        });

        const { email, name, picture, sub } = ticket.getPayload(); // "sub" is the Google user ID

        // Check if user already exists
        let user = await User.findOne({ providerId: sub });

        if (!user) {
            user = new User({
                name,
                email,
                picture,
                provider: "google",
                providerId: sub,
            });
            await user.save();
        }

        // Generate JWT Token
        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: "7d" });

        res.json({ token, user });
    } catch (error) {
        res.status(400).json({ message: "Invalid Google ID Token" });
    }
});

module.exports = router;
