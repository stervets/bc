_ = require 'underscore'

handlers =
    test: (req, res)->
        res.send 'DONE'

@setAPI = (app)->
    app.get('/'+query, handler) for query, handler of handlers