import dd from 'ddeyes'
import createPolygon, {
  bigger
  orderArray
  orderTwo as ot
  encode
  decode
  equalPoint
  uniqPoint
  reduceChain
  cclp
  arrToPoint
} from '../sources/Util/newPIXI/Geometry/Polygon'

orderTwo =  (a, b) =>
  if ( bigger a, b ) is a
  then [ a, b ]
  else [ b, a ]

dd bigger 5, 2
dd orderTwo 2, 5

dd orderArray [
  1, 2, 3, 4, 5
], (a, b) =>
  orderTwo a, b

ec = encode [
  10, 20
  20, 35
  40, 60
]

dd ec

nec = orderArray ec
, ot

dd nec

dd decode nec

dd uniqPoint [
  1, 2, 2, 3
], (a, b) => a is b

dd uniqPoint(
  nec
  equalPoint
)

dd uniqPoint(
  orderArray(
    encode [
      55, 44
      33, 22
      33, 22
      44, 65
      44, 55
      88, 54
    ]
    ot
  )
  equalPoint
)


dd (
  (
    reduceChain [ 1, 2, 3]
  )
  .reduce (r, c, i, a) =>
    [
      r...
      c + 1
    ]
  , []
  .done()
)

dd cclp [
  55, 44, 33, 22, 11
]

dd arrToPoint [
  10, 20
  20, 30
  30, 40
  40, 55
]

dd createPolygon [
  10, 20
  20, 30
  30, 40
  40, 55
]
