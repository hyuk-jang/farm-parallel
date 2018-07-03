'use strict';

process.env.NODE_ENV = 'production';
process.env.NODE_ENV = 'development';

require('./models/SchemeModel');
const LibrayModel =  require('./models/LibrayModel');



const Promise = require('bluebird');

const InitSetter = require('./config/InitSetter.js');

const config = require('./config.js');
const {BU, DU, SU} = require('base-util-jh');
const _ =  require('underscore');

global.BU = BU;
global.DU = DU;
global.SU = SU;
global._ = _;


const CONTROLLERS_PATH = process.cwd() + '\\controllers';
global.CONTROLLERS_PATH = CONTROLLERS_PATH;


// TODO: 개선 필요
let initSetter = new InitSetter(config.init);
global.initSetter = initSetter;


// 컨트롤러 구동 시작
function operationController() {
  // BU.CLI(mainConfig.workers.SocketServer.PushServer.current.port)
  let app = require('./config/app.js')(initSetter.dbInfo);
  let passport = require('./config/passport.js')(app, initSetter.dbInfo);
  app.set('passport', passport);
  app.set('initSetter', initSetter);

  require('./controllers')(app);

  /** Web Socket Binding */
  var http = require('http').Server(app);

  // TEST
  http.listen(initSetter.webPort, (req, res) => {
    console.log('Controller Server is Running', initSetter.webPort);
  });
}

operationController();

process.on('unhandledRejection', error => console.error(error));
process.on('uncaughtException', error => console.error(error));