
const pool = require('./db');

// const { toTitleCase } = require('../lib/common-function/toTittleCase');


var enquiries = {
    getAllEnquiries: function (req, callback) {
        pool.query("SELECT * FROM enquiries", function (err, result) {
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
   
    addEnquiries: function (req, callback) {
        pool.query("INSERT INTO enquiries (monthly_amt, mobile_no) VALUES ($1, $2)", [req.monthly_amt, req.mobile_no], function (err, result) {
        //    console.log(err,result );
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
    getEnquiriesById: function (req, callback) {
        
        pool.query("SELECT * FROM enquiries  where id=$1",[req.params.id], function (err, result) {
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
    updateEnquiries: function (req, callback) {
        const { monthly_amt, mobile_no } = req.body;
        const{id}=req.params;
        pool.query("UPDATE enquiries SET monthly_amt=$1, mobile_no=$2  WHERE id =$3", [monthly_amt, mobile_no, id], function (err, result) {
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
    deleteEnquiries: function (req, callback) {
        pool.query(
            `DELETE FROM enquiries WHERE id=$1`,
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
}

module.exports = enquiries;