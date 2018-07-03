'use strict';

const config =  require('../config.js');
const configInit = config.init;

class InitSetter {
  /**
   * 
   * @param {configInit} initConfig 
   */
  constructor(initConfig) {
    this.config = initConfig;
  }

  get initConfig() {
    return this.config;
  }

  get controllerInfo() {
    return this.config.controllerInfo;
  }

  get dbInfo() {
    console.dir(this.config);
    return this.config.dbInfo;
  }
  
  get webPort() {
    return this.config.controllerInfo.webPort;
  }

}
module.exports = InitSetter;