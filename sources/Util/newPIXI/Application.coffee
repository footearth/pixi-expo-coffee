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

    @buffers = []

    @

  Application::init = (polygonCreators) ->

    self = @

    polygonCreators.reduce (self, pCreator) =>

      polygonArr = pCreator.creator(
        pCreator.data
      )

      self.buffers = [
        self.buffers...
        polygon: new Float32Array polygonArr
        count: polygonArr.length / 2
      ]

      self
    , self

    clearScreen @gl

    @program.start()

    resizeToDisplaySize @gl
    , @program.getLocation().uniform.resolution
    , @width
    , @height

    self

  Application::draw = ->

    self = @

    self.buffers.reduce (self, {polygon, count}) =>

      {
        gl
        buffers
        program
      } = self

      createBuffer gl, polygon

      createVertex gl
      , program.getLocation().attribute.position

      primitiveType = gl.TRIANGLES
      offset = 0

      gl.drawArrays primitiveType
      , offset, count

      self
    , self

    self

  Application

export default do ApplicationCreator
