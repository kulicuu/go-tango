c = -> console.log.apply console, arguments

_ = require 'lodash'
require 'react-native-mock/mock'


styles = require './styles.coffee'

c styles
