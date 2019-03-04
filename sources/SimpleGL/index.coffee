import GLWrap from '../Util/GLWrap'
import simpleGL from './simpleGL'

export default GLWrap 'SimpleGLWithPIXI', ({
  gl
  canvas
  height
  width
}) =>

  # gl.endFrameEXP()

  simpleGL {
    gl
    height
    width
  }

  return
