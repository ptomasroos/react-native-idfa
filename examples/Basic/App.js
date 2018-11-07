/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View } from 'react-native';
import { IDFA } from 'react-native-idfa';

type Props = {};
export default class App extends Component<Props> {
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
      <View
        style={{ flex: 1, flexDirection: 'column', justifyContent: 'center' }}
      >
        <Text style={{ textAlign: 'center' }}>Your IDFA is :</Text>
        {this.state.IDFA !== '' && (
          <Text style={{ textAlign: 'center' }} testID="idfa">
            {this.state.IDFA}
          </Text>
        )}
      </View>
    );
  }
}

const styles = StyleSheet.create({});
