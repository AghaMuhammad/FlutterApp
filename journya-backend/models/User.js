const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    picture: { type: String }, // Profile picture URL
    provider: { type: String, required: true }, // e.g., 'google' or 'apple'
    providerId: { type: String, required: true }, // Google/Apple ID
    createdAt: { type: Date, default: Date.now },
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);
