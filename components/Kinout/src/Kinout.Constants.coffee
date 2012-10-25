###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class Boot
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.Constants =

    MARKUP:
        GLOW: "<div class='glow'></div>"
        COPYRIGHT: "<div class='copyright'><a href='http://kinout.tapquo.com/'>kinout</a>by tapquo</div>"
        PROGRESS:
            horizontal: "<div class='progress horizontal' value='0' max='100'><span></span></div>"
            vertical: "<div class='progress vertical' value='0' max='100'><span></span></div>"

    SELECTOR:
        KINOUT: ".kinout"
        SLIDE: ".kinout>section"
        SUBSLIDE: ".kinout>section.present>article"

        STEP: "section.present > article.present [data-step]"
        STEP_TO_SHOW: ":not([data-run='success'])"
        STEP_TO_HIDE: "[data-run='success']"

        PROGRESS:
            horizontal: ".progress.horizontal"
            vertical: ".progress.vertical"

    STYLE:
        PAST: "past"
        PRESENT: "present"
        FUTURE: "future"