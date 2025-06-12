
const pool = require('./db');

// const { toTitleCase } = require('../lib/common-function/toTittleCase');


var product = {
    getAllProduct: function (req, callback) {
        pool.query("SELECT * FROM product ", function (err, result) {
            if (err) {
                response={
                    status:false,
                    message:"Error!! while fetching datas"
                }
         
                callback(err,response);
            }
               else {
               
                callback(null, result.rows);

            }

        });

    },
   
    addProduct: function (req, callback) {
  
      
        pool.query("INSERT INTO product (name,price,description,image_url,stock,specifications,brand_id,category_id) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)", [req.name,req.price,req.description,req.image_url,req.stock,req.specifications,req.brand_id,req.category_id], function (err, result) {
            // console.log(err,result );
            //    console.log(req,"req" );
            response={
                status:false,
                message:"Error!! while Inserting datas"
            }
            if (err) {
         
                callback(err, response);
            }
                else if(result.rowCount==0){
                callback("Error!!",response);

                }else {
                 
                callback(null, result);
            }

        });

    },
    getProductById: function (req, callback) {
        
        pool.query("SELECT * FROM product  where id=$1",[req.params.id], function (err, result) {
            response={
                status:false,
                message:"Error!! while fetching datas"
            }
            if (err) {
         
                callback(err, response);
            }
                else if(result.rowCount==0){
                callback("Error!!",response);

                } else {
               
                callback(null, result.rows);

           
            }

        });

    },
    updateProduct: function (req, callback) {
        const { name,price,description,image_url,stock,specifications,brand_id,category_id} = req.body;
        const{id}=req.params;
        pool.query("UPDATE product SET name=$1,price=$2,description=$3, image_url=$4, stock=$5, specifications=$6,brand_id=$7, category_id=$8 WHERE id =$9", [name,price,description,image_url,stock,specifications,brand_id,category_id, id], function (err, result) {
            //console.log(err,"update");
            
            response={
                status:false,
                message:"Error!! while updating datas"
            }
            if (err) {
         
                callback(err,response);
            }
                else if(result.rowCount==0){
                callback("Error!!",response);

                } else {
               
                callback(null, result);
            }
        

        });

    },
    
   	deleteproduct: function (req, callback) {
		pool.query(
			`DELETE FROM product WHERE id=$1`,
			[req.params.id],
			function (err, result) {
				if (err) {
					
					callback(err, 'Error!! while Deleting datas');
				} else if (result.rowCount == 0) {
					callback('Error!! while Deleting datas', 'Error!!');
				} else {
					callback(null, result);
				}
			}
		);
	},
   searchProductByName: function (req, callback) {
    const searchTerm = req.name || ''; // FIXED: no req.query here

    pool.query(`
        SELECT p.*, 
               c.name AS category_name, 
               c.description AS category_description, 
               b.name AS brand_name
        FROM product p
        LEFT JOIN categories c ON p.category_id = c.id
        LEFT JOIN brands b ON p.brand_id = b.id
        WHERE LOWER(p.name) LIKE LOWER($1)
    `, [`%${searchTerm}%`], function (err, result) {
        if (err) {
            console.log(err);
            return callback(err, {
                status: false,
                message: 'Error while searching product'
            });
        }

        callback(null, {
            status: true,
            message: 'Products retrieved successfully',
            data: result.rows
        });
    });
}


}

module.exports = product;