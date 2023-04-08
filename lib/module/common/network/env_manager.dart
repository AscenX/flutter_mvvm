enum EnvType { dev, test, production }

class EnvManager {

  static EnvType _currentType = EnvType.dev;

  static get currentType {
    return EnvManager._currentType;
  }

  static setType(EnvType type) {
    EnvManager._currentType = type;
  }

  static get host {
    switch (EnvManager._currentType) {
      case EnvType.dev: {
        return 'https://alivc-demo.aliyuncs.com/';
      }
      case EnvType.test: {
        return 'https://httpbin.org/';
      }
      case EnvType.production: {
        return 'https://httpbin.org/';
      }
    }

  }
}
