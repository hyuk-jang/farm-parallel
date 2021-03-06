const _ = require('lodash');
const BU = require('base-util-jh').baseUtil;


/**
 * @typedef {Object} calcRowPacketIntervalOption
 * @property {string} calcMaxKey
 * @property {string} calcMinKey
 * @property {string} resultKey
 * @property {string} groupKey
 * @property {{dateKey: string, maxRequiredDateSecondValue: number, minRequiredCountKey: string, minRequiredCountValue: number}} rangeOption
 */



/**
 * searchRange Type
 * @typedef {Object} searchRange
 * @property {string} searchType day, month, year, range
 * @property {string} strStartDate sql writedate range 사용
 * @property {string} strEndDate sql writedate range 사용
 * @property {string} rangeStart Chart 위에 표시될 시작 날짜
 * @property {string} rangeEnd Chart 위에 표시될 종료 날짜
 * @property {string} strStartDateInputValue input[type=text] 에 표시될 시작 날짜
 * @property {string} strEndDateInputValue input[type=text] 에 표시될 종료 날짜
 */


 
/**
 * @typedef {Object} chartData 차트 그리기 위한 데이터 형태
 * @property {Array} range 날짜 범위
 * @property {Array.<chartSeries>} series 차트를 그리기 위한 각각의 객체 리스트
 */

/**
  * @typedef {Object} chartSeries
  * @property {string} name
  * @property {number[]} data
  * @property {string=} color 차트 색상
  * @property {chartDataOption} option 차트 색상
  */

  
/**
 * @typedef {Object} chartOption
 * @property {string} selectKey Chart에 표현할 Key
 * @property {string} dateKey 차트 리스트 범위를 참조할 Key
 * @property {string=} maxKey 최대 값 구할 키
 * @property {string=} minKey 최소 값 구할 키
 * @property {string=} averKey 평균 값 구할 키
 * @property {string=} groupKey rowDataPacketList를 Group 처리 할 Key
 * @property {string=} sortKey 정렬 순위를 참조할 Key
 * @property {string=} colorKey Chart Line 색상
 * @property {boolean=} hasArea Area로 설정할 여부
 */

/**
 * @typedef {Object} chartDataOption
 * @property {number=} sort 차트를 정렬 처리할 순서
 * @property {number} max 해당 RowPacketList 최대 값
 * @property {number} min 해당 RowPacketList 최소 값
 * @property {number} aver 해당 RowPacketList 평균 값
 * @property {string=} scale 원시 데이터에 곱할 가중치 값
 */

/**
  * @typedef {Object} chartDecoration
  * @property {string} mainTitle
  * @property {string} xAxisTitle
  * @property {string} yAxisTitle
  */




/**
 * 기상청 날씨 변경
 * @param {{temp: number, pty: number, wf_kor: string, wf_en: string, pop: number, r12: number, ws:number, wd: number, reh: number, applydate: Date}} weatherCastInfo 
 * @return {{temp: number, wf: number}} 
 */
function convertWeatherCast(weatherCastInfo) {
  let returnValue = {temp: 0, wf: 0};

  if(_.isEmpty(weatherCastInfo)){
    return returnValue;
  }

  returnValue.temp = weatherCastInfo.temp;
  returnValue.wf = weatherCastInfo.wf || 0;

  return returnValue;
}
exports.convertWeatherCast = convertWeatherCast;




/**
 * 기준이 되는 날을 기준으로 해당 데이터의 유효성을 검증. 10분을 초과하면 유효하지 않는 데이터로 처리.
 * @param {Array|Object} targetData 점검하고자 하는 데이터
 * @param {Date} baseDate 기준 날짜
 * @param {string} dateKey 검색 날짜와 매칭되는 키
 * @return {Array.<{hasValidData: boolean, data: Object}>} 의미 있는 데이터 체크
 */
function checkDataValidation(targetData, baseDate, dateKey) {
  if (_.isArray(targetData)) {
    let validDataList = [];

    targetData.forEach(data => {
      let result = checkDataValidation(data, baseDate, dateKey);
      validDataList = validDataList.concat(result);
    });
    return validDataList;
  } else if (_.isObject(targetData)) {
    let validData = {
      hasValidData: false,
      data: {}
    };

    const gapDate = BU.calcDateInterval(baseDate, targetData[dateKey]);
    // BU.CLIS(gapDate, BU.convertDateToText(baseDate), BU.convertDateToText(targetData[dateKey]));
    validData.hasValidData = gapDate.remainDay === 0 && gapDate.remainHour === 0 && gapDate.remainMin <= 10 ? true : false;
    validData.data = targetData;

    return [validData];
  }
}
exports.checkDataValidation = checkDataValidation;

/**
 * checkDataValidation 수행 뒤의 Array의 특정 Key를 전부 합산 뒤 반환
 * @param {Array.<{hasValidData: boolean, data: Object}>} validDataList checkDataValidation를 수행하고 난 Array
 * @param {string} key 계산 Key
 * @param {boolean} hasAll hasValidData 여부에 상관없이 더할지
 * @return {number} 합산 값
 */
function calcValidDataList(validDataList, key, hasAll) {
  let validList = [];
  if (hasAll) {
    validList = _.map(validDataList, 'data');
  } else {
    _.forEach(validDataList, validData => {
      if (validData.hasValidData) {
        validList.push(validData.data);
      }
    });
  }
  // BU.CLI(validList);
  let returnNumber = _.sum(_.map(validList, key));
  return _.isNumber(returnNumber) ? returnNumber : 0;
}
exports.calcValidDataList = calcValidDataList;

/**
 * 값을 합산
 * @param {Array.<{Object}>} dataList Object List 
 * @param {string} key 계산 Key
 * @return {number|string} 계산 결과 값 or ''
 */
function reduceDataList(dataList, key) {
  let returnNumber = _.sum(_.map(dataList, key)); 
  return _.isNumber(returnNumber) ? returnNumber : '';
}
exports.reduceDataList = reduceDataList;

/**
 * 기준 값에 Scale 적용 후 소수 점 처리 후 반환
 * @param {number} value 계산 할려는 값
 * @param {number} scale 게산 식 etc: 0.001, 100, 10, 20 
 * @param {number|string} toFixedNumber 소수 점 자리
 */
function calcValue(value, scale, toFixedNumber) {
  // BU.CLIS(value, scale, toFixedNumber);
  if (_.isNumber(value) && _.isNumber(scale) && _.isNumber(toFixedNumber)) {
    return Number((value * scale).toFixed(toFixedNumber));
  }
  return '';
  // throw Error('argument 중 숫자가 아닌것이 있습니다.');
}
exports.calcValue = calcValue;




/**
 * 계산할려는 packetList를 순회하면서 이전 값과 현재 값의 차를 구하고 그 값의 유효성을 검증한 후 반환
 * @param {Object[]} rowDataPacketList 
 * @param {calcRowPacketIntervalOption} calcOption 
 */
function calcRangePower(rowDataPacketList, calcOption){
  // BU.CLI(calcOption);
  
  // 같은 Key 끼리 그루핑
  if (calcOption.groupKey) {
    // BU.CLI(groupKey);
    let groupRowDataPacketList = _.groupBy(rowDataPacketList, calcOption.groupKey);

    // 설정한 유효 기간을 체크하여 검증할 건지 여부
    const hasCalcRange = _.isEmpty(calcOption.rangeOption) ? false : true;
    // 이전 값과 현재 값의 날짜 차가 유효할 경우만 검증할 것인지 여부
    const hasCalcDate = hasCalcRange && calcOption.rangeOption.dateKey.length ? true : false;
    // 데이터 분포군 개수로는 계산하지 않음.
    // const hasCalcCount = hasCalcRange && calcOption.rangeOption.minRequiredCountKey.length ? true : false;
    
    _.forEach(groupRowDataPacketList, rowList => {
      let prevValue;
      let prevDate;
      rowList.forEach((rowData, index) => {
        let hasError = false;
        // 첫 데이터는 비교 대상이 없으므로 자체적으로 가지고 있는 최소 값을 기입
        if(index === 0){
          prevValue = _.isEmpty(calcOption.calcMinKey) ? rowData[calcOption.calcMaxKey] : rowData[calcOption.calcMinKey];
        } 

        // BU.CLI(prevDate);
        // 날짜 계산 옵션이 있다면 날짜 임계치를 벗어났는지 체크
        if(hasCalcDate && prevDate instanceof Date){
          /** @type {Date} */
          let currDate = rowData[calcOption.rangeOption.dateKey];
          currDate = typeof currDate === 'string' ? BU.convertTextToDate(currDate) : currDate;
          // BU.CLI(BU.convertDateToText(prevDate), BU.convertDateToText(currDate));
          let thisCritical = (currDate.getTime() - prevDate.getTime()) * 0.001;
          // BU.CLIS(prevDate.getTime(), currDate.getTime(), currDate.getTime() - prevDate.getTime());
          if(thisCritical >= calcOption.rangeOption.maxRequiredDateSecondValue){
            hasError = true;
          }
        } 

        // if(hasCalcCount && calcOption.rangeOption.minRequiredCountValue > rowData[calcOption.rangeOption.minRequiredCountKey]){
        //   hasError = true;
        // }

        // BU.CLI(hasError);
        rowData[calcOption.resultKey] = hasError ?  '' : rowData[calcOption.calcMaxKey] - prevValue;
        // BU.CLI(rowData);
        prevValue = rowData[calcOption.calcMaxKey];

        if(hasCalcDate){
          prevDate = rowData[calcOption.rangeOption.dateKey];
          prevDate = typeof prevDate === 'string' ? BU.convertTextToDate(prevDate) : prevDate;
        }
      });
      // rowList.shift();
    });

    return groupRowDataPacketList;
    
  } 
}
exports.calcRangePower = calcRangePower;

/**
 * 
 * @param {Object[]} rowDataPacketList 
 * @param {searchRange} searchRange 
 * @param {string} cumulativePowerKey
 */
function calcRangeGridOutW(rowDataPacketList, searchRange, cumulativePowerKey ){
  rowDataPacketList.forEach(rowDataPacket => {
    let cPower = rowDataPacket[cumulativePowerKey];
    rowDataPacketList.grid_out_w = '';
    if(typeof cPower === 'number'){
      switch (searchRange.searchType) {
      case 'min':
        rowDataPacket.grid_out_w = cPower * 60;
        break;
      case 'min10':
        rowDataPacket.grid_out_w = cPower * 6;
        break;
      case 'hour':
        rowDataPacket.grid_out_w = cPower;
        break;
      case 'day':
        rowDataPacket.grid_out_w = cPower / 6;
        break;
      case 'month':
        rowDataPacket.grid_out_w = cPower / 6 / 30;
        break;
      case 'year':
        rowDataPacket.grid_out_w = cPower / 6 / 365;
        break;
      default:
        break;
      }
      rowDataPacket.grid_out_w = _.round(rowDataPacket.grid_out_w, 2);
    } 
  });

}
exports.calcRangeGridOutW = calcRangeGridOutW;

/**
 * 
 * @param {Object[]} rowDataPacketList 
 * @param {searchRange} searchRange 
 * @param {string[]} dataKeyList
 */
function calcScaleRowDataPacket(rowDataPacketList, searchRange, dataKeyList ){
  rowDataPacketList.forEach(rowDataPacket => {
    dataKeyList.forEach(dataKey => {
      rowDataPacket[dataKey] = convertValueBySearchType(rowDataPacket[dataKey], searchRange.searchType);
    });
  });
}
exports.calcScaleRowDataPacket = calcScaleRowDataPacket;


/**
 * 접속반 메뉴에서 사용될 데이터 선언 및 부분 정의
 * @param {Array.<{connector_ch: number, photovoltaic_seq: number, pv_target_name: string, pv_manufacturer: string, cnt_target_name: string, ivt_target_name: string}>} viewUpsasProfile DB에서 
 * @param {number|string} connector_seq 선택한 접속반
 * @return {Array.<{photovoltaic_seq:number, connector_ch: number, pv_target_name:string, pv_manufacturer: string, cnt_target_name: string, ivt_target_name: string, install_place: string, writedate: Date, amp: number, vol: number, hasOperation: boolean }>}
 */
function refineSelectedConnectorList(viewUpsasProfile, connector_seq) {
  // let sortedList = _.flatten(_.map(_.groupBy(viewUpsasProfile, profile => profile.connector_seq), group => _.sortBy(group, 'connector_ch')));
  // if (connector_seq !== 'all') {
  //   sortedList = _.filter(sortedList, info => info.connector_seq === connector_seq);
  // }
  let returnArray = [];
  _.forEach(viewUpsasProfile, info => {
    returnArray.push({
      photovoltaic_seq: info.photovoltaic_seq,
      connector_ch: `CH ${info.connector_ch}`,
      pv_target_name: info.pv_target_name,
      pv_manufacturer: info.pv_manufacturer,
      cnt_target_name: info.cnt_target_name,
      ivt_target_id: info.ivt_target_id,
      ivt_target_name: info.ivt_target_name,
      inverter_seq: info.inverter_seq,
      install_place: info.sb_target_name ? info.sb_target_name : '육상',
      writedate: '',
      amp: '',
      vol: '',
      power: '',
      temperature: '',
      hasOperation: false
    });
  });
  return returnArray;
}
exports.refineSelectedConnectorList = refineSelectedConnectorList;

/**
 * Array.<{}> --> Array.<Array>
 * @param {Array} targetList 
 * @param {Array} priotyKeyList 
 * @param {number} repeatLength 
 * @return {Array} 
 */
function convertColumn2Rows(targetList, priotyKeyList, repeatLength) {
  const returnValue = {};
  priotyKeyList.forEach(key => {
    let pluckData = _.map(targetList, key);
    let space = repeatLength - pluckData.length;
    for (let i = 0; i < space; i++) {
      pluckData.push('');
    }
    returnValue[key] = pluckData;
  });

  return returnValue;
}
exports.convertColumn2Rows = convertColumn2Rows;
// 
/**
 * 인버터 메뉴에서 사용될 데이터 선언 및 부분 정의
 * @param {Object[]} viewInverterStatus DB에서 
 * @return {{totalInfo: {in_kw: number=, out_kw: number=, d_kwh: number=, c_mwh: number=}, dataList: Array.<{photovoltaic_seq:number, connector_ch: number, pv_target_name:string, pv_manufacturer: string, cnt_target_name: string, ivt_target_name: string, install_place: string, writedate: Date, amp: number, vol: number, hasOperation: boolean }>}}
 */
function refineSelectedInverterStatus(viewInverterStatus) {
  let returnValue = {
    totalInfo: {},
    dataList: []
  };
  let currInverterDataList = [];
  _.forEach(viewInverterStatus, info => {
    // BU.CLI(info)
    let hasValidData = info.hasValidData;
    let data = info.data;
    let addObj = {
      inverter_seq: data.inverter_seq,
      target_id: data.target_id,
      target_name: data.target_name,
      in_a: '',
      in_v: '',
      in_w: '',
      in_kw: '',
      out_a: '',
      out_v: '',
      out_w: '',
      out_kw: '',
      p_f: '',
      d_wh: '',
      d_kwh: '',
      c_kwh: '',
      compare_efficiency: '',
      water_level: '',
      writedate: data.writedate,
      hasOperation: false
    };

    // if (true) {
    if (hasValidData) {
      addObj.in_a = data.in_a;
      addObj.in_v = data.in_v;
      addObj.in_w = data.in_w;
      addObj.in_kw = _.isNumber(data.in_w) ? calcValue(data.in_w, 0.001, 3) : '';
      addObj.out_a = data.out_a;
      addObj.out_v = data.out_v;
      addObj.out_w = data.out_w;
      addObj.out_kw = _.isNumber(data.out_w) ? calcValue(data.out_w, 0.001, 3) : '';
      addObj.p_f = data.p_f;
      addObj.d_wh = data.d_wh;
      addObj.compare_efficiency = data.compare_efficiency;
      addObj.water_level = data.water_level;
      addObj.d_kwh = _.isNumber(data.daily_power_wh) ? calcValue(data.daily_power_wh, 0.001, 3) : '';
      addObj.c_kwh = _.isNumber(data.c_wh) ? calcValue(data.c_wh, 0.001, 2) : '';
      addObj.hasOperation = true;
    }
    currInverterDataList.push(addObj);
  });
  // currInverterDataList = _.sortBy(currInverterDataList, 'target_name');
  // 인버터 실시간 데이터 테이블
  returnValue.dataList = currInverterDataList;
  returnValue.totalInfo.in_kw = calcValue(reduceDataList(currInverterDataList, 'in_kw'), 1, 3);
  returnValue.totalInfo.out_kw = calcValue(reduceDataList(currInverterDataList, 'out_kw'), 1, 3);
  returnValue.totalInfo.d_kwh = calcValue(reduceDataList(currInverterDataList, 'd_kwh'), 1, 3);
  returnValue.totalInfo.c_kwh = calcValue(reduceDataList(currInverterDataList, 'c_kwh'), 1, 3);

  return returnValue;
}
exports.refineSelectedInverterStatus = refineSelectedInverterStatus;



/**
 * Range에 맞는 차트 데이터 구성
 * @param {Object[]} rowDataPacketList 
 * @param {chartOption} chartOption 
 * @return {chartData}
 */
function makeDynamicChartData(rowDataPacketList, chartOption) {
  // BU.CLI(chartOption);
  const selectKey = chartOption.selectKey;
  const dateKey = chartOption.dateKey;
  const groupKey = chartOption.groupKey;
  const colorKey = chartOption.colorKey;
  const sortKey = chartOption.sortKey;
  const hasArea = chartOption.hasArea;

  // 반환 데이터 유형
  let returnValue = {
    range: _.sortBy(_.union(_.map(rowDataPacketList, dateKey))),
    series: []
  };

  // BU.CLI(returnValue.range);
  // 같은 Key 끼리 그루핑
  if (groupKey) {
    let groupDataList = _.groupBy(rowDataPacketList, groupKey);
    returnValue.series = [];
    _.forEach(groupDataList, (groupObj, gKey) => {
      let addObj = {
        name: gKey,
        data: []
      };

      if(hasArea) {
        addObj.type = 'area';
      }

      let dataRow =  _.head(groupObj);
      if(colorKey){
        addObj.color = dataRow[chartOption.colorKey];
      }
      if(sortKey){
        addObj.sort = dataRow[chartOption.sortKey];
      }

      _.forEach(groupObj, gInfo => {
        let index = _.indexOf(returnValue.range, gInfo[dateKey]);
        addObj.data[index] = gInfo[selectKey];
      });
      returnValue.series.push(addObj);
    });

    if(sortKey){
      returnValue.series = _.sortBy(returnValue.series, obj => obj.sort );
    } else {
      returnValue.series = _.sortBy(returnValue.series, obj => obj.name );
    }
  } else {  
    let addObj = {
      name: '',
      data: []
    };

    if(hasArea) {
      addObj.type = 'area';
    }

    addObj.data = _(rowDataPacketList).groupBy(dateKey).toPairs().sortBy().map(currentItem => _.nth(currentItem, 1)).map(dataPacket => _.sum(_.map(dataPacket, selectKey))).value();
    returnValue.series.push(addObj);
  }
  return returnValue;
}
exports.makeDynamicChartData = makeDynamicChartData;




/**
 * 차트 데이터
 * @param {Object[]} rowDataPacketList 
 * @param {{fullTxtPoint: [], shortTxtPoint: []}} baseRange 고정된 Column 객체
 * @param {chartOption} chartOption 
 * @return {chartData}
 */
function makeStaticChartData(rowDataPacketList, baseRange, chartOption) {
  const selectKey = chartOption.selectKey;
  const dateKey = chartOption.dateKey;
  const groupKey = chartOption.groupKey;
  const colorKey = chartOption.colorKey;
  const sortKey = chartOption.sortKey;
  
  // 반환 데이터 유형
  /** @type {chartData} */
  let returnValue = {
    range: baseRange.shortTxtPoint,
    series: []
  };

  // 색상키가 정해져있찌 않다면 색상 없이 반환
  // 같은 Key 끼리 그루핑
  if (groupKey) {
    let groupedRowPacketDataList = _.groupBy(rowDataPacketList, groupKey);

    returnValue.series = [];
    _.forEach(groupedRowPacketDataList, (groupObj, gKey) => {
      /** @type {chartSeries} */
      let addObj = {
        name: gKey,
        data: [],
        option: {}
      };

      let dataRow =  _.head(groupObj);
      // 색상 키가 있다면 입력
      if(colorKey){
        addObj.color = dataRow[colorKey];
      }

      addObj.option = calcStatisticsReport(groupObj, chartOption);


      baseRange.fullTxtPoint.forEach(fullTxtDate => {
        let resultFind = _.find(groupObj, {
          [dateKey]: fullTxtDate
        });

        // BU.CLI(findGridObj)
        let data = _.isEmpty(resultFind) ? '' : resultFind[selectKey];
        addObj.data.push(data);
      });
      returnValue.series.push(addObj);
    });

    if(sortKey){
      returnValue.series = _.sortBy(returnValue.series, obj => obj.option.sort );
    } else {
      returnValue.series = _.sortBy(returnValue.series, obj => obj.name );
    }
  } else {

    let addObj = {
      name: '',
      data: [],
      option: calcStatisticsReport(rowDataPacketList, chartOption)
    };

    baseRange.fullTxtPoint.forEach(fullTxtDate => {
      let resultFind = _.find(rowDataPacketList, {
        [dateKey]: fullTxtDate
      });

        // BU.CLI(findGridObj)
      let data = _.isEmpty(resultFind) ? '' : resultFind[selectKey];
      addObj.data.push(data);
    });


    returnValue.series.push(addObj);
  }
  // BU.CLI(returnValue);
  return returnValue;
}
exports.makeStaticChartData = makeStaticChartData;


/**
 * 차트 데이터 레포트 통계치 계산
 * @param {Object[]} rowDataPacketList 
 * @param {chartOption} chartOption 
 * @return {chartDataOption}
 */
function calcStatisticsReport(rowDataPacketList, chartOption){
  /** @type {chartDataOption} */
  const returnValue = {};
  const sortKey = chartOption.sortKey;
  const maxKey = chartOption.maxKey;
  const minKey = chartOption.minKey;
  const averKey = chartOption.averKey;

  let dataRow =  _.head(rowDataPacketList);

  // 데이터가 없다면 빈 객체 반환
  if(_.isEmpty(dataRow)){
    return returnValue;
  }

  // 정렬 우선 순위가 있다면 입력
  if(sortKey){
    returnValue.sort = dataRow[sortKey];
  }
  // 최대 값을 구한다면
  if(maxKey){
    let row = _.maxBy(rowDataPacketList, rowPacket => rowPacket[maxKey]);
    returnValue.max = row[maxKey];
  }
  // 최소 값을 구한다면
  if(minKey){
    let row = _.minBy(rowDataPacketList, rowPacket => rowPacket[minKey]);
    returnValue.min = row[minKey];
  }
  // TODO 
  if(averKey){
    returnValue.aver = 0;
    let sum = reduceDataList(rowDataPacketList, averKey);
    if(_.isNumber(sum)){
      returnValue.aver = sum / rowDataPacketList.length;
    } 
    returnValue.aver = 0;
  }

  return returnValue;
}



/**
 * 검색 조건 (year, month, day)에 따라서 비율을 변환하여 반환
 * @param {number} number 
 * @param {string} searchType 
 */
function convertValueBySearchType(number, searchType) {
  // BU.CLI('convertValueBySearchType', searchType, number)
  let returnValue = 0;
  if(_.isNumber(number)){
    switch (searchType) {
    case 'year':
      returnValue = _.round(number / 1000 / 1000, 4);
      break;
    case 'month':
    case 'day':
      returnValue = _.round(number / 1000, 3);
      break;
    case 'hour':
    default:
      returnValue = number;
      break;
    }
    return Number(returnValue);
  } else {
    return '';
  }
}
exports.convertValueBySearchType = convertValueBySearchType;

/**
 * 차트 데이터 검색 조건에 따라서 데이터 비율 적용
 * @param {chartData} chartData 차트 데이터
 * @param {string} searchType 검색 타입 year, month, day, hour
 */
function applyScaleChart(chartData, searchType) {
  // BU.CLI(searchType);
  chartData.series.forEach(chart => {
    if(chart.option){
      let option = chart.option;
      if(option.max){
        option.max =  _.isNumber(option.max) ? convertValueBySearchType(option.max, searchType) : '';
      }
      if(option.min){
        option.min =  _.isNumber(option.min) ? convertValueBySearchType(option.min, searchType) : '';
      }
      if(option.aver){
        option.aver =  _.isNumber(option.aver) ? convertValueBySearchType(option.aver, searchType) : '';
      }
    }
    chart.data.forEach((data, index) => {
      // BU.CLI(data);
      chart.data[index] = _.isNumber(data) ? convertValueBySearchType(data, searchType) : '';
    });
  });
  return chartData;
}
exports.applyScaleChart = applyScaleChart;

/**
 * 차트를 생성하는데 필요한 부가적인 정보 생성
 * @param {searchRange} searchRange 검색 옵션
 * @return {{mainTitle: string, xAxisTitle: string, yAxisTitle: string, inverterComment: string, connectorComment: string}} x, y, title Text
 */
function makeChartDecorator(searchRange) {
  let mainTitle = '';
  let xAxisTitle = '';
  let yAxisTitle = '';
  let inverterComment = '';
  let connectorComment = '';
  switch (searchRange.searchType) {
  case 'year':
    xAxisTitle = '시간(년)';
    yAxisTitle = '발전량(MWh)';
    inverterComment = '1년 동안의 발전량(MWh)';
    connectorComment = '1년 동안의 평균 출력의 출력(MWh)';
    break;
  case 'month':
    xAxisTitle = '시간(월)';
    yAxisTitle = '발전량(kWh)';
    inverterComment = '1개월 동안의 발전량(kWh)';
    connectorComment = '1개월 동안 시간당 평균 출력의 합(kW)';
    break;
  case 'day':
    xAxisTitle = '시간(일)';
    yAxisTitle = '발전량(kWh)';
    inverterComment = '1일 동안의 발전량(kWh)';
    connectorComment = '1일 동안 시간당 평균 출력(kW)의 합';
    break;
  case 'hour':
    xAxisTitle = '시간';
    yAxisTitle = '발전량(Wh)';
    inverterComment = '1시간 동안의 발전량(Wh)';
    connectorComment = '1시간 동안의 평균 출력(W)';
    break;
  case 'min10':
    xAxisTitle = '시간';
    yAxisTitle = '발전량(Wh)';
    inverterComment = '10분 동안의 발전량(Wh)';
    connectorComment = '10분 동안의 평균 출력(W)';
    break;
  case 'min':
    xAxisTitle = '시간';
    yAxisTitle = '발전량(Wh)';
    inverterComment = '1분 동안의 발전량(Wh)';
    connectorComment = '1분 동안의 평균 출력(W)';
    break;    
  default:
    break;
  }

  if (searchRange.rangeEnd !== '') {
    mainTitle = `[ ${searchRange.rangeStart} ~ ${searchRange.rangeEnd} ]`;
  } else {
    mainTitle = `[ ${searchRange.rangeStart} ]`;
  }
  return {
    mainTitle,
    xAxisTitle,
    yAxisTitle,
    inverterComment,
    connectorComment
  };
}
exports.makeChartDecoration = makeChartDecorator;

/**
 * 차트 name을 의미있는 이름으로 변환
 * @param {chartData} chartData makeChartData 결과물
 * @param {Array.<{}>|string} mappingTarget Mapping 할 대상 데이터. 강제로 이름을 지정하고자 할 경우에 string
 * @param {string} matchingKey matchingKey
 * @param {string} mappingKey matchingKey
 * @return {chartData} Name 처리 한 후 반환
 */
function mappingChartDataName(chartData, mappingTarget, matchingKey, mappingKey, hasSort) {
  // BU.CLIS(mappingTarget, matchingKey);
  chartData.series.forEach(chart => {
    let chartKey = chart.name;
    if (_.isArray(mappingTarget)) {
      let findObj = _.find(mappingTarget, {
        [matchingKey]: Number(chartKey)
      });
      if (_.isEmpty(findObj)) {
        findObj = _.find(mappingTarget, {
          [matchingKey]: chartKey
        });
      }
      chart.name = _.isEmpty(findObj) ? chart.name : findObj[mappingKey];
    } else if (_.isString(mappingTarget)) {
      chart.name = mappingTarget;
    }
  });
  // Name을 새로이 입력했으므로 이름순으로 정렬
  chartData.series = hasSort ? _.sortBy(chartData.series, 'name') : chartData.series;

  return chartData;
}
exports.mappingChartDataName = mappingChartDataName;

/**
 * 모듈 차트 name을 의미있는 이름으로 변환
 * @param {chartData} chartData makeChartData 결과물
 * @param {Array.<{}>|string} mappingTarget Mapping 할 대상 데이터. 강제로 이름을 지정하고자 할 경우에 string
 * @param {string} matchingKey matchingKey
 * @param {string} mappingKey matchingKey
 * @return {chartData} Name 처리 한 후 반환
 */
function mappingChartDataNameForModule(chartData, mappingTarget) {
  chartData.series.forEach(chart => {
    let upsasInfo = _.find(mappingTarget, {
      photovoltaic_seq: Number(chart.name)
    });
    chart.name = `${upsasInfo.cnt_target_name} ${upsasInfo.pv_target_name} (${upsasInfo.pv_module_type.slice(0,1)})`;
    // chart.name = upsasInfo.ivt_target_name;
  });
  chartData.series = _.sortBy(chartData.series, 'ivt_target_name');
  return chartData;
}
exports.mappingChartDataNameForModule = mappingChartDataNameForModule;


/**
 * DB 긁어온 내용에 key 추가
 * @param {Object[]} sourceList 
 * @param {Object[]} referenceList 
 * @param {string} addKey 
 * @param {string} referenceKey 
 */
function addKeyToReport(sourceList, referenceList, addKey, referenceKey){
  // BU.CLIS(sourceList, referenceList);
  sourceList.forEach(currentItem => {
    const findIt = _.find(referenceList, {[referenceKey]: currentItem[referenceKey]});

    currentItem[addKey] = _.isEmpty(findIt) ? '' : findIt[addKey]; 
  });

  return sourceList;

}
exports.addKeyToReport = addKeyToReport;


// /**
//  * Range에 맞는 차트 데이터 구성
//  * @param {Object[]} rowDataPacketList 
//  * @param {string} dataKey Chart에 표현할 Key
//  * @param {string} outputKey 추가할 output Key
//  * @param {string} groupKey rowDataPacketList를 Group 처리 할 Key
//  * @param {string} sortKey 
//  * @return {Object[]} outputKey 가 추가된 rowDataPacketList
//  */
// function calcDailyPower(rowDataPacketList, groupKey, dataKey, outputKey, sortKey) {
//   // 그룹을 지어 계산할 거라면
//   if(groupKey){
//     const group = _.groupBy(rowDataPacketList, groupKey);
//     BU.CLI(group);
//     _.each(group, (list, key) => {
      
//       let reverseList = (_.sortBy(list, ele => {
//         return ele[sortKey];
//       })).reverse();

//       _.reduce(reverseList, (prev, next) => {
        
//       });

//       BU.CLI(reverseList);
//     });
//     // BU.CLI(group);
//   } else {

//   }

// }
// exports.calcDailyPower = calcDailyPower;


// if (groupKey === '' || groupKey === undefined) {
//   let addObj = {
//     name: '',
//     data: []
//   };

//   addObj.data = _.map(_.groupBy(rowDataPacketList, rangeKey), dataList => {
//     return reduceDataList(dataList, dataKey);
//   });

//   returnValue.series.push(addObj);
// } else {
//   // 같은 Key 끼리 그루핑
//   let groupDataList = _.groupBy(rowDataPacketList, groupKey);

//   returnValue.series = _.map(groupDataList, (groupObj, gKey) => {
//     let addObj = {
//       name: gKey,
//       data: []
//     };
//     _.each(groupObj, gInfo => {
//       let index = _.indexOf(returnValue.range, gInfo[rangeKey]);
//       addObj.data[index] = gInfo[dataKey];
//     });
//     return addObj;
//   });
// }