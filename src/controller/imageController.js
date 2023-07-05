import { PrismaClient } from "@prisma/client";
import { failCode, successCode } from "../config/Reponse.js";

const prisma = new PrismaClient

const getDateNow = () => {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;

    return today;
}

const getImage = async (req, res) => {

    let dataIamge = await prisma.hinh_anh.findMany()

    successCode(res, dataIamge, 'Get list of images successfully')
}

const getImageByIdImage = async (req, res) => {
    let { idImage } = req.params

    let dataImage = await prisma.hinh_anh.findFirst({
        where: {
            hinh_id: parseInt(idImage)
        }
    })

    successCode(res, dataImage, 'Get image successfully')
}

const getImagesByName = async (req, res) => {
    try {
        let { nameImage } = req.query

        let dataImage = await prisma.hinh_anh.findMany({
            where: {
                ten_hinh: nameImage
            }
        })

        successCode(res, dataImage, 'Get list of images by name successfully')
    } catch (error) {
        failCode(res, error, 'Get list of images by name failed')
    }
}

const uploadImage = async (req, res) => {
    const { mo_ta, nguoi_dung_id } = req.body;
    const fileNameImage = req.file
    let hinh_id_max = await prisma.hinh_anh.aggregate({
        _max: {
            hinh_id: true
        }
    })

    let hinh_id = hinh_id_max._max.hinh_id + 1

    try {
        let dataFile = await prisma.hinh_anh.create({
            data: {
                hinh_id,
                ten_hinh: fileNameImage.filename,
                duong_dan: fileNameImage.filename,
                mo_ta,
                nguoi_dung_id: nguoi_dung_id * 1
            }
        })

        await prisma.nguoi_dung.update({
            data: {
                anh_dai_dien: fileNameImage.filename
            },
            where: {
                nguoi_dung_id: nguoi_dung_id * 1
            }
        })

        await prisma.luu_anh.create({
            data: {
                nguoi_dung_id: nguoi_dung_id * 1,
                hinh_id: hinh_id * 1,
                ngay_luu: null
            }
        })

        successCode(res, dataFile, 'Upload success file with name: ' + fileNameImage)
    } catch (error) {
        failCode(res, error, 'Uploading file failed')
    }
}

const getInfoDetail = async (req, res) => {
    let { idImg } = req.params

    let dataDetail = await prisma.luu_anh.findFirst({
        where: {
            hinh_id: parseInt(idImg)
        },
        include: {
            nguoi_dung: true,
            hinh_anh: true
        }
    })

    successCode(res, dataDetail, 'Get info detail of image and user successfully')
}

const deleteImage = async (req, res) => {
    let { idImage } = req.params

    let dataDelete = await prisma.hinh_anh.delete({
        where: {
            hinh_id: parseInt(idImage)
        }
    })

    successCode(res, dataDelete, 'Delete Image Success')
}

const getImageCreateByUserId = async (req, res) => {
    let { userId } = req.params

    let dataImage = await prisma.hinh_anh.findMany({
        where: {
            nguoi_dung_id: parseInt(userId)
        }
    })

    successCode(res, dataImage, 'Get image create successfully')
}

const getImageSavedByUserId = async (req, res) => {
    let { userId } = req.params

    let dataImage = await prisma.luu_anh.findMany({
        where: {
            nguoi_dung_id: parseInt(userId)
        },
        include: {
            hinh_anh: true
        }
    })

    successCode(res, dataImage, 'Get image saved success')
}

export {
    getImage,
    uploadImage,
    getImagesByName,
    getInfoDetail,
    getImageByIdImage,
    deleteImage,
    getImageCreateByUserId,
    getImageSavedByUserId
}