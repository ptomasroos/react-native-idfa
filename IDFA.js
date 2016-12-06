import { NativeModules } from 'react-native';

const { PTRIDFA } = NativeModules;

class IDFA {
  getIDFA() {
    return PTRIDFA.getIDFA();
  }
}

IDFAInstance = new IDFA();
export default IDFAInstance;
