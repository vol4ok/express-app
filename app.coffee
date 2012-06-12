mosule.exports = express = require 'express'

moduleKeywords = ['extended']

class Application extends express.HTTPServer
  @extend: (obj) ->
    throw('extend(obj) requires obj') unless obj
    for key, value of obj when key not in moduleKeywords
      @[key] = value
    obj.extended?.apply(this)
    return this
    
exports.Application = Application