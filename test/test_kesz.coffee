assert = require('chai').assert

kesz = require '../src'

describe 'A Error was throw when', () ->
  it 'protocol is unsupported', () ->
    fn = () -> kesz 'qaz://'
    assert.throws fn

  it 'no libs was found', () ->
    fn = () -> kesz 'memcached://'
    assert.throws fn

  it 'CACHE_URL is not set', () ->
    fn = () -> kesz()
    assert.throws fn
