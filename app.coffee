express = require 'express'

class Application extends express.HTTPServer
  moduleKeywords = ['extended']
  @extend: (obj) ->
    throw('extend(obj) requires obj') unless obj
    for key, value of obj when key not in moduleKeywords
      @[key] = value
    obj.extended?.apply(this)
    return this
  
express.Application = Application
module.exports = express