url = require 'url'

module.exports = (cache_url=process.env.CACHE_URL) ->
  cache_url = url.parse cache_url

  switch cache_url.protocol
    when 'memcache:', 'memcached:'
      resolver = require './resolvers/memcache'
      cache_url.port or= 11211
      console.log resolver cache_url
      console.log 'memcache', cache_url
    when 'redis:'
      resolver = require './resolvers/redis'
      console.log resolver cache_url
      console.log 'redis', cache_url
    else
      console.log 'unsupported', cache_url
  return
