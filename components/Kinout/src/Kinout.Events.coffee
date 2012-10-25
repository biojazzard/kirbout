###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class Events
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.Events = ((knt, $$, undefined_) ->

    EVENTS =
        KEYDOWN: "keydown"
        CLICK: "click"
        TOUCH: "touchstart"
        HASHCHANGE: "hashchange"
        MOUSEWHEEL: "mousewheel"

    DIRECTION =
        LEFT: "left"
        RIGHT: "right"
        UP: "up"
        DOWN: "down"

    init = ->
        _subscribeEvents()
        return

    _subscribeEvents = ->
        if $$.isMobile()
            $$(document).on EVENTS.TOUCH, _onTouch, false
        else
            $$(document).on EVENTS.KEYDOWN, _onKeyDown, false
            $$(document).on EVENTS.CLICK, _onClick, false
            $$(document).on EVENTS.MOUSEWHEEL, _onWheel, false

        #$$(window).on EVENTS.HASHCHANGE, _onHashChange, false
        return

    _onKeyDown = (event) ->
        if event.keyCode >= 37 and event.keyCode <= 40
            _analizeKeyEvent event
            event.preventDefault()
        return

    _onTouch = (event) ->
        if event.touches.length is 1
            event.preventDefault()
            point =
                x: event.touches[0].clientX
                y: event.touches[0].clientY

            _analizePoint point
        return

    _onClick = (event) ->
        if $$(event.target).closest('a').length
            return;
        event.preventDefault()
        point =
            x: event.clientX
            y: event.clientY

        _analizePoint point
        return

    _onWheel = (event) ->
        return

    _onHashChange = -> knt.Url.read()

    _analizeKeyEvent = (event) ->
        switch event.keyCode
            when 37
                knt.Router.direction DIRECTION.LEFT
            when 39
                knt.Router.direction DIRECTION.RIGHT
            when 38
                knt.Router.direction DIRECTION.UP
            when 40
                knt.Router.direction DIRECTION.DOWN
        return

    _analizePoint = (point) ->
        window_width = window.innerWidth * 0.3
        window_height = window.innerHeight * 0.3
        if point.x < window_width
            knt.Router.direction DIRECTION.LEFT
        else if point.x > window.innerWidth - window_width
            knt.Router.direction DIRECTION.RIGHT
        else if point.y < window_height
            knt.Router.direction DIRECTION.UP
        else knt.Router.direction DIRECTION.DOWN if point.y > window.innerHeight - window_height
        return

    init: init

)(KINOUT, Quo)