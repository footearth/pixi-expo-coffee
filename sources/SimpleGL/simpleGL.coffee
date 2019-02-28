import {
  Program
  clearScreen
} from '../Util/WebGL'

drawProgram = (gl) =>

  clearScreen gl

  program = new Program gl

  program.start gl

  positionBuffer = gl.createBuffer()
  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer

  positions = [
    0, 0
    0, 0.5
    0.7, 0
  ]

  gl.bufferData(
    gl.ARRAY_BUFFER
    new Float32Array positions
    gl.STATIC_DRAW
  )

  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer

  size = 2
  type = gl.FLOAT
  normalize = false
  stride = 0
  offset = 0

  gl.vertexAttribPointer(
    program.getLocation().attribute.position
    size, type, normalize
    stride, offset
  )

  primitiveType = gl.TRIANGLES
  offset = 0
  count = 3
  gl.drawArrays primitiveType, offset, count

  return

export default (gl) =>

  try
    drawProgram gl
  catch e
    console.log e

  return
