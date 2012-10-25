###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class Element
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.Element = ((knt, undefined_) ->

    SELECTOR = knt.Constants.SELECTOR
    MARKUP = knt.Constants.MARKUP

    _el =
        parent: undefined
        slides: []
        steps: []
        progress:
            horizontal: undefined
            vertical: undefined

    init = (config) ->
        _el.parent = $$(SELECTOR.KINOUT)
        _el.parent.addClass(config.template) if config.template
        _el.parent.prepend(MARKUP.GLOW).append(MARKUP.COPYRIGHT)

    slides = () ->
        unless _el.slides.length > 0
            _el.slides = _el.parent.children('section')
        _el.slides

    subslides = (slide_index) -> $$(_el.slides[slide_index]).children('article')

    steps = (next) -> if (next) then _nextStep() else _previousStep()

    progress = (type = "horizontal", value = 0) ->
        unless _el.progress[type]
            _el.parent.append(MARKUP.PROGRESS[type])
            _el.progress[type] = _el.parent.children(SELECTOR.PROGRESS[type]).children('span')

        property = if type is "horizontal" then "width" else "height"
        _el.progress[type].style property, "#{value}%"
        return

    _nextStep = () ->
        available = false

        _steps = $$(SELECTOR.STEP + SELECTOR.STEP_TO_SHOW)
        for element in _steps
            step = $$(element)
            unless step.data("run") is "success"
                step.data("run", "success")
                available = true
                break
        available

    _previousStep = () ->
        available = false

        _steps = $$(SELECTOR.STEP + SELECTOR.STEP_TO_HIDE)
        i = _steps.length
        while i > 0
            step = $$(_steps[i-1])
            if step.data("run") is "success"
                step.data("run", "")
                available = true
                break
            i--
        available

    init: init
    slides: slides
    subslides: subslides
    steps: steps
    progress: progress

)(KINOUT)