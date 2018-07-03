const BU = require('base-util-jh').baseUtil;
module.exports = function (dbInfo) {
  /** Node 환경에서 Web Server를 돌리기 위한 프레임워크 */
  const express = require('express');
  /** Express 프레임워크 내에서 접속한 브라우저의 Session을 자동으로 처리해주는 라이브러리 */
  const session = require('express-session');
  /** Session 처리 결과를 DB에 자동으로 입력, 수정을 해주는 라이브러리 */
  const MySQLStore = require('express-mysql-session')(session);

  /** Res Data를 분석해주는 파서 */
  const bodyParser = require('body-parser');
  /** 주어진 루트 디렉토리에서 파일을 제공하는 미들웨어 */
  const serveStatic = require('serve-static');

  /** 클라이언트가 Rest Action을 지원하지 않는 환경에서도 RestAPI를 사용하기 위한 라이브러리  */
  const methodOverride = require('method-override');
  /** node.js 용 HTTP 요청 로거 미들웨어 */
  const logger = require('morgan');
  /** 경로 조작 라이브러리 */
  const path = require('path');

  const app = express();
  /** 플래시는 메시지를 저장하는 데 사용되는 세션의 특수 영역입니다. 메시지는 플래시에 기록되고 사용자에게 표시되면 지워집니다. 플래시는 일반적으로 리디렉션과 함께 사용되어 렌더링 할 다음 페이지에서 메시지를 사용할 수 있도록합니다. */
  const flash = require('connect-flash');
  /** 파비콘을 나타내기 위한 라이브러리 */
  const favicon = require('serve-favicon');
  // 파비콘 설정
  app.use(favicon(path.join(process.cwd(), 'public/image', 'favicon.ico')));
  // 바디파서 바인딩
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({
    limit: 1024 * 1024 * 1, // 1mb 까지 허용
    extended: true
  }));
  // 메소드 오버라이드 바인딩
  app.use(methodOverride('_method'));

  app.use(flash());

  // 정적으로 참조할 자원 public 폴더 설정
  app.use(express.static(path.join(process.cwd(), '/', 'public')));
  // 세션 정의 규칙 정의 및 세션 처리 바인딩
  app.use(session({
    key: 'sid',
    secret: BU.GUID(),
    store: new MySQLStore(dbInfo),
    resave: false,
    saveUninitialized: true
  }));


  // app.use('/upload', serveStatic(path.join(process.cwd(), '/', 'uploads')));

  // html 엔진 EJS
  app.engine('html', require('ejs').renderFile);
  // 뷰 템플릿 --> HTML
  app.set('view engine', 'html');
  // 뷰 기본 경로
  app.set('views', path.join(process.cwd(), '/', 'views'));

  // 배포 Ver 일 경우 사용자 권한 체크
  if (app.get('env') === 'production') {
    process.on('uncaughtException', function (err) {
      //예상치 못한 예외 처리
      BU.debugConsole();
      console.log('uncaughtException 발생 : ' + err);
      BU.errorLog('uncaughtException', err);
    });
    // app.use('/admin', function (req, res, next) {
    //     console.log('all admin hello')
    //     if (!req.user) {
    //         return res.redirect('/auth/login');
    //     }
    //     next();
    // })
  }

  // Pkg 를 위한 path 추가
  path.join(process.cwd(), '/controllers/**/*');
  path.join(process.cwd(), '/models/**/*');

  
  // Error-handling middleware
  console.log(app.get('env'));
  // development error handler
  // will print stacktrace
  if (app.get('env') === 'development') {
    app.use(logger(':method :url :status :response-time ms - :res[content-length]'), function (req, res, next) {
      next();
    });

    app.use(function (err, req, res, next) {
      // console.log(res);
      res.status(res.status || 500);
      res.render('error', {
        message: err.message,
        error: err
      });
    });
  }


  // FIXME: use 이벤트가 router 앞에 위치함.
  // catch 404 and forward to error handler
  setTimeout(function () {
    app.use((req, res, next) => {
      res.status(404).send('Sorry cant find that!');
    });
  }, 1000 * 3);






  return app;
};