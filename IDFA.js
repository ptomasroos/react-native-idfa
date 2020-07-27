// @flow

import { NativeModules, Platform } from 'react-native';

const { PTRIDFA } = NativeModules;

class IDFA {
  getIDFA(): Promise<string> {
    return PTRIDFA.getIDFA();
  }
  requestTrackingPermission(): Promise<string> {
    if (Platform.OS === "ios")
      return PTRIDFA.requestTrackingPermission();
    else
      return Promise.resolve("authorized");
  }
}

export default new IDFA();
