class @Application
    @Controller: {}
    @states: {}
    @initialState: null

    @State: (name, params, initialState)->
        params.create = ((create)->
          ()->
            @game.$ = @
            create.apply @
        )(params.create || ()->)
        @states[name] = params
        @initialState = name if initialState?

    @image: (filename)-> ASSETS.IMAGES+filename

    @getNameFromFilename: (filename, name)->
        name = filename.substr(0, filename.indexOf('.')) if not name?
        name

    loadImage: (filename, name)->
        @game.load.image Application.getNameFromFilename(filename, name),
                         Application.image(filename)

    loadSpriteSheet: (filename, width, height, name)->
        @game.load.spritesheet Application.getNameFromFilename(filename, name),
                                Application.image(filename), width, height

    vars:
        topScore: 0

    constructor: ->
        @game = new Phaser.Game(GAME.WIDTH, GAME.HEIGHT, Phaser.WEBGL, GAME.GAME_NODE)

        for name, state of Application.states
            state = @game.state.add name, state
            state.app = @
            state.vars = @vars

        @game.state.start Application.initialState

window.onload = -> new Application()