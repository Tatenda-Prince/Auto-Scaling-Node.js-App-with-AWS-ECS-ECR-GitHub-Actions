const express = require("express");
const app = express();

// Define a simple route
app.get("/", (req, res) => {
    res.send("Welcome To Up The Chels Tech Node.js App is running in Docker on AWS ECS Fargate with Terraform and Github Actions CI/CD");
});

// Listen on port 3000
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

