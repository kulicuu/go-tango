

c = -> console.log.apply console, arguments

_ = require 'lodash'

exports.rev = (str) ->
    rayy = str.split ''
    idx = 0
    jdx = rayy.length - 1
    while idx < jdx
        cursor = rayy[idx]
        rayy[idx] = rayy[jdx]
        rayy[jdx] = cursor
        idx++
        jdx--
    return rayy.join('')


exports.require_uncached = (module) ->
    delete require.cache[require.resolve(module)]
    return require(module)
