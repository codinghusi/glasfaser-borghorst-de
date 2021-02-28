const express = require("express");
const http = require("http");

const app = express();
app.use(express.static("/app/public"))
app.use("/", (req, res) => {
    res.sendFile("/app/public/index.html");
});

const server = http.createServer(app);
server.listen(3000);