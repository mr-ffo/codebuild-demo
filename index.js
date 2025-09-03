
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h1>Hello , this is  <i>folarin favour olaoluwapo <i> i am sending greeting from AWS CodeBuild Demo!</h1>');
});

app.listen(PORT, () => {
  console.log(`Server running on ${PORT}`);
});