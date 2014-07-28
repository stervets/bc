@Application.State 'Boot',
    preload: ()->
        @app.loadImage 'progressBar.png'

    create: ()->
        @game.stage.backgroundColor = '#505065'
        @game.physics.startSystem Phaser.Physics.ARCADE
        @game.state.start 'Load'

    , true