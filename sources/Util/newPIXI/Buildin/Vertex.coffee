export default (gl, attributePosition) =>

  gl.enableVertexAttribArray attributePosition

  size = 2
  type = gl.FLOAT
  normalize = false
  stride = 0
  offset = 0

  gl.vertexAttribPointer(
    attributePosition
    size, type, normalize
    stride, offset
  )
