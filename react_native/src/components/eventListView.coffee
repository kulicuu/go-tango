
c = -> console.log.apply console, arguments
_ = require 'lodash'
React = require 'react'

rr = -> React.createFactory(React.createClass.apply(React, arguments))

Parse = require 'parse/react-native'

Parse.initialized 'gotango', 'unused'

Parse.serverURL = 'https://go-tango.herokuapp.com/parse'

ReactNative = require 'react-native'

{ StyleSheet } = ReactNative

precursors = {
    Text, View, TouchableHighlight, TouchableOpacity,
    Image, ActionSheetIOS, Platform, Linking, Alert,
    TextInput, Picker, Switch
} = ReactNative

{
    Text, View, TouchableHighlight, TouchableOpacity,
    Image, ActionSheetIOS, Platform, Linking, Alert,
    TextInput, Picker, Switch
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}


{
    FETCH_DATA_REQUEST_STARTED,
    FETCH_DATA_REQUEST_FINISHED,
    FETCH_ORGANIZERS_REQUEST_SUCCEED,
    FETCH_LOCATIONS_REQUEST_SUCCEED,
    FETCH_EVENTS_REQUEST_SUCCEED,
    ADD_NEW_EVENT_REQUEST_SUCCEED,
    EVENT_CHANGED,
} = require '../constants/action_types.coffee'

Icon = require 'react-native-vector-icons/FontAwesome'

EventsListView = rr
    getInitialState: ->
        {}

    componentWillMount: ->
        @dispatch = @props.store.dispatch
        state = @props.store.getState()
        @setState state

    componentWillReceiveProps: (nextProps) ->
        @setState nextProps.store.getState()

    componentDidMount: ->
        @fetchData

    fetchData: ->
        query = new Parse.Query 'Locations'
        query.find()
            .then (locations) ->
                @dispatch
                    type: FETCH_LOCATIONS_REQUEST_SUCCEED
                    locations: locations
                query1 = new Parse.Query 'Organizers'
                query1.find() # return
            .then (organizers) ->
                @dispatch
                    type: FETCH_ORGANIZERS_REQUEST_SUCCEED
                    organizers: organizers
                query2 = new Parse.Query 'Events'
                query2.find() # return
            .then (events) ->
                @dispatch
                    type: FETCH_EVENTS_REQUEST_SUCCEED
                    events: events
                @dispatch
                    type: FETCH_DATA_REQUEST_FINISHED
            ,
            (error) ->
                c error
            @dispatch
                type: FETCH_DATA_REQUEST_STARTED

    onAddButtonPressed: ->
        event = new Parse.Object 'Events'

        event.set
            "name": "my milonga"

        event.save().then (event) ->
            @dispatch
                type: ADD_NEW_EVENT_REQUEST_SUCCEED
                event: event

    itemSelected: (item) ->
        alert 'item selected'

    renderRow: (item) ->
        TouchableOpacity
            key: item.id
            onPress: => @itemSelected(item)
            ,
            View
                style: styles.itemContainer
                ,
                Text
                    style: styles.itemName
                    ,
                    item.get('name')
                Text
                    style:
                        marginLeft: 10
                    ,
                    item.get('organizer').get('name')
                Text
                    style:
                        marginLeft: 10
                    ,
                    item.get('location').get('name')

    render: ->
        ds = new ListView.DataSource
            rowHasChanged: (r1, r2) -> r1 isnt r2
        dataSource = ds.cloneWithRows(@state.events)
        styleContainer = if @state.app.showSpinner then styles.containerSpinner else styles.containerList
        return (
            View
                style: styleContainer
                ,
                if @state.app.showSpinner
                    Image
                        source: require('../logo.png')
                else
                    View
                        style: styles.container
                        ,
                        EventListHeaderComponent
                            title: "Milongas"
                            onMapButtonPressed: => @goToMap()
                        ListView
                            ref: "eventsList"
                            dataSource: dataSource
                            enableEmptySections: true
                            initialListSize: 20
                            renderRow: (event) => @renderRow(event)
                        TouchableOpacity
                            onPress: => @onAddButtonPressed()
                            activeOpacity: 1.0
                            ,
                            Icon
                                name: 'plus'
                                size: 20
                                color: 'green'

        )

styles = StyleSheet.create
    containerSpinner:
        flex: 1
        justifyContent: 'center'
        alignItems: 'center'
        backgroundColor: '#F5FCFF'
    containerList:
        flex: 1
        backgroundColor: '#F5FCFF'
    itemContainer:
        flex: 1
        borderWidth: 1
        borderColor: 'grey'
        backgroundColor: 'honeydew'
        marginVertical: 5
    itemName:
        fontSize: 20
        fontWeight: 'bold'
        textAlign: 'left'
        marginLeft: 10
        color: 'grey'
    welcome:
        fontSize: 20
        textAlign: 'center'
        margin: 10
    instructions:
        textAlign: 'center'
        color: '#333333'
        marginBottom: 5
