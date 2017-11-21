# react-native-idfa

## How to install

```
npm install @ptomasroos/react-native-idfa
react-native link
```

Since this library is using the advertising identifier, you must remember to add
AdSupport in your IOS project.

Add AdSupport.framework under "Link Binary With Libraries".

## How to use!

```
import { IDFA } from '@ptomasroos/react-native-idfa';

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
