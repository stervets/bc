class @Application
    @State: ()->
        @state
    constructor: ->
        console.log @

window.onload = -> new Application()