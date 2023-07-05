import jwt from 'jsonwebtoken';

const generateToken = (data) => {
    let token = jwt.sign({ data }, "capstone-express-orm", { algorithm: "HS256", expiresIn: "10m" });
    return token;
}

const checkToken = (token) => {
    return jwt.verify(token, "capstone-express-orm");
}

const decodeToken = (token) => {
    return jwt.decode(token);
}

const verifyToken = (req, res, next) => {
    try {

        let { token } = req.headers;

        let verifyToken = checkToken(token);

        if (verifyToken) {
            next();
        }
    } catch (err) {
        res.status(401).send(err.message);
    }
}

export {
    generateToken,
    checkToken,
    decodeToken,
    verifyToken
}