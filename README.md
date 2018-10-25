# react-native-idfa

## How to install

```
npm install react-native-idfa
react-native link
```

Since this library is using the advertising identifier, you must remember to add
AdSupport in your IOS project.

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

## How to run example

```
git clone git@github.com:ptomasroos/react-native-idfa.git
cd react-native-idfa/examples/Basic
npm install
npm run start
```

Open simulators and see your IDFA


##  Changing react-native-idfa's com.google.android.gms:play-services-ads version

In your build.gradle make sure to force the ersion to whatever version makes sense through our your dependencies

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
