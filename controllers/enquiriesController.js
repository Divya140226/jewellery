
var enquiriesModel = require('../models/enquiriesModel');

async function getAllEnquiries(req, res) {
    try {
      enquiriesModel.getAllEnquiries(req.body, function (err, rows) {
        if (err) {
            res.json(rows);
        } else {
            req.headers['x-access-token'] = rows['token'];
            res.json(rows);
        }
    });
    } catch (error) {
      console.error('Error fetching enquiries:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
  async function addEnquiries(req, res) {
    try {
      enquiriesModel.addEnquiries(req.body, function (err, rows) {
       
console.log(err);

        if (err) {
          res.status(500).send({
            message: rows,
          });      
        } 
        else{    
          res.status(200).send({
            status: true,
            message: 'Created Successfully',
          });
        }
    });
    } catch (error) {
      console.error('Error fetching enquiries:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
  async function getEnquiriesById(req, res) {
    try {
      enquiriesModel.getEnquiriesById(req, function (err, rows) {
        if (err) {
            res.json(rows);
        } else {
            req.headers['x-access-token'] = rows['token'];
            res.json(rows[0]);
        }
    });
    } catch (error) {
      console.error('Error fetching enquiries:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
  async function updateEnquiries(req, res) {
    try {
      enquiriesModel.updateEnquiries(req, function (err, rows) {
        if (err) {
          res.status(500).send({
            message: rows,
          });      
        } 
        else{    
          res.status(200).send({
            status: true,
            message: 'Updated Successfully',
          });
        }
    });
    } catch (error) {
      console.error('Error fetching enquiries:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
  async function deleteEnquiries(req, res) {
    try {
      enquiriesModel.deleteEnquiries(req, function (err, rows) {
        if (err) {
          res.status(500).send({
            message: rows,
          });      
        } 
        else{    
          res.status(200).send({
            status: true,
            message: 'Deleted Successfully',
          });
        }
    });
    } catch (error) {
      console.error('Error fetching enquiries:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
 


module.exports = {
  getAllEnquiries,
  addEnquiries,
  getEnquiriesById,
  updateEnquiries,
  deleteEnquiries,
 
};
