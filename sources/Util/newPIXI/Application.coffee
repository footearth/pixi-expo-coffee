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
    @count = 0

    @

  Application::init = (createPolygon, arrayData) ->

    polygonArr = createPolygon arrayData

    createBuffer @gl
    , new Float32Array polygonArr

    @count = polygonArr.length / 2

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
    count = @count

    @gl.drawArrays primitiveType, offset, count

    @

  Application

export default do ApplicationCreator
