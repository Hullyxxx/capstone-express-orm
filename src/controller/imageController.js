const getImage = (req, res) => {
    res.send('Get Image');
}

const uploadImage = (req, res) => {
    const { idUser } = req.params;

    res.send('Post Image Success');
}

export {
    getImage,
    uploadImage
}