{EventEmitter}  = require 'events'
debug           = require('debug')('meshblu-connector-ableton-push:index')
Ableton         = require = require 'ableton-push'

class Connector extends EventEmitter

  connect: =>
    @ableton = new Ableton
    @ableton.connect()
    @ableton.on 'button', (message) => @emit 'message', message

  constructor: ->
    connect()

  isOnline: (callback) =>
    callback null, running: true

  close: (callback) =>
    debug 'on close'
    callback()

  onConfig: (device={}) =>
    { options } = device
    @ableton.setButtonColors options?.buttons

  start: (device, callback) =>
    debug 'started'
    @onConfig device
    callback()

module.exports = Connector
