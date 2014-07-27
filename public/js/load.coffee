@Application.State 'Load',
    images: [
      'bullet.png'
    ]
    spriteSheets: [
        ['tank.png', 128, 128]
    ]

    preload: ()->
        console.log 'load_preload'
        @app.loadImage image for image in @images
        @app.loadSpriteSheet.apply(@app, sheet) for sheet in @spriteSheets

    create: ()->
        @game.state.start('Game');
