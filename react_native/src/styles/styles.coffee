


c = -> console.log.apply console, arguments
React = require 'react'
{ StyleSheet } = require 'react-native'


exports.styles =
    container:
        backgroundColor: '#F5FCFF'
    content:
        backgroundColor: '#F5FCFF'
    header:
        backgroundColor: '#81c04d'
        color: '#ffffff'
        title:
            flex: 5
            fontSize: 20
            color: '#ffffff'
            textAlign: 'center'
            alignSelf: 'center'
        icon:
            flex: 1
            marginLeft: 10
            marginRight: 10
            alignSelf: 'center'
        footer:
            backgroundColor: '#81c04d'
            color: '#ffffff'
        item:
            flex: 1
            borderWidth: 1
            borderColor: 'white'
            backgroundColor: 'honeydew'
            marginVertical: 5
        itemSelected:
            flex: 1
            borderWidth: 1
            borderColor: 'white'
            backgroundColor: 'lightcyan'
            marginVertical: 5
        iconAdd:
            elevation: 1
            shadowColor: 'darkgrey'
            shadowOpacity: 0.8
            shadowRadius: 4
            shadowOffset:
                height: 0
                width: 0
        menuItem:
            fontSize: 20
            color: '#ffffff'
            textAlign: 'center'
            alignSelf: 'center'
            padding: 10
