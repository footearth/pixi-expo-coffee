# https://github.com/expo/expo/blob/master/apps/native-component-list/screens/GL/GLWrap.js
import './BeforePIXI'
import React from 'react'

# import { GLView } from 'expo'
# import { GLView } from 'expo-gl'
import { View as GLView } from 'expo-graphics'

import { View } from 'react-native'

# import { Colors } from '../../constants'

export default (title, onContextCreate, onRender) =>

  class extends React.Component

    @title = title

    componentWillUnmount: ->
      @_gl = null
      cancelAnimationFrame @_rafID
      @

    _onContextCreate: ({
      gl
      canvas
      height
      width
    }) ->
      @_gl = gl
      {
        result: {
          onTick = => {}
        } = {}
      } =
        result: await onContextCreate {
          gl: @_gl
          canvas
          height
          width
        }

      animate = ->
        if @_gl
          @_rafID = requestAnimationFrame animate
          onTick @_gl

      do animate

    render: ->
      <View
        style={[
          flex: 1
          backgroundColor: '#ffffff'
          @props.style
        ]}
      >
        <GLView
          style={ flex: 1 }
          onContextCreate={@_onContextCreate}
          onRender={
            onRender or ( => )
          }
        />
      </View>
