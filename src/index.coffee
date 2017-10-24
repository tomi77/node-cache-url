url = require 'url'

module.exports = (cache_url=process.env.CACHE_URL) ->
  cache_url = url.parse cache_url

  switch cache_url.protocol
    when 'memcache:', 'memcached:'
      cache_url.port or= 11211
      require './resolvers/memcached'
    when 'redis:', 'hiredis:'
      require './resolvers/redis'
    when 'dummy:'
      require './resolvers/dummy'
    else
      throw new Error "Unsupported engine #{ cache_url.protocol }"
  return
