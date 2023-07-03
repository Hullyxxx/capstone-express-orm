import express from "express"
import { getImage, uploadImage } from "../controller/imageController.js";

const imageRoute = new express.Router();

imageRoute.get('/get-image', getImage)
imageRoute.post('/upload-image/:idUser', uploadImage)

export default imageRoute;