import { PrismaClient } from "@prisma/client"
import { failCode, successCode } from "../config/Reponse.js"
import bcrypt from 'bcrypt'
import { decodeToken, generateToken } from "../config/jwt.js"

const prisma = new PrismaClient

const getUser = async (req, res) => {

    let dataUser = await prisma.nguoi_dung.findMany()

    successCode(res, dataUser, 'Get list user information')
}

const getUserById = async (req, res) => {
    let { idUser } = req.params

    let dataUser = await prisma.nguoi_dung.findFirst({
        where: {
            nguoi_dung_id: parseInt(idUser)
        }
    })

    // let { token } = req.heade rs

    // let dataUser = decodeToken(token)

    // console.log(dataUser);

    successCode(res, dataUser.data, 'Get user information successfully')
}

const createUser = async (req, res) => {
    const { email, mat_khau, ho_ten, tuoi, anh_dai_dien } = req.body

    const mat_khau_hash = await bcrypt.hash(mat_khau, 1)

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

    let checkUser = await prisma.nguoi_dung.findFirst({
        where: {
            email,
        }
    })

    let checkPass = bcrypt.compareSync(mat_khau, checkUser.mat_khau);
    if (checkPass) {
        let infoUser = { ...checkUser };
        let token = generateToken(infoUser);
        res.send(token);
    } else {
        res.send("Mật khẩu không đúng");
    }

    // checkPass ? successCode(res, checkUser, 'Login Success') : failCode(res, checkUser, 'Login Failed')
}

const updateInfo = async (req, res) => {
    let { nguoi_dung_id, email, mat_khau, ho_ten, tuoi, anh_dai_dien } = req.body;

    const mat_khau_hash = await bcrypt.hash(mat_khau, 1)

    let dataUpdate = await prisma.nguoi_dung.update({
        where: {
            nguoi_dung_id
        },
        data: {
            email,
            mat_khau: mat_khau_hash,
            ho_ten,
            tuoi,
            anh_dai_dien
        }
    })

    successCode(res, dataUpdate, 'Update Successfully')
}

export {
    getUser,
    createUser,
    signIn,
    updateInfo,
    getUserById
}