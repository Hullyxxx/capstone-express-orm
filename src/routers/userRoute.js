import express from "express";
import { createUser, getUser, signIn } from "../controller/userController.js";


const userRoute = express.Router();

userRoute.get('/get-user', getUser);
userRoute.post('/create-user', createUser);
userRoute.post('/sign-in', signIn)

export default userRoute;