import {
  Program
  clearn
} from '../Util/WebGL'

# randomInt = (range) => Math.floor(
#   Math.random() * range
# )

# setRectangle = (gl, x, y, width, height) =>
#   x1 = x
#   x2 = x + width
#   y1 = y
#   y2 = y + height
#   gl.bufferData gl.ARRAY_BUFFER
#   ,
#     new Float32Array [
#       x1, y1
#       x2, y1
#       x1, y2
#       x1, y2
#       x2, y1
#       x2, y2
#     ]
#   , gl.STATIC_DRAW

export default (gl) =>

  # clearn gl

  program = new Program gl

  positionsBufferArray = new Float32Array [
    10, 20
    80, 20
    10, 30
    10, 30
    80, 20
    80, 30
  ]

  positionBuffer = gl.createBuffer()
  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer

  gl.bufferData(
    gl.ARRAY_BUFFER
    positionsBufferArray
    gl.STATIC_DRAW
  )

  gl.useProgram program.getInstance()
  gl.enableVertexAttribArray(
    program.getLocation().attribute.position
  )

  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer

  size = 2
  type = gl.FLOAT
  normalize = false
  stride = 0
  offset = 0
  gl.vertexAttribPointer(
    positionAttributeLocation
    size, type
    normalize
    stride, offset
  )

  gl.uniform2f(
    resolutionUniformLocation
    gl.canvas.width
    gl.canvas.height
  )

  primitiveType = gl.TRIANGLES
  offset = 0
  count = 6
  gl.drawArrays(
    primitiveType
    offset
    count
  )
