# go-tango
GoTango - worldwide tango party scheduler

This application will help tango community members (aka “tangeros”) to find places to dance at any point of the world.
Use: geospatial database, self-hosted Parse server, maps, calendar, Redux, i18n.



### some development process


- To start the emulator go to Android/Sdk/tools and run: `./android avd`

- To enable logging: `adb logcat | grep ReactNativeJS`



- `react-native start` then with the emulator running `react-native run-android`

- To compile the CoffeeScript go into /react_native and `coffee -w -c --output build/ src/`

to use the maps we had to generate the api key with a google account, and then insert it into the manifest xml somewhere.


### testing ::

ReactNative can't be required in a NodeJS context; we have to replace it with React for testing purposes.  So we'll need to make the components modules polymorphic in that way based on environment.
