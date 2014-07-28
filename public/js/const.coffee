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