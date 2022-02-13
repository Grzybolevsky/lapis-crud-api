import create_table, types from require "lapis.db.schema"

{
    [0]: =>
        "DROP TABLE IF EXISTS categories"
        "DROP TABLE IF EXISTS products"
    [1]: => 
        create_table "categories", {
            {"id", types.serial}
            {"name", types.text}

            "PRIMARY KEY(id)"
        }
    [2]: => 
        create_table "products", {
            {"id", types.serial}
            {"name", types.text}
            {"price", types.double}
            {"category_id", types.foreign_key}

            "PRIMARY KEY(id)"
        }
}