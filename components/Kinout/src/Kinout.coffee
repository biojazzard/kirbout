###
 * Description or Responsability
 *
 * @namespace KINOUT
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT =
    slides: 0
    index:
        horizontal: 0
        vertical: 0

    init: (config = {}) ->
        @Element.init config
        @Events.init()
        @Url.read()
        return


window.KINOUT = KINOUT