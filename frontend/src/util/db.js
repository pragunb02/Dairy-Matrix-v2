// const mysql=require("mysql2/promise")
// async function getConnection(){
//     const connection= await mysql.createConnection({
//         host:"localhost",
//         user:"root",
//         password:"apk@a2z@",
//         database:"MoMilk",
//     })
//     return connection
// }
// module.exports=getConnection

const mysql = require('mysql2/promise');

async function getConnection() {
    try {
        const connection = await mysql.createConnection({
            host     : process.env.DB_HOST,
            user     : process.env.DB_USER,
            password : process.env.DB_PASSWORD,
            database : process.env.DB_DATABASE
        });
        return connection;
    } catch (error) {
        console.error('Error connecting to the database:', error);
        throw error;
    }
}


module.exports = getConnection;
