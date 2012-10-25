###
 * Description or Responsability
 *
 * @namespace KINOUT
 * @class Url
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

KINOUT.Url = ((knt, undefined_) ->

    ###
        Read the page URL (hash) to get the current
        navigational slide.
    ###
    read = ->
        bits = window.location.hash.slice(2).split("/")
        indexh = (if bits[0] then parseInt(bits[0]) else 0)
        indexv = (if bits[1] then parseInt(bits[1]) else 0)
        knt.View.slide indexh, indexv
        return

    ###
        Updates the page URL (hash) to reflect the current
        navigational slide.
    ###
    write = (horizontal_idx, vertical_idx) ->
        url = "/"
        url += horizontal_idx if horizontal_idx > 0 or vertical_idx > 0
        url += "/" + vertical_idx if vertical_idx > 0
        window.location.hash = url
        return

    read: read
    write: write

)(KINOUT)