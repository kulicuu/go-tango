


c = -> console.log.apply console, arguments
# action_types = require '../constants/action_types.coffee'
_ = require 'lodash'

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
} = require '../constants/action_types.coffee'

Redux = require 'redux'

initialAppState =
    showSpinner: false
    navigateTo: "eventsListView"
    currentEvent: null

app = ( state = initialAppState, action ) ->
    switch action.type
        when FETCH_DATA_REQUEST_STARTED
            _.assign {}, state,
                showSpinner: true
        when FETCH_EVENTS_REQUEST_SUCCEED
            _.assign {}, state,
                showSpinner: false
        when ADD_NEW_EVENT_REQUEST_SUCCEED
            _.assign {}, state,
                navigateTo: "EditEventComponent"
                currentEvent: action.event
        when BACK_TO_EVENT_LIST_VIEW
            _.assign {}, state
                navigateTo: "eventsListView"
        when GO_TO_MAP_PRESSED
            _.assign {}, state,
                navigateTo: "eventsMapView"
        else
            return state

organizers = ( state = [], action ) ->
    switch action.type
        when FETCH_ORGANIZERS_REQUEST_SUCCEED
            action.organizers
        else
            state

locations = ( state = [], action ) ->
    switch action.type
        when FETCH_LOCATIONS_REQUEST_SUCCEED
            action.locations
        else
            state

events = ( state = [], action ) ->
    switch action.type
        when FETCH_EVENTS_REQUEST_SUCCEED
            action.events
        when ADD_NEW_EVENT_REQUEST_SUCCEED
            state.slice().concat([action.event])
        when EVENT_CHANGED
            index = state.findIndex (event_tmp) =>
                event_tmp.id is action.event.id
            state.slice(0, index)
            .concat([action.event])
            .concat(state.slice(index + 1))
        else
            return state

exports.reducer = Redux.combineReducers
    app: app
    organizers: organizers
    locations: locations
    events: events
