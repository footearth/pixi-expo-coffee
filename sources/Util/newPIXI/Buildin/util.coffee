clearScreen = (gl) =>

  gl.clearColor 0, 0, 0, 0
  gl.clear gl.COLOR_BUFFER_BIT

  return

resizeToDisplaySize = (gl, resolution, width, height) =>

  gl.uniform2f(
    resolution
    width
    height
  )

  # gl.viewport(
  #   0, 0
  #   2 * width, 2 * height
  # )
  
  return

setColor = (gl, colorUniform, colorArr) =>

  gl.uniform4f.apply gl
  , [
    colorUniform
    colorArr...
    1
  ]

  return

export {
  clearScreen
  resizeToDisplaySize
  setColor
}
