import {
  Application
} from '../Util/newPIXI'
import {
  Triangle
  Polygon
} from '../Util/newPIXI/Geometry'

drawProgram = ({
  gl
  width
  height
}) =>

  app = new Application gl, {
    width
    height
  }

  
  app.init [
      creator: Triangle
      data: [
        width / 2, 60
        width / 2, height / 2
        width - 20, height / 2
      ]
    ,
      creator: Polygon
      data: [
        20, 20
        ( width / 2) - 20, ( height / 2 ) - 20 
        20, ( height / 2 ) - 20
        ( width / 2 ) - 20, 20
      ]
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
