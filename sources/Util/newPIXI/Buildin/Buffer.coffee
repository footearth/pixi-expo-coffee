export default (gl, positionsBuffer) =>

  positionBuffer = gl.createBuffer()

  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer 

  gl.bufferData(
    gl.ARRAY_BUFFER
    positionsBuffer
    gl.STATIC_DRAW
  )

  return
