@Application.State 'Game',
  getLayer: (map, x, y)->
    xx = Math.round(x/2)
    yy = Math.round(y/2)
    return if xx<0 or xx>=MAP[0].length or yy<0 or yy>=MAP.length then null else
      @layer[LAYER_TILES[MAP[yy][xx]]]

  getTile: (map, x, y)->
    layer = @getLayer map, x, y
    return if layer then map.getTile(x,y, layer) else null

  getTileIndex: (map, x, y)->
    tile = @getTile(map, x, y)
    return if tile then TILE_ASSOC[tile.index] else -1

  processTile: (map, x, y)->
    x *= 2
    y *= 2

    width = MAP[0].length - 1
    height = MAP.length - 1

    thisTile = @getTileIndex map, x, y

    tile =
      #topLeft: @getTileIndex map, x - 2, y - 2
      top: @getTileIndex map, x, y - 2
      #topRight: @getTileIndex map, x + 2, y - 2
      left: @getTileIndex map, x - 2, y
      right: @getTileIndex map, x + 2, y
      #bottomLeft: @getTileIndex map, x - 2, y + 2
      bottom: @getTileIndex map, x, y + 2
      #bottomRight: @getTileIndex map, x + 2, y + 2

    res = [0,0,0,0]
    switch thisTile
      when TILE_TYPE.GROUND
        flat = [7,8,9,10, 13,14,15,16, 19,20,21,22, 25,26,27,28]
        flatLen = flat.length-1
        res[0] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]]
        res[2] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]]
        res[1] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]]
        res[3] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]]

        if tile.right isnt thisTile and tile.right isnt TILE_TYPE.WATER
          res[1] = MAP_TILE[TILE_TYPE.GROUND][11]
          res[3] = MAP_TILE[TILE_TYPE.GROUND][17]

        if tile.left isnt thisTile and tile.left isnt TILE_TYPE.WATER
          res[0] = MAP_TILE[TILE_TYPE.GROUND][6]
          res[2] = MAP_TILE[TILE_TYPE.GROUND][12]

        if tile.top isnt thisTile and tile.top isnt TILE_TYPE.WATER
          res[0] = MAP_TILE[TILE_TYPE.GROUND][1]
          res[1] = MAP_TILE[TILE_TYPE.GROUND][2]

        if tile.bottom isnt thisTile and tile.bottom isnt TILE_TYPE.WATER
          res[2] = MAP_TILE[TILE_TYPE.GROUND][31]
          res[3] = MAP_TILE[TILE_TYPE.GROUND][32]

        if tile.left isnt thisTile and tile.top isnt thisTile and
           tile.left isnt TILE_TYPE.WATER and tile.top isnt TILE_TYPE.WATER
              res[0] = MAP_TILE[TILE_TYPE.GROUND][0]

        if tile.right isnt thisTile and tile.top isnt thisTile and
           tile.right isnt TILE_TYPE.WATER and tile.top isnt TILE_TYPE.WATER
              res[1] = MAP_TILE[TILE_TYPE.GROUND][5]

        if tile.left isnt thisTile and tile.bottom isnt thisTile and
           tile.left isnt TILE_TYPE.WATER and tile.bottom isnt TILE_TYPE.WATER
              res[2] = MAP_TILE[TILE_TYPE.GROUND][30]

        if tile.right isnt thisTile and tile.bottom isnt thisTile and
           tile.right isnt TILE_TYPE.WATER and tile.bottom isnt TILE_TYPE.WATER
              res[3] = MAP_TILE[TILE_TYPE.GROUND][35]

      when TILE_TYPE.WAll
        flat = [7,8,9,10, 13,14,15,16, 19,20,21,22, 25,26,27,28]
        flatLen = flat.length-1
        res[0] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]]
        res[2] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]]
        res[1] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]]
        res[3] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]]

        if tile.right isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.WAll][11]
          res[3] = MAP_TILE[TILE_TYPE.WAll][17]

        if tile.left isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WAll][6]
          res[2] = MAP_TILE[TILE_TYPE.WAll][12]

        if tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WAll][1]
          res[1] = MAP_TILE[TILE_TYPE.WAll][2]

        if tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.WAll][31]
          res[3] = MAP_TILE[TILE_TYPE.WAll][32]

        if tile.left isnt thisTile and tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WAll][0]

        if tile.right isnt thisTile and tile.top isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.WAll][5]

        if tile.left isnt thisTile and tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.WAll][30]

        if tile.right isnt thisTile and tile.bottom isnt thisTile
          res[3] = MAP_TILE[TILE_TYPE.WAll][35]

      when TILE_TYPE.WATER
        res[0] = MAP_TILE[TILE_TYPE.WATER][45]
        res[1] = MAP_TILE[TILE_TYPE.WATER][46]
        res[2] = MAP_TILE[TILE_TYPE.WATER][57]
        res[3] = MAP_TILE[TILE_TYPE.WATER][58]

        if tile.right isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.WATER][47]
          res[3] = MAP_TILE[TILE_TYPE.WATER][59]

        if tile.left isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WATER][44]
          res[2] = MAP_TILE[TILE_TYPE.WATER][56]

        if tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WATER][33]
          res[1] = MAP_TILE[TILE_TYPE.WATER][34]

        if tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.WATER][65]
          res[3] = MAP_TILE[TILE_TYPE.WATER][66]

        if tile.left isnt thisTile and tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.WATER][32]

        if tile.right isnt thisTile and tile.top isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.WATER][35]

        if tile.left isnt thisTile and tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.WATER][64]

        if tile.right isnt thisTile and tile.bottom isnt thisTile
          res[3] = MAP_TILE[TILE_TYPE.WATER][67]

      when TILE_TYPE.ICE
        flat = [7,8,9,10, 13,14,15,16, 19,20,21,22, 25,26,27,28]
        flatLen = flat.length-1
        res[0] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]]
        res[2] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]]
        res[1] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]]
        res[3] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]]

        if tile.right isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.ICE][11]
          res[3] = MAP_TILE[TILE_TYPE.ICE][17]

        if tile.left isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.ICE][6]
          res[2] = MAP_TILE[TILE_TYPE.ICE][12]

        if tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.ICE][1]
          res[1] = MAP_TILE[TILE_TYPE.ICE][2]

        if tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.ICE][31]
          res[3] = MAP_TILE[TILE_TYPE.ICE][32]

        if tile.left isnt thisTile and tile.top isnt thisTile
          res[0] = MAP_TILE[TILE_TYPE.ICE][0]

        if tile.right isnt thisTile and tile.top isnt thisTile
          res[1] = MAP_TILE[TILE_TYPE.ICE][5]

        if tile.left isnt thisTile and tile.bottom isnt thisTile
          res[2] = MAP_TILE[TILE_TYPE.ICE][30]

        if tile.right isnt thisTile and tile.bottom isnt thisTile
          res[3] = MAP_TILE[TILE_TYPE.ICE][35]
      when TILE_TYPE.ARMOR then res = MAP_TILE[TILE_TYPE.ARMOR]


    layer = @getLayer(map, x, y)
    map.getTile(x, y, layer).index = res[0]
    map.getTile(x+1, y, layer).index = res[1]
    map.getTile(x, y+1, layer).index = res[2]
    map.getTile(x+1, y+1, layer).index = res[3]

    #size = layer.map.tileWidth
    #for y in [0...layer.map.height]
    #  for x in [0...layer.map.width]
    #    console.log map.getTile(x,y,layer).index# layer.getTiles(x-size, y-size, size*2, size*2, false)

  create: ()->
    #@map = _.cloneDeep(MAP)
    map = @game.add.tilemap(null, 16, 16)
    map.addTilesetImage 'map'
    map.create(name, MAP[0].length*2, MAP.length*2, 16, 16)

    @layer = []

    for name, index of LAYER
      @layer[index] = map.createBlankLayer(name, MAP[0].length*2, MAP.length*2, 16, 16)

    mapWidth = map.width - 1
    mapHeight = map.height - 1

    for line, y in MAP
      for value, x in line
        rx = x * 2
        ry = y * 2
        tile = map.putTile(MAP_TILE[value][0], rx, ry, @layer[LAYER_TILES[value]]);
        map.putTile(MAP_TILE[value][0], rx + 1, ry, @layer[LAYER_TILES[value]]);
        map.putTile(MAP_TILE[value][0], rx, ry + 1, @layer[LAYER_TILES[value]]);
        map.putTile(MAP_TILE[value][0], rx + 1, ry + 1, @layer[LAYER_TILES[value]]);


    for line, y in MAP
      for value, x in line
        @processTile map, x, y


    #console.log map.layers

    for layer, index in @layer
      tiles = []
      for tile, layerIndex of LAYER_TILES
        tiles = tiles.concat(MAP_TILE[tile]) if MAP_TILE[tile] and layerIndex is index
      map.setCollision(tiles, true, layer)

    @game.world.setBounds(0, 0, GAME.WIDTH, GAME.HEIGHT);
    @bullets = []
    @game.groups = []
    for name, index of GROUP
      @game.groups[index] = @game.add.group()
      @game.groups[index].enableBody = true
      #@game.groups[index].enableBodyDebug = true

    @player = new Tank @game, 32*9, 32*15, GROUP.ENEMY_BULLET
    @playerController = new Application.Controller.User(@game, @player)

  update: ()->
    @playerController.update()
    @game.physics.arcade.collide(@player.body, @layer[LAYER.WALLS]);
    @game.physics.arcade.collide(@player.body, @layer[LAYER.WATER]);

    @game.physics.arcade.collide(@player.bullets, @layer[LAYER.WALLS], @player.onBulletCollide);

#@game.debug.body(@player.body)
#@game.debug.cameraInfo(@game.camera, 32, 32)
#@game.debug.spriteCoords(@player.body, 32, 450)


