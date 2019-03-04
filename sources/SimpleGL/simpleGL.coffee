import {
  Application
} from '../Util/newPIXI'

drawProgram = ({
  gl
  width
  height
}) =>

  app = new Application gl, {
    width
    height
  }

  app.init new Float32Array [
    width / 2, 60
    width / 2, height / 2
    width - 20, height / 2
  ]

  app.draw()

  return

export default ({
  gl
  width
  height
}) =>

  try
    drawProgram {
      gl
      width
      height
    }
  catch e
    console.log e

  return
