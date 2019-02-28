# https://github.com/expo/expo/blob/master/apps/native-component-list/screens/GL/GLScreens.js
import GLWrap from '../Util/GLWrap'

import * as PIXI from 'pixi.js'

import { Dimensions } from 'react-native'

import simpleGl from '../SimpleGL/simpleGL'

export default GLWrap 'SimplePIXI', ({
  gl
  canvas
  height
  width
}) =>

  # await =>
  global.gl = gl unless global.gl?

  {
    scale: resolution
  } = Dimensions.get 'window'

  width = gl.drawingBufferWidth / resolution
  height = gl.drawingBufferHeight / resolution

  try

    # app = await ( =>
    app =
      new PIXI.Application {
      # new Application {
        context: gl
        width
        height
        resolution
        backgroundColor: 0xffffff
      }
    # )()

    # app.ticker.add =>
    #   gl.endFrameEXP()

    # graphics = new PIXI.Graphics()

    # graphics.moveTo 0, 0
    # graphics.lineStyle 1
    # graphics.lineTo -10, 0

    # graphics.lineStyle 0
    # graphics.beginFill 0x00ff00
    # graphics.drawCircle(
    #   width / 2
    #   height / 2
    #   50
    # )
    # graphics.endFill()

    app.stage.addChild graphics

  catch e
    # console.warn e.stack
    console.warn e

  # simpleGl gl

  

  app
