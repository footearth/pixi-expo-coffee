import {
  createProgram
} from './createProgram'

ProgramCreator = =>

  Program = (
    gl
    {
      position = 'a_position'
      resolution = 'u_resolution'
      # color = 'u_color'
    } = {}
  ) ->

    program = createProgram gl

    @program = program
    @gl = gl
    @location =
      attribute:
        position:
          gl.getAttribLocation program
          , position
      uniform:
        resolution:
          gl.getUniformLocation program
          , resolution
        # color:
        #   gl.getUniformLocation program
        #   , color

    @

  Program::getLocation = -> @location
  Program::getInstance = -> @program

  Program::start = (gl = @gl) ->
    gl.useProgram @program
    @

  Program

export default do ProgramCreator
