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
        return 'http://localhost:3000/';
      }
      case EnvType.test: {
        return 'test';
      }
      case EnvType.production: {
        return 'production';
      }
    }

  }
}
