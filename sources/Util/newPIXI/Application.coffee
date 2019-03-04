import Program from './Buildin/Program'
import {
  clearScreen
  resizeToDisplaySize
} from './Buildin/util'
import createBuffer from './Buildin/Buffer'
import createVertex from './Buildin/Vertex'

ApplicationCreator = =>

  Application = (gl, {
    width
    height
  }) ->

    @program = new Program gl
    @gl = gl
    @width = width
    @height = height

    @

  Application::init = (arrayData) ->

    createBuffer @gl, arrayData

    @program.start()

    clearScreen @gl

    resizeToDisplaySize @gl
    , @program.getLocation().uniform.resolution
    , @width
    , @height

    createVertex @gl
    , @program.getLocation().attribute.position

    @

  Application::draw = ->

    primitiveType = @gl.TRIANGLES
    offset = 0
    count = 3

    @gl.drawArrays primitiveType, offset, count

    @

  Application

export default do ApplicationCreator
