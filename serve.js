const express = require("express");
const http = require("http");

const app = express();
app.use(express.json());
app.use(express.static("./public"));


const server = http.createServer(app);
server.listen(3000);