import '@expo/browser-polyfill'

import * as PixiInstance from 'pixi.js'

global.PIXI = global.PIXI or PixiInstance
PIXI = global.PIXI

class ExpoPIXIApplication extends PIXI.Application

  constructor: ({
    width
    height
    scale
    backgroundColor
    context
    props...
  }) ->

    # Shim stencil buffer attribute
    getAttributes = context.getContextAttributes or (
      => {}
    )
    context.getContextAttributes = =>
      contextAttributes = getAttributes()
      {
        contextAttributes...
        stencil: true
      }

    resolution = scale or 1 # PixelRatio.get();

    super {
      context
      resolution
      width: width or (
        context.drawingBufferWidth / resolution
      )
      height: height or (
        context.drawingBufferHeight / resolution
      )
      backgroundColor
      props...
    }

    @ticker.add => context.endFrameEXP()

export default ExpoPIXIApplication
