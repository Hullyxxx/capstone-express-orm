import express from "express";
import { getCommentByIdImg, postComment } from "../controller/commentController.js";

const commentRoute = express.Router();

commentRoute.post('/post-comment', postComment);
commentRoute.get('/get-comment-by-id-image/:idImage', getCommentByIdImg)
export default commentRoute