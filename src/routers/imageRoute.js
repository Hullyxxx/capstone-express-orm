import express from "express"
import { deleteImage, getImage, getImageByIdImage, getImageCreateByUserId, getImageSavedByUserId, getImagesByName, getInfoDetail, uploadImage } from "../controller/imageController.js";
import multer from "multer";
import { verifyToken } from "../config/jwt.js";

const imageRoute = new express.Router();

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, process.cwd() + '/public/img')
    },
    filename: (req, file, cb) => {
        const fileNameUpload = Date.now() + '_' + file.originalname;


        cb(null, fileNameUpload)
    }
})

const upload = multer({ storage })

imageRoute.get('/get-image', getImage)
imageRoute.get('/get-image-by-name', getImagesByName)
imageRoute.post('/upload-image', upload.single('image'), uploadImage)
imageRoute.get('/get-info-img-detail/:idImg', getInfoDetail)
imageRoute.get('/get-image-saved/:idImage', getImageByIdImage)
imageRoute.delete('/delete-image/:idImage', deleteImage)
imageRoute.get('/get-image-created-by-user/:userId', getImageCreateByUserId)
imageRoute.get('/get-image-saved-by-user/:userId', getImageSavedByUserId)

export default imageRoute;