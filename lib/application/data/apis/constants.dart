class APIPoly {
  /// Host
  /// https://h5.hyobygx.com/api/v1/promotions/promotionsList
  static const String apiHost = "https://h5.hyobygx.com/";

  /// 版本
  static const String apiVersion = "api/v1/";

  /// 支付模块的版本
  static const String paymentVersion = "payment/v1/";

  /// 登录
  static const String login = "user/login";

  /// 手机号登录
  static const String phonelogin = "user/loginByMobile";

  /// 优惠列表
  static const String promotionsList = "promotions/promotionsList";

  /// 用户信息
  static const String userDetail = "user/userProfile";

  /// 用户信息
  static const String updateUserProfile = "user/updateUserProfile";

  /// 全局配置参数
  static const String appConfig = "home/init";

  /// 首页数据
  static const String homeIndex = "home/index";

  /// 短信验证码
  static const String smsCode = "user/sendSmsCode";

  /// 注册
  static const String signup = "user/create";

  /// 玩家通知信息
  static const String messages = "home/notice";

  /// 玩家通知信息
  static const String deleteMsg = "home/delNotice";

  /// 平台列表
  static const String platList = "platform/platList";

  /// 平台余额
  static const String platYue = "platform/queryBalance";

  ///修改密码
  static const String resetPass = "user/resetPassword";

  ///修改密码
  static const String changePassword = "user/changePassword";

  ///钱包-卡片管理-银行列表
  static const String bankInfoList = "wallet/bankInfoList";

  ///钱包-卡片管理-用户银行卡列表
  static const String userBankList = "wallet/userBankList";

  ///修改手机号
  static const String resetMobile = "user/resetMobile";

  ///钱包-交易记录-列表查询
  static const String transactionList = "wallet/transactionList";

  /// 存款模式列表
  static const String payList = "pay/list";

  /// 线下支付
  static const String payOffline = "pay/offlinePay";

  /// 线上支付
  static const String payOnline = "pay/onlinePay";

  /// 一键回收
  static const String coinDownBatch = "platform/coinDownBatch";

  /// 取款页面银行卡列表
  static const String withdrawBankList = "wallet/userBankList";

  /// 取款
  static const String withdrawalAdd = "wallet/withdrawalAdd";

  /// 钱包-卡片管理-添加用户银行卡
  static const String bankAdd = "wallet/bankAdd";

  ///登出
  static const String logout = "user/logout";

  ///转账
  static const String coinTransfer = "platform/coinTransfer";

  ///vip会员成长
  static const String levelList = "promotions/levelList";

  ///vip全场返水
  static const String levelRebateList = "promotions/levelRebateList";

  ///游戏列表
  static const String gameList = "platform/gameList";

  ///根据游戏ID查询投注列表
  static const String getBetListByDate = "platform/getBetListByDate";

  ///意见反馈-问题类型列表
  static const String listCategory = "feedback/listCategory";

  ///意见反馈-提交反馈
  static const String addFeedback = "feedback/addFeedback";
}
