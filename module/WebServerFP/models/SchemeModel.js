/**
 * @typedef {Object} CONNECTOR 접속반 상세 정보
 * @property {number} connector_seq 접속반 정보 시퀀스
 * @property {string} target_id 접속반 id
 * @property {string} target_alias 접속반 명
 * @property {string} target_category 접속반 종류
 * @property {string} connect_info 장치 접속 정보
 * @property {string} protocol_info 장치 프로토콜 정보
 * @property {string} serial_number 고유 코드
 * @property {string} model_name 장치 명
 * @property {string} director_name 담당자
 * @property {string} director_tel 연락처
 */


/**
 * @typedef {Object} CONNECTOR_TROUBLE_DATA 장치에서 에러가 검출될 경우 발생 및 해결 정보 저장
 * @property {number} connector_trouble_data_seq 접속반 문제 이력 시퀀스
 * @property {number} connector_seq 접속반 정보 시퀀스
 * @property {number} is_error 고장 여부
 * @property {string} msg 고장 내용
 * @property {string} code 고장 코드
 * @property {Date} occur_date 발생 일자
 * @property {Date} fix_date 해결 일자
 */


/**
 * @typedef {Object} DATA_LOGGER 데이타 로거
 * @property {number} data_logger_seq 데이타 로거 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {string} target_id 데이타 로거 id
 * @property {string} connect_info 장치 접속 정보
 * @property {string} protocol_info 장치 프로토콜 정보
 * @property {string} code 고유 코드
 */


/**
 * @typedef {Object} DEVICE_DATA 장치 데이터
 * @property {number} device_data_seq 장치 데이터 시퀀스
 * @property {number} device_info_seq 장비 정보 시퀀스
 * @property {number} data 장치 데이터
 * @property {Date} writedate 입력일
 */


/**
 * @typedef {Object} DEVICE_INFO 장비 정보
 * @property {number} device_info_seq 장비 정보 시퀀스
 * @property {number} data_logger_seq 데이타 로거 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {number} device_location_seq 설치 장소 시퀀스
 * @property {number} device_summary_seq 장치 구성 정보 시퀀스
 * @property {string} target_id 장치 id
 * @property {string} target_alias 장치 별명
 * @property {number} is_bottom 장치 하부 여부
 * @property {string} model_name 장치 명
 * @property {string} serial_number 장치 고유 코드
 */


/**
 * @typedef {Object} DEVICE_LOCATION 설치 장소
 * @property {number} device_location_seq 설치 장소 시퀀스
 * @property {string} target_id 장소 id
 * @property {string} target_name 장소 명
 * @property {number} is_bottom 장치 위치 하부 여부
 */


/**
 * @typedef {Object} DEVICE_SUMMARY 장치 개요 정보
 * @property {number} device_summary_seq 장치 구성 정보 시퀀스
 * @property {string} device_prefix 장치 접두어
 * @property {string} device_name 장치 명
 * @property {string} data_unit 데이터 단위
 */


/**
 * @typedef {Object} INVERTER 인버터 장치 상세 정보
 * @property {number} inverter_seq 인버터 정보 시퀀스
 * @property {string} target_id 인버터 id
 * @property {string} target_alias 인버터 별명
 * @property {string} target_category 장치 카테고리
 * @property {string} protocol_info 장치 프로토콜 정보
 * @property {string} connect_info 접속 정보
 * @property {string} serial_number 고유 코드
 * @property {number} amount 단위: Wh (10:1 Scale)
 * @property {string} director_name 담당자
 * @property {string} director_tel 연락처
 */


/**
 * @typedef {Object} INVERTER_DATA 인버터에서 측정된 데이터
 * @property {number} inverter_data_seq 인버터 데이터 시퀀스
 * @property {number} inverter_seq 인버터 정보 시퀀스
 * @property {number} in_a 10:1 Scale
 * @property {number} in_v 10:1 Scale
 * @property {number} in_w 입력 전력
 * @property {number} out_a 10:1 Scale
 * @property {number} out_v 10:1 Scale
 * @property {number} out_w 출력 전력
 * @property {number} p_f Power Factor (10:1 Scale)
 * @property {number} d_wh Daily Power, 단위:Wh (10:1 Scale)
 * @property {number} c_wh Cumulative Power, 단위:Wh (10:1 Scale)
 * @property {Date} writedate 등록일
 */


/**
 * @typedef {Object} INVERTER_TROUBLE_DATA 장치에서 에러가 검출될 경우 발생 및 해결 정보 저장
 * @property {number} inverter_trouble_data_seq 인버터 문제 이력 시퀀스
 * @property {number} inverter_seq 인버터 정보 시퀀스
 * @property {number} is_system_error isSystemError
 * @property {string} msg 고장 내용
 * @property {string} code 고장 코드
 * @property {Date} occur_date 발생 일자
 * @property {Date} fix_date 해결 일자
 */


/**
 * @typedef {Object} KMA_DATA 기상청에서 발표한 일기예보를 저장
 * @property {number} kma_data_seq 기상청 일기 예보 시퀀스
 * @property {number} x 위도
 * @property {number} y 경도
 * @property {number} temp ℃
 * @property {number} pty (0 : 없음, 1:비, 2:비/눈, 3:눈/비, 4:눈)
 * @property {number} pop %
 * @property {number} r12 mm (① 0 <= x < 0.1, ② 0.1 <= x < 1, ③ 1 <= x < 5, ④ 5 <= x < 10, ⑤ 10 <= x < 25, ⑥ 25 <= x < 50, ⑦ 50 <= x)
 * @property {string} wf_kor ① 맑음 ② 구름 조금 ③ 구름 많음 ④ 흐림 ⑤ 비 ⑥ 눈/비 ⑦ 눈
 * @property {string} wf_en ① Clear ② Partly Cloudy ③ Mostly Cloudy ④ Cloudy ⑤ Rain ⑥ Snow/Rain ⑦ Snow
 * @property {number} ws m/s
 * @property {number} wd 풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)
 * @property {number} reh %
 * @property {Date} applydate 적용시간
 * @property {Date} writedate 작성일
 * @property {Date} updatedate 수정일
 */


/**
 * @typedef {Object} MAIN_INFO 현장에 설치되는 서버.     장치들과의 통신, 모바일 App과의 통신, 통합서버와의 통신 등을 수행함.
 * @property {number} main_seq MAIN 시퀀스
 * @property {number} weather_location_seq 기상청 정보 위치 시퀀스
 * @property {string} name 명칭
 * @property {string} address 주소
 * @property {string} ip 아이피
 * @property {number} is_deleted 삭제여부
 * @property {string} chart_color 대시 보드 차트 색상
 * @property {number} chart_sort_rank 대시 보드 차트 정렬 순위
 * @property {Date} writedate 생성일
 * @property {Date} updatedate 수정일
 */


/**
 * @typedef {Object} MEMBER 가입한 회원의 정보
 * @property {number} member_seq 회원정보 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {string} id 아이디
 * @property {string} grade 회원 등급
 * @property {string} name 이름
 * @property {string} address 주소
 * @property {string} tel 전화번호
 * @property {string} password_temp
 * @property {string} password_salt 암호화소금
 * @property {string} password 암호화비밀번호
 * @property {number} is_deleted 삭제여부
 * @property {Date} writedate 생성일
 * @property {Date} updatedate 수정일
 */


/**
 * @typedef {Object} PHOTOVOLTAIC 수중 태양광 모듈 상세 정보
 * @property {number} photovoltaic_seq 모듈 세부 정보 시퀀스
 * @property {string} target_id 모듈 id
 * @property {string} target_alias 모듈 별명
 * @property {string} install_place 설치장소
 * @property {string} module_type 모듈 타입
 * @property {number} compose_count 직렬구성 개수
 * @property {number} amount 단위: kW (10:1 Scale)
 * @property {string} model_name 장치 명
 * @property {string} serial_number 고유 코드
 * @property {string} manufacturer 제조사
 */


/**
 * @typedef {Object} PHOTOVOLTAIC_DATA 접속반에서 측정된 데이터
 * @property {number} photovoltaic_data_seq 접속반 데이터 시퀀스
 * @property {number} photovoltaic_seq 모듈 세부 정보 시퀀스
 * @property {number} amp 10:1 Scale
 * @property {number} vol 10:1 Scale
 * @property {Date} writedate 등록일
 */


/**
 * @typedef {Object} RELATION_DEVICE 장치 관계
 * @property {number} relation_device_seq 장치 관계 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {number} device_info_seq 장비 정보 시퀀스
 */


/**
 * @typedef {Object} RELATION_POWER 태양광 계측 시스템 관계 정보
 * @property {number} relation_power_seq 태양광발전 관계 정보 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {number} photovoltaic_seq 모듈 세부 정보 시퀀스
 * @property {number} connector_seq 접속반 정보 시퀀스
 * @property {number} inverter_seq 인버터 정보 시퀀스
 * @property {number} connector_ch 접속반 연결 채널
 */


/**
 * @typedef {Object} WEATHER_DEVICE_DATA 기상관측장비로부터 수집한 데이터를 저장
 * @property {number} weather_device_data_seq 기상관측장비 측정 정보 시퀀스
 * @property {number} main_seq MAIN 시퀀스
 * @property {number} temp ℃
 * @property {number} reh %
 * @property {number} wd 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)
 * @property {number} ws m/s
 * @property {number} solar W/mﾲ
 * @property {Date} writedate 등록일
 */


/**
 * @typedef {Object} WEATHER_LOCATION 기상청의 날씨 API를 가져올 위치값 테이블
 * @property {number} weather_location_seq 기상청 정보 위치 시퀀스
 * @property {string} province 도
 * @property {string} city 시
 * @property {string} town 읍
 * @property {number} latitude 위도
 * @property {number} longitude 경도
 * @property {number} x X
 * @property {number} y Y
 */

module;