@Application.State 'Boot',
    preload: ()->
		game.load.image 'progressBar', 'assets/progressBar.png'

		#900 x 650
    create: ()->