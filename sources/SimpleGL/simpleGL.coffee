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

  # creator: Triangle
  # data: [
  #   width / 2, 60
  #   width / 2, height / 2
  #   width - 20, height / 2
  # ]
  # color: [
  #   Math.random()
  #   Math.random()
  #   Math.random()
  # ]
  
  app.init(
    [1..50].reduce (r, c) =>
      [
        r...
        creator: Polygon
        data: [1..10].reduce (_r) =>
          [
            _r...
            Math.random() * width
            Math.random() * height
          ]
        , []
        color: [
          Math.random()
          Math.random()
          Math.random()
        ]
      ]
    , []
  )

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
