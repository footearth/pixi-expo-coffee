import GLWrap from '../Util/GLWrap'
import simpleThree from './simpleThree'

export default GLWrap 'SimpleGLWithPIXI', ({
  gl
  canvas
  height
  width
}) =>

  # gl.endFrameEXP()

  simpleThree {
    gl
    height
    width
  }
