

c = -> console.log.apply console, arguments

React = require 'react'
rr = -> React.createFactory(React.createClass.apply(React, arguments))

globalStyles = require('../styles/styles').styles

action_types = require '../constants/action_types.coffee'

{ StyleSheet, _Picker } = require 'react-native'

{ HeaderComponent } = require './headerComponent'

PickerItem = React.createFactory _Picker.Item

precursors = {
    Text,
    View,
    TouchableHighlight,
    TextInput,
    Picker,
    Switch
} = require 'react-native'


{
    Text,
    View,
    TouchableHighlight,
    TextInput,
    Picker,
    Switch
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}

Icon = require 'react-native-vector-icons/FontAwesome'


exports.EditEventComponent = rr
    getInitalState: ->

    componentWillMount: ->
        @dispatch = @props.store.dispatch
        @setState @props.store.getState()

    componentDidMount: ->

    componentWillReceiveProps: (nextProps) ->
        @setState nextProps.store.getState()

    backToEventListView: ->
        @updateEvent()
        @dispatch
            type: action_types.BACK_TO_EVENT_LIST_VIEW

    nameChanged: (value) ->
        event = @state.app.currentEvent
        event.set "name", value
        @dispatch
            type: action_types.EVENT_CHANGED
            event: event

    organizerSelected: (value) ->
        organizer = @state.organizers.find (organizer_tmp) =>
            return organizer_tmp.get('name') is value
        @state.app.currentEvent.set "organizer", organizer
        @dispatch
            type: action_types.EVENT_CHANGED
            event: @state.app.currentEvent
        @updateEvent()

    locationSelected: (value) ->
        location = @state.locations.find (location_tmp) =>
            location_tmp.get('name') is value
        @state.app.currentEvent.set("location", location)
        @dispatch
            type: action_types.EVENT_CHANGED
            event: @state.app.currentEvent
        @updateEvent()

    updateEvent: ->
        @state.app.currentEvent.save()
        .then (event) ->
            c 'event updated'

    render: ->
        event = @state.app.currentEvent
        View
            style: styles.container
            ,
            HeaderComponent
                title: 'Edit Details'
                onBackButtonPressed: @backToEventListView
            Text
                style: styles.label
                ,
                'Event name:'
            TextInput
                style: styles.input
                value: @state.app.currentEvent.get 'name'
                onChangeText: (value) => @this.nameChanged(value)
                onBlur: => @updateEvent()
            Text
                style: styles.label
                ,
                "Organizer:"
            Picker
                style:{flex: 1}
                selectedValue: if event.get('organizer') then event.get('organizer').get('name') else ''
                onValueChange: (name) => @organizerSelected(name)
                ,
                for organizer in @state.organizers
                    do (organizer) =>
                        PickerItem
                            key: location.id
                            label: location.get('name')
                            value: location.get('name')


styles = StyleSheet.create
    container:
        flex: 1
        backgroundColor: '#F5CFF'
        padding: 5
        marginTop: 10
        marginLeft: 10
        marginRight: 10
        fontSize: 20
        borderWidth: 1
        borderColor: 'charttreuse'
        borderRadius: 8
        
