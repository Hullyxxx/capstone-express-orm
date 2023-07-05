import express from "express";
import { createUser, getUser, getUserById, signIn, updateInfo } from "../controller/userController.js";
import { verifyToken } from "../config/jwt.js";


const userRoute = express.Router();

userRoute.get('/get-user', verifyToken, getUser);
userRoute.get('/get-user-by-id/:idUser', verifyToken, getUserById);
userRoute.post('/create-user', createUser);
userRoute.post('/sign-in', signIn);
userRoute.put('/update-info-user', verifyToken, updateInfo);

export default userRoute;