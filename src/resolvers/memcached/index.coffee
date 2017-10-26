module.exports = (url) ->
  switch
    when client = require('./memjs')
      client(url)
    when client = require('./memcached')
      client(url)
    else
      null
