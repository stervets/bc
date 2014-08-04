SPRITE = 'tank'
BULLET = 'bullet'
LIGHT = 'light'
DAMAGE = 'damage'

SPEED = 100

VELOCITY = {}
VELOCITY[ACTION.MOVE_UP] =
    x: 0
    y: -SPEED
    angle: 0

VELOCITY[ACTION.MOVE_RIGHT] =
    x: SPEED
    y: 0
    angle: 90

VELOCITY[ACTION.MOVE_DOWN] =
    x: 0
    y: SPEED
    angle: 180

VELOCITY[ACTION.MOVE_LEFT] =
    x: -SPEED
    y: 0
    angle: -90



class @Tank
  bulletGroup: GROUP.ENEMY_BULLET
  canShoot: true
  bullets: null

  shoot: ()->
    if (@canShoot && bullet = @bullets.getFirstDead())
      @canShoot = false
      bullet.reset @body.position.x, @body.position.y
      bullet.angle = @body.angle
      #bullet.body.velocity.x = 500
      @game.physics.arcade.velocityFromAngle(@body.angle-90, 500, bullet.body.velocity);

      @lightTween.start()
      #enemy.body.bounce.x = 1;
      @turretRecoilTween.start()
      _.delay((tank)->
        tank.canShoot = true
      ,500, @)
  #console.log Phaser.Easing


  move: (direction)->
    @body.body.position.x = if VELOCITY[direction].x then @body.body.position.x else Math.round(@body.body.position.x/16)*16
    @body.body.position.y = if VELOCITY[direction].y then @body.body.position.y else Math.round(@body.body.position.y/16)*16
    @body.body.velocity.setTo(VELOCITY[direction].x, VELOCITY[direction].y)

    #@body.angle = Math.abs(@body.angle)
    #if @body.angle isnt VELOCITY[direction].angle

    angleFrom = @body.angle
    angleTo = VELOCITY[direction].angle
    if Math.abs(angleFrom) isnt angleTo or Math.abs(angleFrom) is 90
      @angleTween._valuesStart.angle = switch
                                        when angleFrom is 180 and angleTo is -90
                                          @body.angle = -179
                                          -180
                                        when angleFrom is -90 and angleTo is 180
                                          @body.angle = 269
                                          270
                                        when angleFrom is -180 and angleTo is 90
                                          @body.angle = 179
                                          180
                                        else angleFrom

      @angleTween._valuesEnd.angle = if angleFrom is -90 and angleTo is 180 then -180 else angleTo
      @angleTween.start()

  stop: ()->
    @body.body.velocity.setTo(0, 0)
    #@body.body.position.setTo(@body.body.position.x - @body.body.position.x % 16,
    #  @body.body.position.y - @body.body.position.y % 16)

  onBulletCollide: (bullet)=>
    @damageAnimation.position.set(bullet.position.x,bullet.position.y)
    @damageAnimation.rotation = bullet.rotation
    #_dump bullet
    bullet.kill()
    @damageAnimation.animations.play(DAMAGE)

  constructor: (@game, @x = 0, @y = 0, @bulletGroup = GROUP.ENEMY_BULLET)->
    @bullets = @game.add.group()
    @bullets.enableBody = true
    @bullets.enableBodyDebug = true
    bullet = @game.add.sprite(@game.world.bounds.x-100, @game.world.bounds.y-100, BULLET)
    bullet.anchor.set(0.5,0.5)
    bullet.checkWorldBounds = true;
    bullet.outOfBoundsKill = true;
    #@game.physics.arcade.enable(bullet);

    @bullets.add bullet
    #@game.groups[@bulletGroup].add bullet
    @damageAnimation = @game.add.sprite(0, 0, DAMAGE);
    #@damageAnimation.blendMode = PIXI.blendModes.ADD
    @damageAnimation.anchor.setTo(0.5, 0.7);
    @damageAnimation.scale.setTo(0.4, 0.4);
    @damageAnimation.animations.add(DAMAGE, [0, 1, 2, 3, 4, 5], 32)

    @body = @game.add.sprite(@x, @y, SPRITE)
    @body.anchor.set(0.5, 0.5);

    @turret = @game.add.sprite(0, 0, SPRITE)
    @turret.anchor.set(0.5, 0.5);
    @turret.frame = 1
    @body.addChild(@turret)

    @turretRecoilTween = @game.add.tween(@turret)
    .to({y: 10}, 50)
    .to({y: 0}, 100)
    @game.physics.arcade.enable(@body);

    @light = @game.add.sprite(0, -@body.height/2, LIGHT)
    @light.anchor.set(0.5, 0.5)
    @light.alpha = 0.9
    @light.blendMode = PIXI.blendModes.ADD
    @light.scale.setTo(0)
    @lightTween = @game.add.tween(@light.scale).to({x: 1, y:3}, 50).to({x: 0, y:0}, 100)

    @body.addChild(@light)
    @body.scale.set(0.5);

    @angleTween = @game.add.tween(@body)
    @angleTween.to({angle: 90}, 100)
    #_dump @angleTween
    #_dump @angleTween

    #@changeDirectionTweens = {}
    #angle = 0
    #for name, params of VELOCITY
      #({x:100, y:0, alpha: 0, angle: 0}
      #tween_ball.to({x:100, y:0, alpha: 0, angle: 0}, 2000, Phaser.Easing.Bounce.In, true, 100, false)
      #__dump angle++*90
    #      @changeDirectionTweens[name] = @game.add.tween(@body).to({angle: angle++*90}, 200)
    #tween.easing(easingFunction)