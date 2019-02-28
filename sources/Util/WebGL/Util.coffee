import {
  Vertex
  Fragment
} from './shaderSource'

loadShader = (gl, shaderType, shaderSource) =>

  shader = gl.createShader shaderType

  gl.shaderSource shader, shaderSource
  gl.compileShader shader
  compiled = gl.getShaderParameter shader, gl.COMPILE_STATUS

  unless compiled?
    gl.deleteShader shader
    console.warn 'Error when Shader loading.'
    throw new Error 'Error when Shader loading.'

  shader

createShaderFromSource = (
  gl
  shaderType
  shaderSource
) =>
  type = switch shaderType.toLowerCase()
    when 'vertex'
    then gl.VERTEX_SHADER
    when 'fragment'
    then gl.FRAGMENT_SHADER
    else gl.VERTEX_SHADER
  loadShader gl, type, shaderSource

createShaders = (gl) =>
  [
    { Vertex }
    { Fragment }
  ].reduce (r, c) =>
    type = ( Object.keys c)[0] 
    source = c[type]
    [
      r...
      createShaderFromSource gl
      , type, source
    ]
  , []

createProgram = (gl) =>

  program = gl.createProgram()

  shaders = createShaders gl
  shaders.forEach (shader) =>
    gl.attachShader program, shader

  gl.linkProgram program
  linked = gl.getProgramParameter program, gl.LINK_STATUS

  unless linked?
    gl.deleteProgram program
    console.warn 'Error when Program creating.'
    throw new Error 'Error when Program creating.'

  program

export {
  createProgram
}
