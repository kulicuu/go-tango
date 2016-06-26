


c = -> console.log.apply console, arguments
_ = require 'lodash'
React = require 'react'
rr = -> React.createFactory(React.createClass.apply(React, arguments))

{ AppRegistry, StyleSheet: _StyleSheet, Text: _Text, View: _View, TextInput: _TextInput } = require 'react-native'

c 'hey'
View = React.createFactory _View
Text = React.createFactory _Text
TextInput = React.createFactory _TextInput



styles = _StyleSheet.create
    container:
        flex: 1
        justifyContent: 'center'
        alignItems: 'center'
        backgroundColor: '#F5FCFF'
    welcome:
        fontSize: 20
        textAlign: 'center'
        margin: 10
    instructions:
        textAlign: 'center'
        color: '#333333'
        marginBottom: 5



test = require('./map_view')


module.exports = rr
    render: ->
        test()
        # View
        #     style: styles.container
            # style: null

            # Text null, "Bienvenidos a GoTango"

            # TextInput
            #   placeholder: "placeholder"
