# Product Management REST API

A Node.js REST API for managing product inventory, including product details, inventory tracking, and sales management.

## Overview

This API provides a comprehensive solution for managing products in a retail or e-commerce environment. It handles:
- Product creation and management
- Inventory tracking
- Sales recording and reporting
- Stock level monitoring
- Product categorization

## Tech Stack

- **Backend**: Node.js with Express.js
- **Database**: MySQL
- **API Documentation**: Postman Collection
- **Development Tools**: Nodemon for hot-reloading

## Installation Steps

1. Clone the repository
2. Install dependencies:
   ```
   npm install
   ```
3. Create a MySQL database and import the schema:
   ```
   mysql -u root -p < config/schema.sql
   ```
   or manually run the SQL commands in `config/schema.sql` in your MySQL client

4. Configure your database connection in `config/conn.js` if needed
5. Start the server:
   ```
   npm run dev
   ```

## API Endpoints

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get a single product
- `GET /api/products/low-stock` - Get products with low stock
- `POST /api/products` - Create a new product (requires name, price, cost, category)
- `PUT /api/products/:id` - Update a product
- `DELETE /api/products/:id` - Delete a product

### Inventory
- `GET /api/inventory` - Get all inventory records
- `GET /api/inventory/:id` - Get inventory for specific product
- `GET /api/inventory/low-stock` - Get products below reorder level
- `POST /api/inventory` - Create new inventory record
- `PUT /api/inventory/:id` - Update inventory quantity
- `PUT /api/inventory/product/:id` - Update product inventory levels
- `DELETE /api/inventory/:id` - Delete inventory record

### Sales
- `GET /api/sales` - Get all sales records
- `GET /api/sales/:id` - Get specific sale record
- `GET /api/sales/by-product/:id` - Get sales history for a product
- `POST /api/sales` - Record new sale
- `PUT /api/sales/:id` - Update sale record
- `DELETE /api/sales/:id` - Delete sale record

## Database Schema

The database consists of 3 main tables:
- `products` - Stores product information (name, SKU, description, price, cost, category)
- `inventory` - Tracks product stock levels (product_id, quantity, reorder_level)
- `sales` - Records sales transactions (product_id, quantity, total_amount, sale_date)