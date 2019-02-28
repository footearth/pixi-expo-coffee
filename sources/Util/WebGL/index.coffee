import {
  createProgram
} from './Util'

Program = do =>

  program = (
    gl
    {
      position = 'a_position'
      resolution = 'u_resolution'
      # color = 'u_color'
    } = {}
  ) ->

    _program = createProgram gl

    @program = _program
    @gl = gl
    @location =
      attribute:
        position:
          gl.getAttribLocation _program
          , position
      uniform:
        resolution:
          gl.getUniformLocation _program
          , resolution
        # color:
        #   gl.getUniformLocation _program
        #   , color

    @

  program::getLocation = -> @location
  program::getInstance = -> @program

  program::start = (gl = @gl) ->
    gl.useProgram @program
    gl.enableVertexAttribArray(
      @location.attribute.position
    )
    @

  program

clearScreen = (gl) =>
  gl.clearColor 0, 0, 0, 0
  gl.clear gl.COLOR_BUFFER_BIT

export {
  Program
  clearScreen
}
