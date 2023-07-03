import express from 'express';
import rootRoute from './src/routers/rootRoute.js';
const app = express();
app.use(express.json());
app.use(express.static("."));

app.listen(7789);

app.use('/api', rootRoute);