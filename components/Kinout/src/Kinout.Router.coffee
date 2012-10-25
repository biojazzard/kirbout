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
        return

    _right = ->
        _index.horizontal++
        knt.View.slide _index.horizontal, 0
        return

    _up = ->
        _index.vertical--
        knt.View.slide _index.horizontal, _index.vertical, false
        return

    _down = ->
        _index.vertical++
        knt.View.slide _index.horizontal, _index.vertical
        return

    direction: direction

)(KINOUT)