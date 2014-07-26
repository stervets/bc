@Application.State 'Boot',
    preload: ()->
        _dump Phaser
        @loadPng 'progressBar'

    create: ()->
        console.log 111

    , true