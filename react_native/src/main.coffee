

c = -> console.log.apply console, arguments

React = require 'react'
rr = -> React.createFactory(React.createClass.apply(React, arguments))
_ = require 'lodash'

{ StyleSheet } = require 'react-native'

precursors = { View, Text } = require 'react-native'

{
     Text, View
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}

Redux = require 'redux'

Reducer = require './store/reducer'
App = require './app'

store = Redux.createStore Reducer.reducer

MainComponent = rr
    componentWillMount: ->
        @state = store.getState()
        store.subscribe =>
            @setState store.getState()

    render: ->
        App
            store: store

module.exports = MainComponent
