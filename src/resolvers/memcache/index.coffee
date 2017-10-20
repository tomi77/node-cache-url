# try
#   memcached = require 'memcached'
# catch error
#   memcached = null
#
# try
#   memcache = require 'memcache'
# catch error
#   memcache = null
#
# try
#   node_memcache = require 'node_memcache'
# catch error
#   node_memcache = null
#
# try
#   memcached_native = require 'memcached-native'
# catch error
#   memcached_native = null


module.exports = (cache_url) ->
  switch
    when client = require('./memjs')
      client(cache_url)
    when client = require('./memcached-promisify')
      client(cache_url)
    # when memcached?
    #   memcached
    # when memcache?
    #   memcache
    # when node_memcache?
    #   node_memcache
    # when memcached_native?
    #   memcached_native
    else
      null
