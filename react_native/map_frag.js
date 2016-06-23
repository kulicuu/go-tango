
import React from 'react';
import {
    Text,
    StyleSheet,
    View
} from 'react-native';


//import * as ActionTypes from './store/actionTypes';

var MapView = require('react-native-maps');

var markers = [{
    key:0,
    latlng:{latitude: 32.072528,
        longitude: 34.784366},
    title:"Silvia",
    description:"Milonga Lo De Silva"
}];

var App = React.createClass ({
    getInitialState() {
        return {
            region: {
                latitude: 32.072528,
                longitude: 34.784366,
                latitudeDelta: 0.031,
                longitudeDelta: 0.014,
                /*
                latitude: 37.78825,
                longitude: -122.4324,
                latitudeDelta: 0.0922,
                longitudeDelta: 0.0421,
                */
                /*34.784366,  32.072528*/
            },
        };
    },
    componentWillMount() {
        //this.dispatch = this.props.store.dispatch;
        //this.setState(this.props.store.getState());
    },
    componentDidMount() {
    },
    componentWillReceiveProps(nextProps) {
        //this.setState(nextProps.store.getState());
    },
    onRegionChange(region) {
        this.setState({ region });
    },
    render() {
        return (
            <MapView
                style={styles.map}
                region={this.state.region}
                onRegionChange={this.onRegionChange}
            >
                {
                    markers.map(marker => (
                        <MapView.Marker
                            key = {marker.key}
                            coordinate={marker.latlng}
                            title={marker.title}
                            description={marker.description}
                        />
                    ))
                }
            </MapView>
        );
    }
});

var styles = StyleSheet.create({
    container: {
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        height: 400,
        width: 400,
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    map: {
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
    },
});

/*
 var styles = StyleSheet.create({
 container: {
 padding:30,
 marginTop: 65,
 alignItems:'center'
 },
 image: {
 width: 217,
 height: 138
 },
 searchInput: {
 height: 36,
 padding: 4,
 marginRight: 5,
 flex: 4,
 fontSize: 18,
 borderWidth: 1,
 borderColor: '#48BBEC',
 borderRadius: 8,
 color: '#48BBEC'
 }
 });
 */

module.exports = App;
