class @Application
	@state: {}
	@State: (name, params)-> @state[name] = params

	game: null

	constructor: ->
		@game = new Phaser.Game(@GAME.WIDTH, @GAME.HEIGHT, Phaser.WEBGL, @GAME.GAME_NODE)


window.onload = -> new Application()