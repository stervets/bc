SPRITE = 'tank'
BULLET = 'bullet'
SPEED = 100

VELOCITY = {}
VELOCITY[ACTION.MOVE_UP] =
    x: 0
    y: -SPEED
    angle: 0

VELOCITY[ACTION.MOVE_DOWN] =
    x: 0
    y: SPEED
    angle: 180

VELOCITY[ACTION.MOVE_LEFT] =
    x: -SPEED
    y: 0
    angle: 270

VELOCITY[ACTION.MOVE_RIGHT] =
    x: SPEED
    y: 0
    angle: 90

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

      #enemy.body.bounce.x = 1;
      @turretRecoilTween.start()
      _.delay((tank)->
        tank.canShoot = true
      ,500, @)
  #console.log Phaser.Easing


  move: (direction)->
    @body.angle = VELOCITY[direction].angle
    @body.body.velocity.setTo(VELOCITY[direction].x, VELOCITY[direction].y)

  stop: ()->
    @body.body.velocity.setTo(0, 0)

  constructor: (@game, @x = 0, @y = 0, @bulletGroup = GROUP.ENEMY_BULLET)->
    @bullets = @game.add.group()
    @bullets.enableBody = true
    @bullets.enableBodyDebug = true
    bullet = @game.add.sprite(@game.world.bounds.x-100, @game.world.bounds.y-100, BULLET);
    bullet.anchor.set(0.5,0.5)
    bullet.checkWorldBounds = true;
    bullet.outOfBoundsKill = true;
    #@game.physics.arcade.enable(bullet);

    @bullets.add bullet
    #@game.groups[@bulletGroup].add bullet


    @body = @game.add.sprite(@x, @y, SPRITE)
    @body.anchor.set(0.5, 0.5);
    @turret = @game.add.sprite(0, 0, SPRITE)
    @turret.anchor.set(0.5, 0.5);
    @turret.frame = 1
    @body.addChild(@turret)

    @turretRecoilTween = @game.add.tween(@turret)
    .to({y: 10}, 50)
    .to({y: 0}, 50)

    #проверь без нее
    @game.physics.arcade.enable(@body);
#tween.easing(easingFunction)