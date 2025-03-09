// const express = require('express');
// const sql = require('mssql');
// const cors = require('cors');

// const app = express();
// const port = 5000; // You can change the port if needed

// // Middleware
// app.use(cors()); // Enable CORS
// app.use(express.json()); // Parse JSON request bodies

// // Database configuration
// const config = {
//     user: 'winnie@seramai.co.ke', // Replace with your SQL Server username
//     password: 'Pretty@2025', // Replace with your SQL Server password
//     server: '217.76.63.92', // Replace with your SQL Server IP
//     database: 'Nyakayojo_Demo', // Replace with your database name
//     options: {
//         encrypt: true, // For Azure or secure connections
//         trustServerCertificate: true // For self-signed certificates
//     }
// };

// // Connect to the database
// sql.connect(config).then(() => {
//     console.log('Connected to SQL Server');
// }).catch(err => {
//     console.error('Database connection failed:', err);
// });

// // Example API endpoint to fetch data
// app.get('/api/customers', async (req, res) => {
//     try {
//         const request = new sql.Request();
//         const result = await request.query('SELECT * FROM Customers'); 
//         res.json(result.recordset); 
//     } catch (err) {
//         console.error('Error fetching data:', err);
//         res.status(500).send('Server error');
//     }
// });


// app.post('/api/customers', async (req, res) => {
//     try {
//         const { branchId, memberId, clientName } = req.body;
//         const request = new sql.Request();
//         const query = `
//             INSERT INTO Customers (BranchID, MemberID, ClientName)
//             VALUES (@branchId, @memberId, @clientName)
//         `;
//         request.input('branchId', sql.VarChar, branchId);
//         request.input('memberId', sql.VarChar, memberId);
//         request.input('clientName', sql.VarChar, clientName);
//         await request.query(query);
//         res.status(201).send('Customer added successfully');
//     } catch (err) {
//         console.error('Error inserting data:', err);
//         res.status(500).send('Server error');
//     }
// });
// app.listen(port, () => {
//     console.log(`Server is running on http://localhost:${port}`);
// });