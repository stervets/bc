// Generated by CoffeeScript 1.7.1
(function() {
  this.Application.State('Game', {
    getLayer: function(map, x, y) {
      var xx, yy;
      xx = Math.round(x / 2);
      yy = Math.round(y / 2);
      if (xx < 0 || xx >= MAP[0].length || yy < 0 || yy >= MAP.length) {
        return null;
      } else {
        return this.layer[LAYER_TILES[MAP[yy][xx]]];
      }
    },
    getTile: function(map, x, y) {
      var layer;
      layer = this.getLayer(map, x, y);
      if (layer) {
        return map.getTile(x, y, layer);
      } else {
        return null;
      }
    },
    getTileIndex: function(map, x, y) {
      var tile;
      tile = this.getTile(map, x, y);
      if (tile) {
        return TILE_ASSOC[tile.index];
      } else {
        return -1;
      }
    },
    processTile: function(map, x, y) {
      var flat, flatLen, height, layer, res, thisTile, tile, width;
      x *= 2;
      y *= 2;
      width = MAP[0].length - 1;
      height = MAP.length - 1;
      thisTile = this.getTileIndex(map, x, y);
      tile = {
        top: this.getTileIndex(map, x, y - 2),
        left: this.getTileIndex(map, x - 2, y),
        right: this.getTileIndex(map, x + 2, y),
        bottom: this.getTileIndex(map, x, y + 2)
      };
      res = [0, 0, 0, 0];
      switch (thisTile) {
        case TILE_TYPE.GROUND:
          flat = [7, 8, 9, 10, 13, 14, 15, 16, 19, 20, 21, 22, 25, 26, 27, 28];
          flatLen = flat.length - 1;
          res[0] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]];
          res[2] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]];
          res[1] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]];
          res[3] = MAP_TILE[TILE_TYPE.GROUND][flat[rand(flatLen)]];
          if (tile.right !== thisTile && tile.right !== TILE_TYPE.WATER) {
            res[1] = MAP_TILE[TILE_TYPE.GROUND][11];
            res[3] = MAP_TILE[TILE_TYPE.GROUND][17];
          }
          if (tile.left !== thisTile && tile.left !== TILE_TYPE.WATER) {
            res[0] = MAP_TILE[TILE_TYPE.GROUND][6];
            res[2] = MAP_TILE[TILE_TYPE.GROUND][12];
          }
          if (tile.top !== thisTile && tile.top !== TILE_TYPE.WATER) {
            res[0] = MAP_TILE[TILE_TYPE.GROUND][1];
            res[1] = MAP_TILE[TILE_TYPE.GROUND][2];
          }
          if (tile.bottom !== thisTile && tile.bottom !== TILE_TYPE.WATER) {
            res[2] = MAP_TILE[TILE_TYPE.GROUND][31];
            res[3] = MAP_TILE[TILE_TYPE.GROUND][32];
          }
          if (tile.left !== thisTile && tile.top !== thisTile && tile.left !== TILE_TYPE.WATER && tile.top !== TILE_TYPE.WATER) {
            res[0] = MAP_TILE[TILE_TYPE.GROUND][0];
          }
          if (tile.right !== thisTile && tile.top !== thisTile && tile.right !== TILE_TYPE.WATER && tile.top !== TILE_TYPE.WATER) {
            res[1] = MAP_TILE[TILE_TYPE.GROUND][5];
          }
          if (tile.left !== thisTile && tile.bottom !== thisTile && tile.left !== TILE_TYPE.WATER && tile.bottom !== TILE_TYPE.WATER) {
            res[2] = MAP_TILE[TILE_TYPE.GROUND][30];
          }
          if (tile.right !== thisTile && tile.bottom !== thisTile && tile.right !== TILE_TYPE.WATER && tile.bottom !== TILE_TYPE.WATER) {
            res[3] = MAP_TILE[TILE_TYPE.GROUND][35];
          }
          break;
        case TILE_TYPE.WAll:
          flat = [7, 8, 9, 10, 13, 14, 15, 16, 19, 20, 21, 22, 25, 26, 27, 28];
          flatLen = flat.length - 1;
          res[0] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]];
          res[2] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]];
          res[1] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]];
          res[3] = MAP_TILE[TILE_TYPE.WAll][flat[rand(flatLen)]];
          if (tile.right !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.WAll][11];
            res[3] = MAP_TILE[TILE_TYPE.WAll][17];
          }
          if (tile.left !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WAll][6];
            res[2] = MAP_TILE[TILE_TYPE.WAll][12];
          }
          if (tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WAll][1];
            res[1] = MAP_TILE[TILE_TYPE.WAll][2];
          }
          if (tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.WAll][31];
            res[3] = MAP_TILE[TILE_TYPE.WAll][32];
          }
          if (tile.left !== thisTile && tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WAll][0];
          }
          if (tile.right !== thisTile && tile.top !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.WAll][5];
          }
          if (tile.left !== thisTile && tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.WAll][30];
          }
          if (tile.right !== thisTile && tile.bottom !== thisTile) {
            res[3] = MAP_TILE[TILE_TYPE.WAll][35];
          }
          break;
        case TILE_TYPE.WATER:
          res[0] = MAP_TILE[TILE_TYPE.WATER][45];
          res[1] = MAP_TILE[TILE_TYPE.WATER][46];
          res[2] = MAP_TILE[TILE_TYPE.WATER][57];
          res[3] = MAP_TILE[TILE_TYPE.WATER][58];
          if (tile.right !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.WATER][47];
            res[3] = MAP_TILE[TILE_TYPE.WATER][59];
          }
          if (tile.left !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WATER][44];
            res[2] = MAP_TILE[TILE_TYPE.WATER][56];
          }
          if (tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WATER][33];
            res[1] = MAP_TILE[TILE_TYPE.WATER][34];
          }
          if (tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.WATER][65];
            res[3] = MAP_TILE[TILE_TYPE.WATER][66];
          }
          if (tile.left !== thisTile && tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.WATER][32];
          }
          if (tile.right !== thisTile && tile.top !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.WATER][35];
          }
          if (tile.left !== thisTile && tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.WATER][64];
          }
          if (tile.right !== thisTile && tile.bottom !== thisTile) {
            res[3] = MAP_TILE[TILE_TYPE.WATER][67];
          }
          break;
        case TILE_TYPE.ICE:
          flat = [7, 8, 9, 10, 13, 14, 15, 16, 19, 20, 21, 22, 25, 26, 27, 28];
          flatLen = flat.length - 1;
          res[0] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]];
          res[2] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]];
          res[1] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]];
          res[3] = MAP_TILE[TILE_TYPE.ICE][flat[rand(flatLen)]];
          if (tile.right !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.ICE][11];
            res[3] = MAP_TILE[TILE_TYPE.ICE][17];
          }
          if (tile.left !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.ICE][6];
            res[2] = MAP_TILE[TILE_TYPE.ICE][12];
          }
          if (tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.ICE][1];
            res[1] = MAP_TILE[TILE_TYPE.ICE][2];
          }
          if (tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.ICE][31];
            res[3] = MAP_TILE[TILE_TYPE.ICE][32];
          }
          if (tile.left !== thisTile && tile.top !== thisTile) {
            res[0] = MAP_TILE[TILE_TYPE.ICE][0];
          }
          if (tile.right !== thisTile && tile.top !== thisTile) {
            res[1] = MAP_TILE[TILE_TYPE.ICE][5];
          }
          if (tile.left !== thisTile && tile.bottom !== thisTile) {
            res[2] = MAP_TILE[TILE_TYPE.ICE][30];
          }
          if (tile.right !== thisTile && tile.bottom !== thisTile) {
            res[3] = MAP_TILE[TILE_TYPE.ICE][35];
          }
          break;
        case TILE_TYPE.ARMOR:
          res = MAP_TILE[TILE_TYPE.ARMOR];
      }
      layer = this.getLayer(map, x, y);
      map.getTile(x, y, layer).index = res[0];
      map.getTile(x + 1, y, layer).index = res[1];
      map.getTile(x, y + 1, layer).index = res[2];
      return map.getTile(x + 1, y + 1, layer).index = res[3];
    },
    destroyWall: function(wall, angle, power) {
      var dir, shift, vertical, x, x1, x2, y, y1, y2, _i, _ref, _ref1, _results;
      if (power == null) {
        power = 1;
      }
      vertical = !!(angle % 180);
      shift = wall[(vertical ? 'y' : 'x')] % 2;
      if (!angle) {
        angle = 1;
      }
      dir = angle / Math.abs(angle);
      if (vertical) {
        x1 = wall.x + dir * power + 1;
        x2 = wall.x + 1;
        if (x1 > x2) {
          _ref = [x2 - 1, x1 - 1], x1 = _ref[0], x2 = _ref[1];
        }
        y1 = wall.y - shift;
        y2 = wall.y + shift + 2;
      } else {
        y1 = wall.y - dir * power + 1;
        y2 = wall.y + 1;
        if (y1 > y2) {
          _ref1 = [y2 - 1, y1 - 1], y1 = _ref1[0], y2 = _ref1[1];
        }
        x1 = wall.x - shift;
        x2 = wall.x + shift + 2;
      }
      _results = [];
      for (x = _i = x1; x1 <= x2 ? _i < x2 : _i > x2; x = x1 <= x2 ? ++_i : --_i) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (y = _j = y1; y1 <= y2 ? _j < y2 : _j > y2; y = y1 <= y2 ? ++_j : --_j) {
            this.map.removeTile(x, y, this.layer[LAYER.WALLS]);
            _results1.push(this.map.putTile(MAP_TILE[TILE_TYPE.GROUND][0], x, y, this.layer[LAYER.GROUND]));
          }
          return _results1;
        }).call(this));
      }
      return _results;

      /*
      for x in [x1...x2]
        for y in [y1...y2]
          @processTile @map, x, y
       */
    },
    create: function() {
      var index, layer, layerIndex, line, mapHeight, mapWidth, name, rx, ry, tile, tiles, value, x, y, _i, _j, _k, _l, _len, _len1, _len2, _len3, _len4, _m, _ref;
      this.map = this.game.add.tilemap(null, 16, 16);
      this.map.addTilesetImage('map');
      this.map.create(name, MAP[0].length * 2, MAP.length * 2, 16, 16);
      this.layer = [];
      for (name in LAYER) {
        index = LAYER[name];
        this.layer[index] = this.map.createBlankLayer(name, MAP[0].length * 2, MAP.length * 2, 16, 16);
      }
      mapWidth = this.map.width - 1;
      mapHeight = this.map.height - 1;
      for (y = _i = 0, _len = MAP.length; _i < _len; y = ++_i) {
        line = MAP[y];
        for (x = _j = 0, _len1 = line.length; _j < _len1; x = ++_j) {
          value = line[x];
          rx = x * 2;
          ry = y * 2;
          tile = this.map.putTile(MAP_TILE[value][0], rx, ry, this.layer[LAYER_TILES[value]]);
          this.map.putTile(MAP_TILE[value][0], rx + 1, ry, this.layer[LAYER_TILES[value]]);
          this.map.putTile(MAP_TILE[value][0], rx, ry + 1, this.layer[LAYER_TILES[value]]);
          this.map.putTile(MAP_TILE[value][0], rx + 1, ry + 1, this.layer[LAYER_TILES[value]]);
        }
      }
      for (y = _k = 0, _len2 = MAP.length; _k < _len2; y = ++_k) {
        line = MAP[y];
        for (x = _l = 0, _len3 = line.length; _l < _len3; x = ++_l) {
          value = line[x];
          this.processTile(this.map, x, y);
        }
      }
      _ref = this.layer;
      for (index = _m = 0, _len4 = _ref.length; _m < _len4; index = ++_m) {
        layer = _ref[index];
        tiles = [];
        for (tile in LAYER_TILES) {
          layerIndex = LAYER_TILES[tile];
          if (MAP_TILE[tile] && layerIndex === index) {
            tiles = tiles.concat(MAP_TILE[tile]);
          }
        }
        this.map.setCollision(tiles, true, layer);
      }
      this.game.world.setBounds(0, 0, GAME.WIDTH, GAME.HEIGHT);
      this.bullets = [];
      this.game.groups = [];
      for (name in GROUP) {
        index = GROUP[name];
        this.game.groups[index] = this.game.add.group();
        this.game.groups[index].enableBody = true;
      }
      this.player = new Tank(this.game, 32 * 9, 32 * 15, GROUP.ENEMY_BULLET);
      return this.playerController = new Application.Controller.User(this.game, this.player);
    },
    update: function() {
      this.playerController.update();
      this.game.physics.arcade.collide(this.player.body, this.layer[LAYER.WALLS]);
      this.game.physics.arcade.collide(this.player.body, this.layer[LAYER.WATER]);
      return this.game.physics.arcade.collide(this.player.bullets, this.layer[LAYER.WALLS], this.player.onBulletWallCollide);
    }
  });

}).call(this);

//# sourceMappingURL=game.map
