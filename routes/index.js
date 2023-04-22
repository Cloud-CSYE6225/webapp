const userRouter = require("./userRouter");
const productRouter = require('./productRouter');
const imageRouter = require('./imageRouter');


/**
 * Base routes for different app components
 * @param {*} app 
 */

const routes = (app) => {
    app.use("/v1/user", userRouter);
    app.use("/v1/product", productRouter);
   // app.use("/v1/product/:productId/image", imageRouter);
    app.use("/deepak",userRouter);
    app.use("/deepak",productRouter);
    app.use("/health", userRouter);

  
}


module.exports = routes;