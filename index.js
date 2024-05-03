const express = require("express");
const app = express();

app.get("/ping", (req, res) => {
  res.send("pong");
});

app.listen(81, () => {
  console.log("Server listening on port 81");
});
