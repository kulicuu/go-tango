

c = -> console.log.apply console, arguments

_ = require 'lodash'


require 'react-native-mock/mock'


eeC = require './editEventComponent'

c eeC

eec = eeC.EditEventComponent

x = eec()
c x
