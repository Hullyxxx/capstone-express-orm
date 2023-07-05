import express from "express"
import userRoute from "./userRoute.js";
import imageRoute from "./imageRoute.js";
import commentRoute from "./commentRoute.js";
import { verifyToken } from "../config/jwt.js";

const rootRoute = express.Router();

rootRoute.use('/user', userRoute)
rootRoute.use('/image', verifyToken, imageRoute)
rootRoute.use('/comment', verifyToken, commentRoute)
export default rootRoute;