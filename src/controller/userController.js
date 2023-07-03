import { PrismaClient } from "@prisma/client"
import { failCode, successCode } from "../config/Reponse.js"
import bcryptjs from 'bcryptjs'
const prisma = new PrismaClient

const getUser = (req, res) => {
    res.send('Hello word')
}

const createUser = async (req, res) => {
    const { email, mat_khau, ho_ten, tuoi, anh_dai_dien } = req.body

    const mat_khau_hash = await bcryptjs.hash(mat_khau, 1)

    const user = await prisma.nguoi_dung.create({
        data: {
            email,
            'mat_khau': mat_khau_hash,
            ho_ten,
            tuoi,
            anh_dai_dien
        }
    })

    successCode(res, user, 'Create Successfully')
}

const signIn = async (req, res) => {
    const { email, mat_khau } = req.body

    const checkUser = await prisma.nguoi_dung.findFirst({
        where: {
            email,
        }
    }) 

    let checkPass = bcryptjs.compare(mat_khau, checkUser.mat_khau);

    checkPass ? successCode(res, checkUser, 'Login Success') : failCode(res, checkUser, 'Login Failed')
}

export {
    getUser,
    createUser,
    signIn
}