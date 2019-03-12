THREE = require 'three'

class Renderer extends THREE.WebGLRenderer

  constructor: ({
    gl
    canvas
    pixelRatio
    clearColor
    width
    height
    props...
  }) ->

    super {
      canvas: canvas or {
        width: gl.drawingBufferWidth
        height: gl.drawingBufferHeight
        style: {}
        addEventListener: () => {}
        removeEventListener: () => {}
        clientHeight: gl.drawingBufferHeight
      }
      context: gl
      props...
    }

    @setPixelRatio pixelRatio or 1

    if width and height
      @setSize width, height
    if clearColor
      @setClearColor clearColor
    @

export {
  Renderer
}
export default THREE
