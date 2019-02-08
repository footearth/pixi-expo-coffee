createProgram = (gl, vertexShader, fragmentShader) =>
  program = gl.createProgram()

  gl.attachShader program, vertexShader
  gl.attachShader program, fragmentShader

  gl.linkProgram program
  success = gl.getProgramParameter program, gl.LINK_STATUS
  return program if success

  console.log gl.getProgramInfoLog program
  gl.deleteProgram program

  return

createShader = (gl, type, source) =>
  shader = gl.createShader type
  gl.shaderSource shader, source
  gl.compileShader shader
  success = gl.getShaderParameter shader, gl.COMPILE_STATUS
  return shader if success

  console.log gl.getShaderInfoLog shader
  gl.deleteShader shader

  return

drawProgram = (gl, vSrc, fSrc) =>

  vertexShaderSource = vSrc
  fragmentShaderSource = fSrc

  vertexShader = createShader gl, gl.VERTEX_SHADER, vertexShaderSource
  fragmentShader = createShader gl, gl.FRAGMENT_SHADER, fragmentShaderSource

  # Link the two shaders into a program
  program = createProgram gl, vertexShader, fragmentShader

  # look up where the vertex data needs to go.
  positionAttributeLocation = gl.getAttribLocation program, 'a_position'

  # Create a buffer and put three 2d clip space points in it
  positionBuffer = gl.createBuffer()

  # Bind it to ARRAY_BUFFER (think of it as ARRAY_BUFFER = positionBuffer)
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

  gl.clearColor 0, 0, 0, 0
  gl.clear gl.COLOR_BUFFER_BIT

  gl.useProgram program
  gl.enableVertexAttribArray positionAttributeLocation

  gl.bindBuffer gl.ARRAY_BUFFER, positionBuffer

  size = 2
  type = gl.FLOAT
  normalize = false
  stride = 0
  offset = 0

  gl.vertexAttribPointer(
    positionAttributeLocation
    size, type, normalize
    stride, offset
  )

  primitiveType = gl.TRIANGLES
  offset = 0
  count = 3
  gl.drawArrays primitiveType, offset, count

  return

export default (gl) =>

  drawProgram gl
  ,
    """
    // 一个属性变量，将会从缓冲中获取数据
    attribute vec4 a_position;

    // 所有着色器都有一个main方法
    void main() {

      // gl_Position 是一个顶点着色器主要设置的变量
      gl_Position = a_position;
    }
    """
  ,
    """
    // 片断着色器没有默认精度，所以我们需要设置一个精度
    // mediump是一个不错的默认值，代表“medium precision”（中等精度）
    precision mediump float;

    void main() {
      // gl_FragColor是一个片断着色器主要设置的变量
      gl_FragColor = vec4(1, 0, 0.5, 1); // 返回“瑞迪施紫色”
    }
    """

  return
