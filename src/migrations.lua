local create_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, types = _obj_0.create_table, _obj_0.types
end
return {
  [0] = function(self)
    local _ = "DROP TABLE IF EXISTS categories"
    return "DROP TABLE IF EXISTS products"
  end,
  [1] = function(self)
    return create_table("categories", {
      {
        "id",
        types.serial
      },
      {
        "name",
        types.text
      },
      "PRIMARY KEY(id)"
    })
  end,
  [2] = function(self)
    return create_table("products", {
      {
        "id",
        types.serial
      },
      {
        "name",
        types.text
      },
      {
        "price",
        types.double
      },
      {
        "category_id",
        types.foreign_key
      },
      "PRIMARY KEY(id)"
    })
  end
}
