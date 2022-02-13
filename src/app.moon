import respond_to from require "lapis.application"
import json_params from require "lapis.application"
import Model from require "lapis.db.model"
lapis = require "lapis"

class Products extends Model

class Categories extends Model

class App extends lapis.Application
  [index: "/"]: =>
    @html ->
      h1 "Moonscript & Lapis based web shop API"
      p "This is home site"
      p "Controllers:"
      p "GET /models - return db models with description"
      p "GET /products - get all products"
      p "GET /categories - get all categories"

      p "GET /product/:id - returns product with given id"
      p "POST /product - creates new product"
      p "PUT /product/:id - updates product with given id"
      p "DELETE /product/:id - removes product with given id"
      p "GET /category/:id - returns category with given id"
      p "POST /category - creates new category"
      p "PUT /category/:id - updates category with given id"
      p "DELETE /category/:id - removes category with given id"

  [models: "/models"]: =>
    @html ->
      p "Category: id, name"
      p "Product: id, name, price, categoryId"

  [products: "/products"]: respond_to {
    GET: =>
      json: Products\select!
  }
    
  [product: "/product(/:id)"]: respond_to {

    POST: json_params =>
      product = Products\create {
        name: @params.name 
        price: @params.price 
        category_id: @params.category_id
      }
      unless product
        return json: { 
        message: "Not found"
        status: 404 
      }
      json: {
        body: product
        status: 201
      }
  
    GET: =>
      product = Products\find {
        id: @params.id
      }
      unless product
        return json: { 
          message: "Not found"
          status: 404 
        }
      json: {
        product: product
        status: 200
      }
    
    PUT: json_params =>
      product = Products\find {
        id: @params.id
      }
      unless product
        return json: { 
          message: "Not found"
          status: 404 
        }
      product\update {
        name: @params.name
        price: @params.price
        category_id: @params.category_id
      }
      json: {
        product: product
        status: 201
      }

    DELETE: => 
      product = Products\find {
        id: @params.id
      }
      unless product
        return json: { 
        message: "Not found"
        status: 404 
      }
    
      product\delete!
      json: status: 200
  } 

  [categories: "/categories"]: respond_to {
    GET: =>
      json: Categories\select!
  }

  [category: "/category(/:id)"]: respond_to {
    POST: json_params =>
      category = Categories\create {
        name: @params.name
      }
      unless category
        return json: { 
          message: "Not found"
          status: 404 
        }
      return json: {
        category: category 
        status: 201
      }

    GET: =>
      category = Categories\find {
        id: @params.id
      }
      unless category
        return json: { 
          message: "Not found"
          status: 404 
        }
      json: {
        category: category
        status: 200
      }
    
    PUT: json_params =>       
      category = Categories\find {
        id: @params.id
      }
      category\update {
        name: @params.name
      }
      unless category
        return json: { 
          message: "Not found"
          status: 404 
        }
      json: {
        category: category
        status: 201
      }
    
    DELETE: =>
      category = Categories\find {
        id: @params.id
      }
      unless category
        return json: { 
          message: "Not found"
          status: 404 
        }
      category\delete!
      json: { 
        status: 200
      }
  } 