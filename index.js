const express = require("express");
const mongoose = require("mongoose");

const app = express();

mongoose.connect(`mongodb://${process.env.DB_URL}:27017/nodemongo`, {
  useNewUrlParser: true
});

app.get("/", (req, res, next) => {
  return res.send("Hello world 3");
});

app.listen(3000);
