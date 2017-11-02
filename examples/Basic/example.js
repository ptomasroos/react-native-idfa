/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  Text,
  View,
  TouchableOpacity,
} from 'react-native';

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
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text>Your IDFA is : {this.state.IDFA}</Text>
        <TouchableOpacity onPress={() => IDFA.openSettings()}>
          <Text>Open application settings</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

export default Basic;
