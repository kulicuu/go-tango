

c = -> console.log.apply console, arguments
_ = require 'lodash'

React = require 'react'

ReactNative = require 'react-native'
{ StyleSheet } = ReactNative

rr = -> React.createFactory(React.createClass.apply(React, arguments))


precursors = {
    Text,
    View,
    ListView,
    TouchableHighlight,
    TouchableOpacity,
    Image,
    ActionSheetIOS,
    Platform,
    Linking,
    Alert
    } = ReactNative

{
    Text,
    View,
    ListView,
    TouchableHighlight,
    TouchableOpacity,
    Image,
    ActionSheetIOS,
    Platform,
    Linking,
    Alert
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}

action_types = require '../constants/action_types.coffee'


Icon = require 'react-native-vector-icons/FontAwesome'

{ HeaderComponent } = require '../components/HeaderComponent'

# react_native_maps = require 'react-native-maps'
Marker = React.createFactory require('react-native-maps').Marker
MapView = React.createFactory require('react-native-maps').MapView
# MapView = React.createFactory react_native_maps

module.exports = rr
    getInitialState: ->
        region:
            latitude: 32.072528
            longitude: 34.784366
            latitudeDelta: 0.031
            longitudeDelta: 0.014

    componentWillMount: ->
        @dispatch = @props.store.dispatch

    componentWillReceiveProps: (nextProps) ->
        c "componentWillReceiveProps"

    componentDidMount: ->

    backToEventListView: ->
        @dispatch
            type: action_types.BACK_TO_EVENT_LIST_VIEW

    onRegionChange: (region) ->
        @setState {region}

    render: ->
        View null,
            HeaderComponent
                title: "Map of milongas"
                onBackButtonPressed: => @backToEventListView()
            MapView
                style: styles.map
                region: @state.region
                onRegionChange: @onRegionChange



styles = StyleSheet.create
    container:
        position: 'absolute'
        top: 0
        left: 0
        right: 0
        bottom: 0
        height: 400
        width: 400
        justifyContent: 'flex-end'
        alignItems: 'center'
    map:
        position: 'absolute'
        top: 0
        left: 0
        right: 0
        bottom: 0
        width: 500
        height: 800
