# kesz

[![Build Status](https://travis-ci.org/tomi77/node-kesz.svg?branch=master)](https://travis-ci.org/tomi77/node-kesz)
[![Coverage Status](https://coveralls.io/repos/github/tomi77/node-kesz/badge.svg?branch=master)](https://coveralls.io/github/tomi77/node-kesz?branch=master)
[![dependencies Status](https://david-dm.org/tomi77/node-kesz/status.svg)](https://david-dm.org/tomi77/node-kesz)
[![devDependencies Status](https://david-dm.org/tomi77/node-kesz/dev-status.svg)](https://david-dm.org/tomi77/node-kesz?type=dev)

Unified cache access library for Node

## Table of contents

* [Installation](#installation)
* [Envirnoment](#envirnoment)
* [Cache URL format](#cache-url-format)
* [Supported libs](#supported-libs)
* [Usage](#usage)
* [API](#api)

## Installation

### NPM

~~~bash
npm install kesz --save
~~~

### Yarn

~~~bash
yarn add kesz
~~~

## Envirnoment

### `CACHE_URL`

Cache URL

## Cache URL format

`service://host:port`

Where `service` is one of

* `memcache` - Memcached server
* `memcached` - Memcached server
* `redis` - Redis server
* `hiredis` - Redis server
* `dummy` - Dummy - nothing writes, nothing reads

## Supported libs

### memcache

* [memjs](https://www.npmjs.com/package/memjs)
* [memcached](https://www.npmjs.com/package/memcached)
* [redis](https://www.npmjs.com/package/redis)

## Usage

Install `kesz` and Your prefer cache library.

~~~js
const cache = require('kesz')('memcache://localhost:11211')
cache.set('key', 'qaz123')
.then(function() {
  cache.get('key')
}).then(function(key) {
  console.log(key)
})
~~~

## API

#### `client`

Direct access to client library

#### `set(key, value [, options]) -> Promise`

___Parameters___

* `key` <`string`>

  cache key

* `value` <`number` | `string` | `object`>

  data to set in cache

* `options` <`object`>

  options

  * `expires` <`number`>

    expiration of data in seconds

___Return value___

`Promise`

Set an item in the cache

#### `get(key) -> Promise`

___Parameters___

* `key` <`string`>

  cache key

___Return value___

`Promise<Buffer>`

Get a cache item
