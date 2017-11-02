import { NativeModules } from 'react-native';

const { PTRIDFA } = NativeModules;

class IDFA {
  getIDFA() {
    return PTRIDFA.getIDFA();
  }

  openSettings() {
    return PTRIDFA.openSettings();
  }
}

IDFAInstance = new IDFA();
export default IDFAInstance;
