module.exports = (cache_url) ->
  switch
    when client = require('./memjs')
      client(cache_url)
    when client = require('./memcached')
      client(cache_url)
    else
      null
