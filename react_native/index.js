// Generated by CoffeeScript 1.10.0
(function() {
  var AppRegistry, React, Text, TextInput, View, _, _StyleSheet, _Text, _TextInput, _View, c, ref, rr, styles, test;

  c = function() {
    return console.log.apply(console, arguments);
  };

  _ = require('lodash');

  React = require('react');

  rr = function() {
    return React.createFactory(React.createClass.apply(React, arguments));
  };

  ref = require('react-native'), AppRegistry = ref.AppRegistry, _StyleSheet = ref.StyleSheet, _Text = ref.Text, _View = ref.View, _TextInput = ref.TextInput;

  View = React.createFactory(_View);

  Text = React.createFactory(_Text);

  TextInput = React.createFactory(_TextInput);

  styles = _StyleSheet.create({
    container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: '#F5FCFF'
    },
    welcome: {
      fontSize: 20,
      textAlign: 'center',
      margin: 10
    },
    instructions: {
      textAlign: 'center',
      color: '#333333',
      marginBottom: 5
    }
  });

  test = require('./map_view');

  module.exports = rr({
    render: function() {
      return View({
        style: styles.container
      }, test());
    }
  });

}).call(this);