@Application.State 'Boot',
    v: 111
    preload: ()->
        _dump @
        @loadPng 'progressBar'

    create: ()->
        console.log 111

    , true