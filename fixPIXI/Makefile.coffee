import { join } from 'path'
import {
  readFileSync
  writeFileSync
} from 'fs'
import dd from 'ddeyes'

fixPIXIFile = join __dirname
, '../node_modules/@pixi/core/lib/core.js'

coreJS = readFileSync fixPIXIFile, 'UTF-8'

importToCoreJS = 'if (global.gl) { return global.gl };'

newCoreJS =
  coreJS.split '\n'
  .reduce (r, c) =>
    [
      r...
      (
        if ( c.trim() is 'if (!context)' ) and (
          r[r.length - 1].trim() isnt importToCoreJS
        )
        then(
          [
            "    #{importToCoreJS}"
            c
          ]
        )
        else [ c ]
      )...
    ]
  , []
  .join '\n'

writeFileSync fixPIXIFile, newCoreJS, 'UTF-8'
