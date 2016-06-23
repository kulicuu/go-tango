c = -> console.log.apply console, arguments
_ = require 'lodash'
React = require 'react'
rr = -> React.createFactory(React.createClass.apply(React, arguments))
Parse = require 'parse/react-native'

Parse.initialize('gotango', 'unused')
Parse.serverURL = "https://go-tango.herokuapp.com/parse"


{ AppRegistry, StyleSheet: _StyleSheet, Text: _Text, View: _View, TextInput: _TextInput } = require 'react-native'


View = React.createFactory _View
Text = React.createFactory _Text
TextInput = React.createFactory _TextInput

react_native_maps = require 'react-native-maps'

x = react_native_maps.Marker
c 'x999999999999999999', x
c 'react_native_maps39999999999999999999999999999999', react_native_maps.Marker
Marker = React.createFactory react_native_maps.Marker
c 'Marker 388888888888888888888888888888888888', Marker
# x = react_native_maps()
# c 'x 38888888888888888888', x
{ MapView: _MapView } = require 'react-native-maps'

MapView = React.createFactory react_native_maps
c 'MapView99999999999999999', MapView.Marker
c 'Text333333333333333', Text



markers = [
    {
        key: 0
        latlng:
            latitude: 32.072528
            longitude: 34.784366
        title: "Silvia"
        description: "Milonga Lo De Silva"
    }
]

module.exports = rr
    getInitialState: ->
        initialised: false
        region:
            latitude: 32.072528
            longitude: 34.784366
            latitudeDelta: 0.031
            longitudeDelta: 0.014

    onRegionChange: (region) ->
        @setState
            region: region

    componentDidMount: ->
        setTimeout =>
            @setState
                initialised: true
        , 1000

    render: ->

        View null,
            # Text null, "testing testing 123"
            MapView
                style:
                    # position: 'absolute'
                    # top: 0
                    # left: 0
                    # right: 0
                    # bottom: 0
                    height: 400
                    width: 300
                    borderWidth: 1
                    borderColor: 'black'
            # Text null, "anoth7777777777777777er"

            # region:
            #     latitude: 37.78825
            #     longitude: -122.4324
            #     latitudeDelta: 0.0922
            #     longitudeDelta: 0.0421
                region: @state.region
                onRegionChange: @onRegionChange
                ,
                if @state.initialised is true
                    for marker in markers
                        # do (marker) =>
                        c 'marker333333333333333333333', marker
                        Marker
                            key: marker.key
                            coordinate: marker.latlng
                            title: marker.title
                            description: marker.description
