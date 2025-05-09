const express = require("express");
const app = express();
app.get("/", (req, res) => {
  res.send("<h1> Hello, Captain!</h1>");
});
PORT = 3000;
console.log("Hello, Captain!");
app.listen(3000, () => {
  console.log("running at $PORT");
});
