// Generated by CoffeeScript 1.7.1
(function() {
  var val, x, y, _i, _j, _k, _l, _m, _n, _o, _p, _q, _r;

  this.ASSETS = {
    IMAGES: '/assets/images/'
  };

  this.GAME = {
    WIDTH: 840,
    HEIGHT: 525,
    GAME_NODE: 'gameNode'
  };

  this.ACTION = {
    MOVE_UP: 'up',
    MOVE_DOWN: 'down',
    MOVE_LEFT: 'left',
    MOVE_RIGHT: 'right',
    SHOOT: 'shoot'
  };

  this.GROUP = {
    ENEMY_BULLET: 0,
    PLAYER_BULLET: 1
  };

  this.DEFAULT_KEYS = {};

  this.DEFAULT_KEYS[ACTION.MOVE_UP] = Phaser.Keyboard.UP;

  this.DEFAULT_KEYS[ACTION.MOVE_DOWN] = Phaser.Keyboard.DOWN;

  this.DEFAULT_KEYS[ACTION.MOVE_LEFT] = Phaser.Keyboard.LEFT;

  this.DEFAULT_KEYS[ACTION.MOVE_RIGHT] = Phaser.Keyboard.RIGHT;

  this.DEFAULT_KEYS[ACTION.SHOOT] = Phaser.Keyboard.SPACEBAR;

  this.TILE_TYPE = {
    GROUND: 0,
    WAll: 1,
    ARMOR: 2,
    WATER: 3,
    ICE: 4
  };

  this.MAP_WIDTH = 46;

  this.MAP_HEIGHT = 6;

  this.TILE_ASSOC = {};

  this.MAP_TILE = [];

  MAP_TILE[TILE_TYPE.GROUND] = [];

  for (y = _i = 0; 0 <= MAP_HEIGHT ? _i < MAP_HEIGHT : _i > MAP_HEIGHT; y = 0 <= MAP_HEIGHT ? ++_i : --_i) {
    for (x = _j = 6; _j <= 11; x = ++_j) {
      val = y * MAP_WIDTH + x;
      TILE_ASSOC[val] = TILE_TYPE.GROUND;
      MAP_TILE[TILE_TYPE.GROUND].push(val);
    }
  }

  MAP_TILE[TILE_TYPE.WAll] = [];

  for (y = _k = 0; 0 <= MAP_HEIGHT ? _k < MAP_HEIGHT : _k > MAP_HEIGHT; y = 0 <= MAP_HEIGHT ? ++_k : --_k) {
    for (x = _l = 0; _l <= 5; x = ++_l) {
      val = y * MAP_WIDTH + x;
      TILE_ASSOC[val] = TILE_TYPE.WAll;
      MAP_TILE[TILE_TYPE.WAll].push(val);
    }
  }

  MAP_TILE[TILE_TYPE.ARMOR] = [];

  for (y = _m = 0; _m <= 1; y = ++_m) {
    for (x = _n = 34; _n <= 35; x = ++_n) {
      val = y * MAP_WIDTH + x;
      TILE_ASSOC[val] = TILE_TYPE.ARMOR;
      MAP_TILE[TILE_TYPE.ARMOR].push(val);
    }
  }

  MAP_TILE[TILE_TYPE.WATER] = [];

  for (y = _o = 0; 0 <= MAP_HEIGHT ? _o < MAP_HEIGHT : _o > MAP_HEIGHT; y = 0 <= MAP_HEIGHT ? ++_o : --_o) {
    for (x = _p = 18; _p <= 29; x = ++_p) {
      val = y * MAP_WIDTH + x;
      TILE_ASSOC[val] = TILE_TYPE.WATER;
      MAP_TILE[TILE_TYPE.WATER].push(val);
    }
  }

  MAP_TILE[TILE_TYPE.ICE] = [];

  for (y = _q = 0; 0 <= MAP_HEIGHT ? _q < MAP_HEIGHT : _q > MAP_HEIGHT; y = 0 <= MAP_HEIGHT ? ++_q : --_q) {
    for (x = _r = 12; _r <= 17; x = ++_r) {
      val = y * MAP_WIDTH + x;
      TILE_ASSOC[val] = TILE_TYPE.ICE;
      MAP_TILE[TILE_TYPE.ICE].push(val);
    }
  }

  this.MAP = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 0], [0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 2, 2, 0], [2, 2, 2, 2, 0, 0, 0, 0, 3, 3, 3, 3, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 2, 2, 0], [3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0], [3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 0, 0, 0, 3, 3, 0, 0, 4, 4, 4, 4, 0], [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 4, 0], [0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 4, 0], [0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0], [0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 1, 1, 4, 4, 0]];

}).call(this);

//# sourceMappingURL=const.map
