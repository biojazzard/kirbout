###
 * 
 * http://paulirish.com/2011/requestanimationframe-for-smart-animating/
 * http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

 * requestAnimationFrame polyfill by Erik Möller
 * fixes from Paul Irish and Tino Zijdel
 *
 * @refactoring to CofeeScript by Alfredo Llanos <alfredo@tallerdelsoho.es> || @biojazzard
###

(() =>

    lastTime = 0

    vendors = ['ms', 'moz', 'webkit', 'o'];

    @raf = (_v) =>
       window.requestAnimationFrame = window[ _v + 'RequestAnimationFrame']
       window.cancelAnimationFrame = window[ _v + 'cancelAnimationFrame'] || window[ _v + 'cancelAnimationFrame']
        
    @raf vendor for vendor in vendors        

    if !window.requestAnimationFrame
        window.requestAnimationFrame = (callback, element) =>
            currTime = Date()
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