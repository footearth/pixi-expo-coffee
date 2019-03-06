bigger = (a, b) =>
  if a > b then a else b

orderTwo = (p1, p2) =>
  _p1 = bigger p1.x, p1.y
  _p2 = bigger p2.x, p2.y
  if ( bigger _p1, _p2 ) is _p1
  then [ p1, p2 ]
  else [ p2, p1 ]

orderArray = (arr, ot) =>

  [1..( arr.length - 1 )]
  .reduce (r) =>

    return ot r[0], r[1] if r.length is 2

    [1..( r.length - 1 )]
    .reduce (_r, c, i, a) =>

      oa = ot _r[i], _r[c]

      [
        (
          if i > 0
          then _r[0..( i - 1 )]
          else []
        )...
        oa...
        _r[( i + 2 )..]...
      ]

    , r

  , arr

export {
  bigger
  orderTwo
  orderArray
}

encode = (arr) =>

  arr.reduce (r, c, i, a) =>

    return r if ( i is (a.length - 1)) or (
      ( (i + 1) % 2 ) is 0
    )

    [
      r...
      x: c
      y: a[i + 1]
    ]
  , []

decode = (arr) =>

  arr.reduce (r, c) =>
    [
      r...
      c.x
      c.y
    ]
  , []

export {
  encode
  decode
}

equalPoint = (p1, p2) =>
  ( p1.x is p2.x ) and (
    p1.y is p2.y
  )

uniqPoint = (pArr, equal) =>

  pArr.reduce (r, c, i, a) =>
    return [
      r...
      c
    ] if i is ( a.length - 1 )
    [
      r...
      (
        if equal c, a[i + 1]
        then []
        else [ c ]
      )...
    ]
  , []

export {
  equalPoint
  uniqPoint
}

reduceChain = (arr) =>

  lastRs = null

  reduce: (reducer, initData = []) ->
    lastRs = (
      if lastRs
      then lastRs
      else arr
    ).reduce reducer
    , initData
    @
  
  done: =>
    r = lastRs
    lastRs = null
    r

reduceSlice = (r, c, i, a) =>
  return r if r.length is a.length
  [
    r...
    a[a.length - 1 - i]
  ]

reduceFlatten = (r, c) =>
  [
    r...
    (
      if Array.isArray c
      then c
      else []
    )...
  ]

export {
  reduceChain 
  reduceSlice
  reduceFlatten
}

# Copy Conglutination line point
# [ 55, 44, 33, 22, 11 ]
# ==>
# [
#   55, 44, 33
#   44, 33, 22
#   33, 22, 11
# ]
cclp = (pArr) =>

  return if pArr.length < 4

  reduceChain pArr
  .reduce (r, c, i, a) =>
    return r if i > ( a.length - 3 )
    [
      r...
      (
        if i is ( a.length - 3 )
        then [ c, a[i + 1], a[i + 2] ]
        else [ c, 0, 0 ]
      )
    ]
  .reduce reduceSlice
  .reduce (r, c, i, a) =>
    return [
      r...
      c
    ] if i is 0
    [
      r... 
      [
        c[0]
        r[r.length - 1][0]
        r[r.length - 1][1]
      ]
    ]
  .reduce reduceSlice
  .reduce (r, c) =>
    [
      r...
      c...
    ]
  .done()

export {
  cclp
}

arrToPoint = (arr) =>

  reduceChain arr  
  .reduce (r, c, i, a) =>
    return r if ( i is (a.length - 1) ) or (
      ( (i + 1) % 2 ) is 0
    )
    [
      r...
      [ c, a[i + 1] ]
    ]
  .done()

export {
  arrToPoint
}

export default (pointArray) =>

  reduceChain(
    cclp arrToPoint decode uniqPoint(
      orderArray(
        encode pointArray
        orderTwo
      )
      equalPoint
    )
  )
  .reduce reduceFlatten
  .done()
