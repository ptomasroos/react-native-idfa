/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View } from 'react-native';

import { IDFA } from '@ptomasroos/react-native-idfa';

export default class App extends Component<{}> {
  state = {
    IDFA: '',
  };

  componentDidMount() {
    IDFA.getIDFA()
      .then(idfa => {
        this.setState({ IDFA: idfa });
      })
      .catch(e => {
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
