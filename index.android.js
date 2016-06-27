


const c = function(){console.log.apply(console, arguments);};
import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  ListView

} from 'react-native';



var index = require('./react_native/build/index.js');

var MainComponent = require('./react_native/build/main.js');

class GoTango extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Bienvenidos a GoTango !!!
        </Text>
        {/*<Text style={styles.instructions}>
          To get started, edit index.android.js
        </Text>
        <Text style={styles.instructions}>
          Shake or press menu button for dev menu
        </Text>*/}


      </View>

    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('GoTango', () => index);
