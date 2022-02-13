import Widget from require "lapis.html"

class extends Widget
    content: =>
        link rel: "stylesheet", href: "/static/style.css"

        h1 "Lapis based shop api"
        p "Welcome to Lapis #{require "lapis.version"}!"
  