// @flow

import { NativeModules } from 'react-native';

const { PTRIDFA } = NativeModules;

class IDFA {
  getIDFA(): Promise<string> {
    return PTRIDFA.getIDFA();
  }
}

export default new IDFA();
