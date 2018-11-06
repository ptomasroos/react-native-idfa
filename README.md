# react-native-idfa

Retrieve the advertising identifier across ios and android on react-native with this small library.
Support RN > 0.56 with or without and cocoapods

[![Build Status](https://travis-ci.com/ptomasroos/react-native-idfa.svg?branch=master)](https://travis-ci.com/ptomasroos/react-native-idfa) [![npm version](https://badge.fury.io/js/react-native-idfa.svg)](https://badge.fury.io/js/react-native-idfa) [![npm downloads](https://img.shields.io/npm/dm/react-native-idfa.svg)](https://www.npmjs.com/package/react-native-idfa)

## How to install

```
npm install react-native-idfa
react-native link
```

Since this library is using the advertising identifier, you must remember to add
AdSupport in your IOS project.

If you're using Cocoapods, there is no need to this as when you're adding react-native-idfa to your Podfile it will get added by default

## Podfile
```
  pod 'react-native-idfa',  path: '../node_modules/react-native-idfa'
```

Add AdSupport.framework under "Link Binary With Libraries".

## How to use!

```
import { IDFA } from 'react-native-idfa';

class Basic extends Component {
  state = {
     IDFA: '',
  };

  componentDidMount() {
    IDFA.getIDFA().then((idfa) => {
      this.setState({ IDFA: idfa, });
    })
    .catch((e) => {
      console.error(e);
    });
  }

  render() {
    return (
      <View style={{ flex: 1 }}>
        <Text>Your IDFA is : {this.state.IDFA}</Text>
      </View>
    );
  }
}
```

##  Changing react-native-idfa's com.google.android.gms:play-services-ads version

In your build.gradle make sure to force the version to whatever version makes sense through our your dependencies

```
configurations.all {
    resolutionStrategy.eachDependency { DependencyResolveDetails details ->
        if (details.getRequested().getGroup() == 'com.google.android.gms') {
            // If different projects require different versions of
            // Google Play Services it causes a crash on run.
            // Fix by overriding version for all projects.
            details.useVersion('17.0.0')
        }
    }
}

```

## Known flaws

Since this is a react-native repository we will ship the code untranspiled and with flow types along it.

## Using gms 17.0.0

Google has introduced some breaking changes on 17.0.0. The SDK will throw an error if your manifest.xml is not configured properly

```
    ******************************************************************************
    * The Google Mobile Ads SDK was initialized incorrectly. AdMob publishers    *
    * should follow the instructions here: https://goo.gl/fQ2neu to add a valid  *
    * App ID inside the AndroidManifest. Google Ad Manager publishers should     *
    * follow instructions here: https://goo.gl/h17b6x.                           *
    ******************************************************************************
```
