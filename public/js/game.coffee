@Application.State 'Game',

    create: ()->
        @game.world.setBounds(0,0,GAME.WIDTH, GAME.HEIGHT);
        @bullets = []
        @game.groups = []
        for name, index of GROUP
          @game.groups[index] = @game.add.group()
          @game.groups[index].enableBody = true
          @game.groups[index].enableBodyDebug = true

        @player = new Tank @game, 200,200, GROUP.ENEMY_BULLET
        @playerController = new Application.Controller.User(@game, @player)

    update: ()->
      @playerController.update()
      @game.debug.body(@player.body)
      @game.debug.cameraInfo(@game.camera, 32, 32)
      @game.debug.spriteCoords(@player.body, 32, 450)


