import { PrismaClient } from "@prisma/client"
import { failCode, successCode } from "../config/Reponse.js";

const prisma = new PrismaClient

const postComment = async (req, res) => {

    let { nguoi_dung_id, hinh_id, ngay_binh_luan, noi_dung } = req.body

    let contentCommet = await prisma.binh_luan.create({
        data: {
            nguoi_dung_id,
            hinh_id,
            ngay_binh_luan,
            noi_dung
        }
    })

    successCode(res, contentCommet, 'Comment successfully')
}

const getCommentByIdImg = async (req, res) => {
    let { idImage } = req.params
    let dataComment = await prisma.binh_luan.findMany({
        where: {
            hinh_id: parseInt(idImage)
        }
    })
    successCode(res, dataComment, 'Get comment by id image successfully')
}

export {
    postComment,
    getCommentByIdImg
}