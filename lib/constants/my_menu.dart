class MyMenu {
  String id;
  String name;
  final icon;
  String page;

  static String BBS = 'BBS';
  static String HISTORY = 'HISTORY';
  static String FRIEND = 'FRIEND';
  static String FAVORITE = 'FAVORITE';
  static String DISCUSS = 'DISCUSS';

  MyMenu(
      {required this.id,
      required this.name,
      required this.icon,
      required this.page});

  static List<MyMenu> buildUsefulMenus() {
    return [
      MyMenu(id: BBS, name: '帖子', icon: 'my_bbs.png', page: ''),
      MyMenu(id: HISTORY, name: '历史', icon: 'my_history.png', page: ''),
      MyMenu(id: HISTORY, name: '朋友', icon: 'my_friend.png', page: ''),
      MyMenu(id: FAVORITE, name: '收藏', icon: 'my_favorite.png', page: ''),
      MyMenu(id: DISCUSS, name: '评论', icon: 'my_discuss.png', page: ''),
    ];
  }

  static String ACCOUNT_SAFE = 'ACCOUNT_SAFE';
  static String ABOUT = 'ABOUT';
  static String FEEDBACK = 'FEEDBACK';
  static String US = 'US';
  static String VERSION = 'VERSION';
  static String PERMISSION = 'PERMISSION';

  static List<MyMenu> buildUselessMenus() {
    return [
      MyMenu(
          id: ACCOUNT_SAFE,
          name: '账号与安全',
          icon: 'my_account_safe.png',
          page: ''),
      MyMenu(id: PERMISSION, name: '权限管理', icon: 'my_permission.png', page: ''),
      MyMenu(id: FEEDBACK, name: '意见反馈', icon: 'my_feedback.png', page: ''),
      MyMenu(id: VERSION, name: '版本更新', icon: 'my_version.png', page: ''),
      MyMenu(id: ABOUT, name: '关于我们', icon: 'my_about.png', page: ''),
      MyMenu(id: US, name: '合作与生态', icon: 'my_us.png', page: ''),
    ];
  }
}
