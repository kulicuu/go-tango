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
Marker = React.createFactory react_native_maps.Marker

{ MapView: _MapView } = require 'react-native-maps'



MapView = React.createFactory react_native_maps




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

# c 'hey'

module.exports = rr

    fetch_data: ->
        query = new Parse.Query 'Locations'
        query.find()
            .then

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
            MapView
                style:
                    left: 30
                    top: 30
                    height: 400
                    width: 300
                    borderWidth: 1
                    borderColor: 'black'
                region: @state.region
                onRegionChange: @onRegionChange
                ,
                if @state.initialised is true
                    for marker in markers
                        Marker
                            key: marker.key
                            coordinate: marker.latlng
                            title: marker.title
                            description: marker.description
