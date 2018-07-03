const bmjh = require('base-model-jh');
const BU = require('base-util-jh').baseUtil;
const _ = require('lodash');
const Promise = require('bluebird');

class Auth extends bmjh.BM {
  constructor(dbInfo) {
    super(dbInfo);

  }

  /**
   * 회원 정보 추가
   * @param {MEMBER} memberInfo 
   */
  async setMember(memberInfo) {
    memberInfo.password_temp = memberInfo.password;
    const salt = BU.genCryptoRandomByte(16);
    const encryptPbkdf2 = Promise.promisify(BU.encryptPbkdf2);
    const hashPassword = await encryptPbkdf2(memberInfo.password, salt);

    memberInfo.password = hashPassword;

    this.setTable('MEMBER', memberInfo);
  }

  /**
   * 
   * @param {string} userId 
   * @param {string} password 
   */
  getMember(userId, password) {
    var sql = `SELECT * FROM MEMBER WHERE 
    id = '${userId}' AND password = '${password}'
    `;
    return this.db.single(sql);
  }

  /**
   * 
   * @param {string} userid 
   * @param {string} password 
   */
  async getAuthMember(userid, password) {
    let memberList = await this.getMemberById(userid, password);

    if(!memberList.length){
      throw new Error('매칭되는 회원이 없습니다.');
    } 
    // 회원 정보
    let memberInfo = _.head(memberList);

    const encryptPbkdf2 = Promise.promisify(BU.encryptPbkdf2);

    return await encryptPbkdf2(password, memberInfo.salt);
  }

  /**
   * @param {string} userId 
   */
  async getMemberById(userId){
    let sql = `SELECT * FROM MEMBER WHERE id = ${userId}`;
    return this.db.single(sql);
  }


}

module.exports = Auth;