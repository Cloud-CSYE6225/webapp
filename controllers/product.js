const sequelize = require('../db');
const logger = require('../logging');
//const statsD = require('node-statsd');
const {
    emailValidation,
    hashingOfPassword,
    basicAuthenticationHandler,
    passwordCheckFunction,
    randomStringAsBase64Url
} = require('../utils/controller.utility');

const products = require('../models/productModel');

const createProduct = (request, response) => {

}

const getProduct = (request, response) => {

}

const updateProduct = (request, response) => {

}

const deleteProduct = (request, response) => {

}

const getHealth = (request, response) => {
    return response.status(200).json("Health is OK");
}

module.exports = {
    createProduct,
    getProduct,
    updateProduct,
    getHealth,
    deleteProduct
 
}
