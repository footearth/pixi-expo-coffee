import React from 'react'
# import '@expo/browser-polyfill'

# import cfxify from 'cfx.react.dom'
# CFX = {
#   GLView
# }

import { View as GLView } from 'expo-graphics'
# import { GLView } from 'expo-gl'

# import Application from './PIXI'
# import * as PIXI from 'pixi.js'
# { Application } = PIXI

import simpleGL from './simpleGL'

export default class ExpoIsAwesome extends React.Component

  onContextCreate: ({
    gl
    canvas
    height
    width
  }) =>

    # console.log global.PIXI.VRSION
    # console.log global.clientWidth
    # console.log global.clientHeight

    # webglUtils.resizeCanvasToDisplaySize gl.canvas
    # gl.canvas = canvas

    # gl.viewport 0, 0
    # , global.clientWidth
    # , global.clientHeight

    # , gl.canvas.width
    # , gl.canvas.height

    simpleGL gl 

    return

  onRender: (delta) =>
    # console.log 'delta: ', delta
    return

  render: ->

    <GLView
      style={{ flex: 1 }}
      onContextCreate={this.onContextCreate}
      onRender={this.onRender}
    />
