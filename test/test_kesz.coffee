assert = require('chai').assert

kesz = require '../src'

describe 'A Error was throw when', () ->
  it 'protocol is unsupported', () ->
    fn = () ->
      cache = kesz 'qaz://'
      return
    assert.throws fn

  it 'no libs was found', () ->
    fn = () ->
      cache = kesz 'memcached://'
      return
    assert.throws fn
