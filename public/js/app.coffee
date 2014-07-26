class @Application
    @states: {}
    @initialState: null

    @State: (name, params, initialState)->
        @states[name] = params
        @initialState = name if initialState?

    @image: (filename)-> ASSETS.IMAGES+filename
    @imagePng: (filename)-> Application.image "#{filename}.png"
    @imageJpeg: (filename)-> Application.image "#{filename}.jpg"

    loadImage: (filename, name)->
        name = filename.substr(0, filename.indexOf('.')) if not name?
        @game.load.image(name, Application.image(filename))

    loadPng: (filename, name)->
        filename+='.png'
        @loadImage filename, name

    loadJpeg: (filename, name)->
        filename+='.jpg'
        @loadImage filename, name

    constructor: ->
        @game = new Phaser.Game(GAME.WIDTH, GAME.HEIGHT, Phaser.WEBGL, GAME.GAME_NODE)
        @game.state.add name, state for name, state of Application.states
        @game.state.start Application.initialState
        _dump @game


window.onload = -> new Application()