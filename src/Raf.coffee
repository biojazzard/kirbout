###
 * Description or Responsability
 *
 * @namespace KINOUT
 *
 * @author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

(() =>

    lastTime = 0

    vendors = ['ms', 'moz', 'webkit', 'o'];

    raf (_vendor) =>
       window.requestAnimationFrame = window[_vendor+'RequestAnimationFrame']
       window.cancelAnimationFrame = window[_vendor+'cancelAnimationFrame'] || window[_vendor+'cancelAnimationFrame']
        
    raf vendor for vendor in vendors        

    if !window.requestAnimationFrame
        window.requestAnimationFrame = (callback, element) =>
            window.vendors['RequestAnimationFrame']
            currTime = Date().getTime()
            timeToCall = Math.max(0, 16 - (currTime - lastTime))
            id = window.setTimeout () =>
                callback currTime + timeToCall
                return
            , timeToCall
            lastTime = currTime + timeToCall;
            id

    if !window.cancelAnimationFrame
        window.cancelAnimationFrame = (id) =>
            clearTimeout id
            return

)()