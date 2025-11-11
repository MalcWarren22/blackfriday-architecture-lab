const express = require("express");
const morgan = require("morgan");
const cors = require("cors");

const app = express();
const port = process.env.PORT || 8080;

app.use(cors());
app.use(express.json());
app.use(morgan("dev"));

// Simple health endpoint for App Service / probes
app.get("/health", (req, res) => {
  res.json({ status: "ok", message: "Black Friday API healthy" });
});

// Fake product catalog
app.get("/products", (req, res) => {
  const products = [
    { id: 1, name: "4K TV", price: 799, stock: 42 },
    { id: 2, name: "Noise Cancelling Headphones", price: 199, stock: 120 },
    { id: 3, name: "Gaming Laptop", price: 1299, stock: 15 }
  ];
  res.json({ items: products });
});

// Mock checkout endpoint (no payment, just logs)
app.post("/checkout", (req, res) => {
  const { cart, userId } = req.body || {};
  console.log("Checkout request", {
    userId: userId || "anonymous",
    items: cart || []
  });

  // In real life we'd call payment + inventory. Here we just pretend.
  res.json({
    status: "accepted",
    orderId: `BF-${Date.now()}`,
    message: "Order accepted (lab mode, no charge)."
  });
});

app.listen(port, () => {
  console.log(`Black Friday API listening on port ${port}`);
});
