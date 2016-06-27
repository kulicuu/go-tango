



c = -> console.log.apply console, arguments
rr = -> React.createFactory(React.createClass.apply(React, arguments))

React = require 'react'


{
    FETCH_DATA_REQUEST_STARTED,
    FETCH_DATA_REQUEST_FINISHED,
    FETCH_ORGANIZERS_REQUEST_SUCCEED,
    FETCH_LOCATIONS_REQUEST_SUCCEED,
    FETCH_EVENTS_REQUEST_SUCCEED,
    ADD_NEW_EVENT_REQUEST_SUCCEED,
    EVENT_CHANGED,
    ORGANIZER_SELECTED,
    LOCATION_SELECTED,
    BACK_TO_EVENT_LIST_VIEW
} = require './constants/action_types.coffee'

{ StyleSheet } = require 'react-native'

precursors = { Text, View } = require 'react-native'

{
     Text, View
} = dom_funcs = _.reduce precursors, (acc, v, k) ->
    acc[k] = React.createFactory v
, {}

Parse = requre 'parse/react-native'

Parse.initialize 'gotango', 'unused'
Parse.serverURL = 'https://go-tango.herokuapp.com/parse'

{ EventsListView } = require './components/eventListView'
{ EditEventComponent } = require './components/EditEventComponent'
{ EventsMapView } = require './components/eventsMapView'

App = rr

    getInitialState: ->
        {}

    componentWillMount: ->
        @dispatch = @props.store.dispatch
        @setState @props.store.getState()

    componentDidMount: ->

    componentWillReceiveProps: (nextProps) ->
        @setState nextProps.store.getState()

    render: ->
        page = null
        switch @state.app.navigateTo
            when "eventsListView"
                page =
                    EventsListView
                        props: @props
                break
            when "editEventComponent"
                page =
                    EditEventComponent
                        props: @props
                break
            when "eventsMapView"
                page =
                    EventsMapView
                        props: @props
                break
            else
                page =
                    EventsListView
                        props: @props
                break

        View
            style: {flex: 1}
            ,
            page

styles = StyleSheet.create
    container:
        backgroundColor: '#F5FCFF'


module.exports = App
