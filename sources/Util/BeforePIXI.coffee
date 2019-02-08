# https://github.com/expo/expo/blob/master/apps/native-component-list/screens/GL/BeforePIXI.native.js

import '@expo/browser-polyfill'
import { Image, Dimensions } from 'react-native'

class DOMNode
  constructor: (nodeName) ->
    @nodeName = nodeName
    @

  # get
  ownerDocument: => window.document

  appendChild: (element) => # unimplemented

class DOMElement extends DOMNode
  constructor: (tagName) ->
    super tagName.toUpperCase()
    @style = {}
    # @emitter = new EventEmitter()
    @

  # get
  tagName: -> @nodeName
  insertBefore: => {}

  getContext: (contextType) =>
    # if global.canvasContext
    #   return global.canvasContext
    fillRect: => {}
    drawImage: => {}
    getImageData: => {}
    getContextAttributes: =>
      stencil: true
    getExtension: =>
      loseContext: => {}

  addEventListener: (eventName, listener) ->
    # @emitter.addListener eventName, listener

  removeEventListener: (eventName, listener) ->
    # @emitter.removeListener eventName, listener

  # get
  clientWidth: -> @innerWidth
  # get
  clientHeight: -> @innerHeight
  # get
  innerWidth: -> window.innerWidth
  # get
  innerHeight: -> window.innerHeight

class DOMDocument extends DOMElement

  constructor: ->
    super '#document'
    @body = new DOMElement 'BODY'
    @

  createElement: (tagName) => new DOMElement tagName

  createElementNS: (tagName) ->
    canvas = this.createElement tagName
    canvas.getContext = => 
      fillRect: => {}
      drawImage: => {}
      getImageData: => {}
      getContextAttributes: =>
        stencil: true
      getExtension: =>
        loseContext: => {}
    canvas.toDataURL = => {}

    canvas

  getElementById: (id) => new DOMElement 'div'

process.browser = true

# new EventEmitter()
window.emitter = window.emitter or {}

window.addEventListener = window.addEventListener or (
  (eventName, listener) => {}
)
window.removeEventListener = window.removeEventListener or 
(
  (eventName, listener) => {}
)

window.document = new DOMDocument()
window.document.body = new DOMElement 'body'

# <- Not sure about this... or anything for that matter ¯\_(ツ)_/¯
window.location = 'data:'
# <- This could be made better, but I'm not sure if it'll matter for PIXI
global.userAgent = global.navigator.userAgent = 'iPhone'

class HTMLImageElement
  constructor: (props) ->
    @align = 'center'
    @alt = null
    @border = null
    @complete = true
    @crossOrigin = ''
    @localUri = @lowSrc =
    @currentSrc = @src = props.localUri
    @width = props.width
    @height = props.height
    @isMap = true
    @

global.HTMLImageElement = global.Image = HTMLImageElement
global.performance = null
