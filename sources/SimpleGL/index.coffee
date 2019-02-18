import GLWrap from '../Util/GLWrap'
import simpleGL from './simpleGL'

export default GLWrap 'SimpleGLWithPIXI', ({
  gl
  canvas
  height
  width
}) =>

  # gl.clearColor 0, 0, 1, 1
  # gl.clear gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT
  # gl.endFrameEXP()

  simpleGL gl

  return
