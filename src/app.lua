local respond_to
respond_to = require("lapis.application").respond_to
local json_params
json_params = require("lapis.application").json_params
local Model
Model = require("lapis.db.model").Model
local lapis = require("lapis")
local Products
do
  local _class_0
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Products",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Products = _class_0
end
local Categories
do
  local _class_0
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Categories",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Categories = _class_0
end
local App
do
  local _class_0
  local _parent_0 = lapis.Application
  local _base_0 = {
    [{
      index = "/"
    }] = function(self)
      return self:html(function()
        h1("Moonscript & Lapis based web shop API")
        p("This is home site")
        p("Controllers:")
        p("GET /models - return db models with description")
        p("GET /products - get all products")
        p("GET /categories - get all categories")
        p("GET /product/:id - returns product with given id")
        p("POST /product - creates new product")
        p("PUT /product/:id - updates product with given id")
        p("DELETE /product/:id - removes product with given id")
        p("GET /category/:id - returns category with given id")
        p("POST /category - creates new category")
        p("PUT /category/:id - updates category with given id")
        return p("DELETE /category/:id - removes category with given id")
      end)
    end,
    [{
      models = "/models"
    }] = function(self)
      return self:html(function()
        p("Category: id, name")
        return p("Product: id, name, price, categoryId")
      end)
    end,
    [{
      products = "/products"
    }] = respond_to({
      GET = function(self)
        return {
          json = Products:select()
        }
      end
    }),
    [{
      product = "/product(/:id)"
    }] = respond_to({
      POST = json_params(function(self)
        local product = Products:create({
          name = self.params.name,
          price = self.params.price,
          category_id = self.params.category_id
        })
        if not (product) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        return {
          json = {
            body = product,
            status = 201
          }
        }
      end),
      GET = function(self)
        local product = Products:find({
          id = self.params.id
        })
        if not (product) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        return {
          json = {
            product = product,
            status = 200
          }
        }
      end,
      PUT = json_params(function(self)
        local product = Products:find({
          id = self.params.id
        })
        if not (product) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        product:update({
          name = self.params.name,
          price = self.params.price,
          category_id = self.params.category_id
        })
        return {
          json = {
            product = product,
            status = 201
          }
        }
      end),
      DELETE = function(self)
        local product = Products:find({
          id = self.params.id
        })
        if not (product) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        product:delete()
        return {
          json = {
            status = 200
          }
        }
      end
    }),
    [{
      categories = "/categories"
    }] = respond_to({
      GET = function(self)
        return {
          json = Categories:select()
        }
      end
    }),
    [{
      category = "/category(/:id)"
    }] = respond_to({
      POST = json_params(function(self)
        local category = Categories:create({
          name = self.params.name
        })
        if not (category) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        return {
          json = {
            category = category,
            status = 201
          }
        }
      end),
      GET = function(self)
        local category = Categories:find({
          id = self.params.id
        })
        if not (category) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        return {
          json = {
            category = category,
            status = 200
          }
        }
      end,
      PUT = json_params(function(self)
        local category = Categories:find({
          id = self.params.id
        })
        category:update({
          name = self.params.name
        })
        if not (category) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        return {
          json = {
            category = category,
            status = 201
          }
        }
      end),
      DELETE = function(self)
        local category = Categories:find({
          id = self.params.id
        })
        if not (category) then
          return {
            json = {
              message = "Not found",
              status = 404
            }
          }
        end
        category:delete()
        return {
          json = {
            status = 200
          }
        }
      end
    })
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "App",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  App = _class_0
  return _class_0
end
