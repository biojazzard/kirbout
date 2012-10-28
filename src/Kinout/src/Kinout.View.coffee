###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class View
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.View = ((knt, $$, undefined_) ->

    SELECTOR = knt.Constants.SELECTOR
    STYLE = knt.Constants.STYLE

    _index = knt.index
    _steps = []

    slide = (horizontal, vertical, next_step = true) ->
        unless knt.Element.steps(next_step)
            _saveNewIndexes horizontal, vertical
            _updateSlideIndexes()
            _renderKeyboard horizontal, vertical
            knt.Url.write _index.horizontal, _index.vertical
        return

    _renderKeyboard = (horizontal, vertical) ->

        BTN = SELECTOR.KEYBOARD
        nSlides = knt.Element.slides().length;
        nSubSlides = knt.Element.subslides(horizontal).length

        if horizontal > 0 && horizontal < (nSlides - 1)
            $$(BTN.left).removeClass('enabled').addClass('enabled')
            $$(BTN.right).removeClass('enabled').addClass('enabled')
        else if horizontal <= 0
            $$(BTN.left).removeClass('enabled')
            $$(BTN.right).removeClass('enabled').addClass('enabled')
        else if  horizontal >= (nSlides - 1)
            $$(BTN.left).removeClass('enabled').addClass('enabled')
            $$(BTN.right).removeClass('enabled')
        
        if !isNaN(nSubSlides) && nSubSlides > 1
            if vertical > 0 && vertical < (nSubSlides - 1)
                $$(BTN.up).removeClass('enabled').addClass('enabled')
                $$(BTN.down).removeClass('enabled').addClass('enabled')
            else if vertical <= 0
                $$(BTN.up).removeClass('enabled')
                $$(BTN.down).removeClass('enabled').addClass('enabled')
            else if vertical >= (nSubSlides - 1)
                $$(BTN.up).removeClass('enabled').addClass('enabled')
                $$(BTN.down).removeClass('enabled')
        else
            $$(BTN.up).removeClass('enabled')
            $$(BTN.down).removeClass('enabled')

        # console.log('horizontal:' + horizontal + '|' + (nSlides-1) + ' || vertical:' + vertical + '|' + (nSubSlides-1))
        return

    index = ->
        'horizontal': _index.horizontal
        'vertical': _index.vertical

    _saveNewIndexes = (horizontal, vertical) ->
        _index.horizontal = (if horizontal is `undefined` then _index.horizontal else horizontal)
        _index.vertical = (if vertical is `undefined` then _index.vertical else vertical)
        return

    _updateSlideIndexes = ->
        _index.horizontal = _updateSlides(SELECTOR.SLIDE, _index.horizontal)
        _index.vertical = _updateSlides(SELECTOR.SUBSLIDE, _index.vertical)
        _updateProgress()
        return

    _updateProgress = ->
        slides = knt.Element.slides();

        # Horizontal
        horizontal = parseInt( (_index.horizontal * 100) / (slides.length - 1))
        window.requestAnimationFrame -> knt.Element.progress("horizontal", horizontal)

        # Vertical
        vertical = 0
        subslides = knt.Element.subslides(_index.horizontal)
        if subslides.length > 1
            vertical = parseInt( ((_index.vertical + 1) * 100) / subslides.length)
        window.requestAnimationFrame -> knt.Element.progress("vertical", vertical)

    _updateSlides = (selector, index) ->
        slides = Array::slice.call(document.querySelectorAll(selector))
        if slides.length
            index = Math.max(Math.min(index, slides.length - 1), 0)
            #window.requestAnimationFrame -> render(slides, index)
            render slides, index
        else
            index = 0
        index

    render = (slides, index) ->
        slides[index].setAttribute "class", STYLE.PRESENT
        slides.slice(0, index).map (element) ->
            element.setAttribute "class", STYLE.PAST
        slides.slice(index + 1).map (element) ->
            element.setAttribute "class", STYLE.FUTURE

    slide: slide
    index: index
    render: render

)(KINOUT, Quo)