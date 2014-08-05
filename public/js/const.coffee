@ASSETS =
  IMAGES: '/assets/images/'

@GAME =
  WIDTH: 840
  HEIGHT: 525
  GAME_NODE: 'gameNode'

@ACTION =
  MOVE_UP: 'up'
  MOVE_DOWN: 'down'
  MOVE_LEFT: 'left'
  MOVE_RIGHT: 'right'
  SHOOT: 'shoot'

@GROUP =
  ENEMY_BULLET: 0
  PLAYER_BULLET: 1

@DEFAULT_KEYS = {}
@DEFAULT_KEYS[ACTION.MOVE_UP] = Phaser.Keyboard.UP
@DEFAULT_KEYS[ACTION.MOVE_DOWN] = Phaser.Keyboard.DOWN
@DEFAULT_KEYS[ACTION.MOVE_LEFT] = Phaser.Keyboard.LEFT
@DEFAULT_KEYS[ACTION.MOVE_RIGHT] = Phaser.Keyboard.RIGHT
@DEFAULT_KEYS[ACTION.SHOOT] = Phaser.Keyboard.SPACEBAR

@TILE_TYPE =
  GROUND: 0
  WAll: 1
  ARMOR: 2
  WATER: 3
  ICE: 4
  BUSH: 5
  HQ: 6

@LAYER =
  GROUND: 0
  WALLS: 1
  WATER: 2
  ICE: 3
  BUSH: 4

@LAYER_TILES = {}
LAYER_TILES[TILE_TYPE.GROUND] = LAYER.GROUND
LAYER_TILES[TILE_TYPE.WAll] = LAYER.WALLS
LAYER_TILES[TILE_TYPE.ARMOR] = LAYER.WALLS
LAYER_TILES[TILE_TYPE.WATER] = LAYER.WATER
LAYER_TILES[TILE_TYPE.ICE] = LAYER.ICE
LAYER_TILES[TILE_TYPE.BUSH] = LAYER.BUSH
LAYER_TILES[TILE_TYPE.HQ] = LAYER.GROUND

@MAP_WIDTH = 46
@MAP_HEIGHT = 6

@TILE_ASSOC = {}
@MAP_TILE = []

# GROUND
MAP_TILE[TILE_TYPE.GROUND] = []
for y in [0...MAP_HEIGHT]
  for x in [6..11]
    val = y * MAP_WIDTH + x
    TILE_ASSOC[val] = TILE_TYPE.GROUND
    MAP_TILE[TILE_TYPE.GROUND].push val

# WALL
MAP_TILE[TILE_TYPE.WAll] = []
for y in [0...MAP_HEIGHT]
  for x in [0..5]
    val = y * MAP_WIDTH + x
    TILE_ASSOC[val] = TILE_TYPE.WAll
    MAP_TILE[TILE_TYPE.WAll].push val

# ARMOR
MAP_TILE[TILE_TYPE.ARMOR] = []
for y in [0..1]
  for x in [34..35]
    val = y * MAP_WIDTH + x
    TILE_ASSOC[val] = TILE_TYPE.ARMOR
    MAP_TILE[TILE_TYPE.ARMOR].push val

# WATER
MAP_TILE[TILE_TYPE.WATER] = []
for y in [0...MAP_HEIGHT]
  for x in [18..29]
    val = y * MAP_WIDTH + x
    TILE_ASSOC[val] = TILE_TYPE.WATER
    MAP_TILE[TILE_TYPE.WATER].push val

# ICE
MAP_TILE[TILE_TYPE.ICE] = []
for y in [0...MAP_HEIGHT]
  for x in [12..17]
    val = y * MAP_WIDTH + x
    TILE_ASSOC[val] = TILE_TYPE.ICE
    MAP_TILE[TILE_TYPE.ICE].push val


@MAP = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0]
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 0]
  [0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 2, 2, 0]
  [2, 2, 2, 2, 0, 0, 0, 0, 3, 3, 3, 3, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 2, 2, 0]
  [3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0]
  [3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0]
  [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
  [0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]
]

@REAL_MAP = []
for y in [0...MAP.length*2]
  for yy in [0...2]
    REAL_MAP[y*2+yy] = []
    for x in [0...MAP[0].length*2]
      for xx in [0...2]
        REAL_MAP[y*2+yy][x*2+xx] = MAP[Math.floor y/2][Math.floor x/2]
#console.log REAL_MAP
