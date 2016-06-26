

c = -> console.log.apply console, arguments

React = require 'react'
rr = -> React.createFactory(React.createClass.apply(React, arguments))

globalStyles = require('../styles/styles').styles

action_types = require '../constants/action_types.coffee'

{ StyleSheet } = require 'react-native'

precursors = {
    Text,
    View,
    TouchableOpacity
} = require 'react-native'


{
    Text,
    View,
    TouchableOpacity
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}

Icon = require 'react-native-vector-icons/FontAwesome'

MapButton = ({onButtonPressed}) ->
    TouchableOpacity
        onPress: onButtonPressed
        activeOpacity: 1
        ,
        Icon
            name: 'map-marker'
            size: 20
            color: globalStyles.header.color
            style: styles.icon

Title = ({title}) ->
    Text
        style: styles.title
        ,
        title

exports.EventListHeaderComponent = rr
    render: ->
        View
            style: styles.headerContainer
            ,
            MapButton
                onButtonPressed: @props.onMapButtonPressed
                ,
                Title
                    title: @props.title

styles = StyleSheet.create
    headerContainer:
        backgroundColor: globalStyles.header.backgroundColor
        paddingTop: 30
        paddingBottom: 10
        marginTop: 0
        flexDirection: 'row'
    title: globalStyles.header.title
    icon: globalStyles.header.icon
