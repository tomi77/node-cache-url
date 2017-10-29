Promise = require 'bluebird'

try
  cache = require 'memjs'
  Promise.promisifyAll cache.Client::
catch error
  cache = null

class CacheClient
  protocol: 'memcached:'

  constructor: (url) ->
    @client = cache.Client.create "#{ url.hostname }:#{ url.port }"
    return

  ###
  Get a cache item
  @param {string} key - cache key
  @returns {Promise<Buffer>}
  ###
  get: (key) -> @client.getAsync key

  ###
  Set an item in the cache
  @param {string} key - cache key
  @param {string|number|Object} data - data to set in cache
  @param {Object} options
         {number} expires - expiration of data in seconds
  @returns {Promise}
  ###
  set: (key, value, options={}) -> @client.setAsync key, value, options

if cache?
  module.exports = (url) -> new CacheClient url
else
  module.exports = null
