@Application.State 'Boot',
    preload: ()->
        @app.loadImage 'progressBar.png'

    create: ()->
        @game.stage.backgroundColor = '#3498db'
        @game.physics.startSystem Phaser.Physics.ARCADE
        @game.state.start 'Load'

    , true