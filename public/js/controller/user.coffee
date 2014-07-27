class @Application.Controller.User
  tank: null
  keys: {}

  onMoveKeyDown: (e)->
    _dump @_keySign[e.keyCode] & 1
    if @_keySign[e.keyCode] & 1 and not (@pressedKeys & 1)
      @tank.move DIRECTION.UP
    else if @_keySign[e.keyCode] & 2 and not (@pressedKeys & 2)
      @tank.move DIRECTION.DOWN
    else if @_keySign[e.keyCode] & 4 and not @pressedKeys & 4
      @tank.move DIRECTION.LEFT
    else if @_keySign[e.keyCode] & 8 and not @pressedKeys & 8
      @tank.move DIRECTION.RIGHT

    @pressedKeys |= @_keySign[e.keyCode]


  onMoveKeyUp: (e)->
    @pressedKeys ^= @_keySign[e.keyCode]
    @tank.stop() if not @pressedKeys

  onShoot: ()->
    @tank.shoot()

  _pressedKeys: 0
  _oldPressedKeys: 0
  _keySign: {}
  _moveKeyObjects: {}
  _moveKeys: []
  _shootKey: null

  update: ()->
    for action in @_moveKeys
      if @_moveKeyObjects[action].isDown
        @_pressedKeys |= @_keySign[action]
      else
        @_pressedKeys ^= @_keySign[action] if @_pressedKeys & @_keySign[action]

    if  @_pressedKeys isnt @_oldPressedKeys
      for action, index in @_moveKeys
        break if @_moveKeyObjects[action].isDown and (@_oldPressedKeys > @_pressedKeys or not (@_oldPressedKeys & @_keySign[action]))
      if index < @_moveKeys.length then @tank.move action else @tank.stop()
      @_oldPressedKeys = @_pressedKeys

    @tank.shoot() if @_shootKey.isDown

  constructor: (@game, @tank, keys = {})->
    pow = 0

    for name, action of ACTION when action isnt ACTION.SHOOT
      @_keySign[action] = Math.pow 2, pow++
      @_moveKeys.push(action)
      @_moveKeyObjects[action] = @game.input.keyboard.addKey(if keys[action]? then keys[action] else DEFAULT_KEYS[action])
    @_shootKey = @game.input.keyboard.addKey(if keys[ACTION.SHOOT]? then keys[ACTION.SHOOT] else DEFAULT_KEYS[ACTION.SHOOT])
