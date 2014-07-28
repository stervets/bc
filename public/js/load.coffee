@Application.State 'Load',
    images: [
      'bullet.png'
      'light.png'
      'map.png'
    ]
    spriteSheets: [
        ['tank.png', 128, 128]
        ['damage.png', 192, 192]
    ]

    preload: ()->
        @app.loadImage image for image in @images
        @app.loadSpriteSheet.apply(@app, sheet) for sheet in @spriteSheets

    create: ()->
        @game.state.start('Game');
