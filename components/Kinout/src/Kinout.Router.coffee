###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class Router
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.Router = ((knt, undefined_) ->

    _index = {}

    direction = (direction) ->
        _index = knt.View.index()
        switch direction
            when "left"
                _left()
            when "right"
                _right()
            when "up"
                _up()
            when "down"
                _down()

    _left = ->
        _index.horizontal--
        knt.View.slide _index.horizontal, 0, false
        console.log(_index.horizontal)
        console.log(_index.vertical)
        return

    _right = ->
        _index.horizontal++
        knt.View.slide _index.horizontal, 0
        console.log(_index.horizontal)
        console.log(_index.vertical)
        return

    _up = ->
        _index.vertical--
        knt.View.slide _index.horizontal, _index.vertical, false
        console.log(_index.horizontal)
        console.log(_index.vertical)
        return

    _down = ->
        _index.vertical++
        knt.View.slide _index.horizontal, _index.vertical
        console.log(_index.horizontal)
        console.log(_index.vertical)
        return

    direction: direction

)(KINOUT)