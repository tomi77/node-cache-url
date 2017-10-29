Promise = require 'bluebird'


class CacheClient
  protocol: 'dummy:'

  constructor: () ->
    @client = null
    return

  ###
  Get a cache item
  @param {string} key - cache key
  @returns {Promise<Buffer>}
  ###
  get: (key) -> Promise.resolve null

  ###
  Set an item in the cache
  @param {string} key - cache key
  @param {string|number|Object} data - data to set in cache
  @param {Object} options
         {number} expires - expiration of data in seconds
  @returns {Promise}
  ###
  set: (key, value, options={}) -> Promise.resolve null

module.exports = (url) -> new CacheClient()
