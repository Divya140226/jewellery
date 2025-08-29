
const pool = require('./db');

// const { toTitleCase } = require('../lib/common-function/toTittleCase');


var cartItem = {
    getAllCartItem: function (user_id, callback) {
  pool.query(
    `SELECT c.*, pt.name,  pt.material,pt.weight, pt.description_product, pt.price, pt.category_id, pt.image_url
     FROM cart_items c
     LEFT JOIN product pt ON c.product_id = pt.id
     WHERE c.user_id = $1`,
    [user_id],
    function (err, result) {
      if (err) {
        callback(err, {
          status: false,
          message: "Error!! while fetching data"
        });
      } else {
        callback(null, {
          status: true,
          message: "Cart items fetched successfully",
          data: result.rows
        });
      }
    }
  );
},
   
    addCartItem: function (req, callback) {
  
      
        pool.query("INSERT INTO cart_items (user_id,product_id,quantity) VALUES ($1,$2,$3)", [req.user_id,req.product_id,req.quantity], function (err, result) {
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
    getCartItemById: function (req, callback) {
        
        pool.query("SELECT c.*, pt.* FROM cart_items c LEFT JOIN profile_users p ON c.user_id = p.id LEFT JOIN product pt ON c.product_id = pt.id where c.id=$1",[req.params.id], function (err, result) {
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
    // Update cart item
updateCartItem: function (req, callback) {
    const { user_id, product_id, quantity } = req.body;
    const id = req.params.itemId;

    pool.query(
        "UPDATE cart_items SET user_id = $1, product_id = $2, quantity = $3 WHERE id = $4",
        [user_id, product_id, quantity, id],
        function (err, result) {
            const response = {
                status: false,
                message: "Error!! while updating data"
            };

            if (err) {
                callback(err, response);
            } else if (result.rowCount === 0) {
                callback("No matching record found", response);
            } else {
                callback(null, result);
            }
        }
    );
},

// Delete cart item
// deleteCartItem: function (req, callback) {
//     const id = req.params.itemId;

//     pool.query(
//         "DELETE FROM cart_items WHERE id = $1",
//         [id],
//         function (err, result) {
//             if (err) {
//                 callback(err, "Error!! while deleting data");
//             } else if (result.rowCount === 0) {
//                 callback("No record found to delete", "Error!!");
//             } else {
//                 callback(null, result);
//             }
//         }
//     );
// }
deleteCartItem: function (user_id, product_id, callback) {
  pool.query(
    "DELETE FROM cart_items WHERE user_id = $1 AND product_id = $2",
    [user_id, product_id],
    function (err, result) {
      if (err) {
        callback(err, "Error!! while deleting data");
      } else {
        callback(null, result);
      }
    }
  );
}




}

module.exports = cartItem;