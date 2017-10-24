Promise = require 'bluebird'

try
  cache = require 'redis'
  Promise.promisifyAll cache.RedisClient::
  Promise.promisifyAll cache.Multi::
catch error
  cache = null

class CacheClient
  constructor: (url) ->
    @client = cache.createClient url.port, url.host
    return

  ###
  Get a cache item
  @param {string} key - cache key
  @returns {Promise<Buffer>}
  ###
  get: (key) -> @client.get key

  ###
  Set an item in the cache
  @param {string} key - cache key
  @param {string|number|Object} data - data to set in cache
  @param {Object} options
         {number} expires - expiration of data in seconds
  @returns {Promise}
  ###
  set: (key, value, options={}) -> @client.set key, value, options.expires

if cache?
  module.exports = (url) -> new CacheClient url
else
  module.exports = null
