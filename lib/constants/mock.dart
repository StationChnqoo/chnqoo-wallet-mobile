class Mock {
  late String id;

  Mock() {}

  dynamic initUser() {
    return {
      "id": "",
      "idQoo": "登录后才能拥有 ~",
      "idCard": "",
      "mobile": "",
      "email": "",
      "smsCode": "",
      "smsTime": "",
      "name": "",
      "nickname": "请登录 ~",
      "password": "",
      "avatar": "",
      "motto": "",
      "linkQq": "",
      "linkWechat": "",
      "isDeleted": false,
      "createTime": "",
      "updateTime": ""
    };
  }

  List<Map<String, dynamic>> initTrucks() {
    return [
      {
        "id": "",
        "name": "跑腿",
        "src":
            "https://oimg.huolala.cn/ops/resource/20230329174747-00d1-67636679.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20230710/1001cce1ff1083904526b5042b495fadfb9a.png",
        "size": [
          {"name": "载重", "unit": "公斤", "min": 0, "max": 20, "id": ""}
        ],
        "scene": ["配送", "20公斤", "以内小件"]
      },
      {
        "id": "",
        "name": "微面",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201165721-00d1-51998230.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/1001ee00a94b7ba44928b55725a7cbd9dd59.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 1.4, "max": 1.7, "id": ""},
          {"name": "载方", "unit": "方", "min": 1.7, "max": 2.4, "id": ""},
          {"name": "载重", "unit": "吨", "min": 0.3, "max": 0.5, "id": ""},
          {"name": "车高", "unit": "米", "min": 1.6, "max": 1.8, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.2, "max": 1.5, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1, "max": 1.2, "id": ""}
        ],
        "scene": ["运输", "1~2件", "小型家电/家具"]
      },
      {
        "id": "",
        "name": "小面",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201165750-00d1-81265230.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10016a1748ccbb75457f82eb24445de1ecec.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 1.8, "max": 2.4, "id": ""},
          {"name": "载方", "unit": "方", "min": 2.4, "max": 4, "id": ""},
          {"name": "载重", "unit": "吨", "min": 0.5, "max": 0.8, "id": ""},
          {"name": "车高", "unit": "米", "min": 1.7, "max": 2, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.2, "max": 1.5, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.1, "max": 1.4, "id": ""}
        ],
        "scene": ["运输", "1~2件", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "中面",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201165850-00d1-30559506.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/1001cfa4f82023e84aee81cd885a5c3ddcd7.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 2.4, "max": 3.2, "id": ""},
          {"name": "载方", "unit": "方", "min": 3.7, "max": 6.1, "id": ""},
          {"name": "载重", "unit": "吨", "min": 0.8, "max": 1.2, "id": ""},
          {"name": "车高", "unit": "米", "min": 1.9, "max": 2.3, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.3, "max": 1.6, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.2, "max": 1.5, "id": ""}
        ],
        "scene": ["运输", "2~3件", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "依维柯",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201165928-00d1-89238663.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/1001e89a1b963779437180cb078f29e0a558.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 2.4, "max": 3.2, "id": ""},
          {"name": "载方", "unit": "方", "min": 6.1, "max": 9.2, "id": ""},
          {"name": "载重", "unit": "吨", "min": 1, "max": 1.5, "id": ""},
          {"name": "车高", "unit": "米", "min": 2.2, "max": 2.6, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.7, "max": 1.9, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.5, "max": 1.9, "id": ""}
        ],
        "scene": ["运输", "2~3件", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "微货",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201170713-00d1-25548.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10018e6e964cfc1d40cfafc5b3056b7bb292.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 2, "max": 2.9, "id": ""},
          {"name": "载方", "unit": "方", "min": 4.2, "max": 6.7, "id": ""},
          {"name": "载重", "unit": "吨", "min": 0.8, "max": 1.2, "id": ""},
          {"name": "车高", "unit": "米", "min": 1.8, "max": 2.6, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.4, "max": 1.7, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.5, "max": 1.7, "id": ""}
        ],
        "scene": ["运输", "2~3件", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "小货",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201171112-00d1-51572245.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10013b2cd5876da34434b7f61b03bdae1d68.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 2, "max": 3.7, "id": ""},
          {"name": "载方", "unit": "方", "min": 4.2, "max": 9.6, "id": ""},
          {"name": "载重", "unit": "吨", "min": 1, "max": 1.5, "id": ""},
          {"name": "车高", "unit": "米", "min": 2.2, "max": 2.8, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.4, "max": 1.8, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.5, "max": 1.8, "id": ""}
        ],
        "scene": ["运输", "6~8件", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "中货",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201171251-00d1-44300491.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/100113bd69a5eb6641c5b9d0495c2b3a3ae3.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 3.8, "max": 4.3, "id": ""},
          {"name": "载方", "unit": "方", "min": 12.3, "max": 19.8, "id": ""},
          {"name": "载重", "unit": "吨", "min": 1.5, "max": 2, "id": ""},
          {"name": "车高", "unit": "米", "min": 2.9, "max": 3.5, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 1.8, "max": 2.4, "id": ""},
          {"name": "厢高", "unit": "米", "min": 1.8, "max": 2.4, "id": ""}
        ],
        "scene": ["运输", "15件以内", "大件家电/家具"]
      },
      {
        "id": "",
        "name": "5米2",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201172101-00d1-77471775.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/1001efe61e46fb274ebcb3c81fffe9d1475e.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 5, "max": 6.2, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.1, "max": 2.2, "id": ""},
          {"name": "载方", "unit": "方", "min": 21, "max": 28.6, "id": ""},
          {"name": "载重", "unit": "吨", "min": 2, "max": 6, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2, "max": 2.1, "id": ""},
          {"name": "车高", "unit": "米", "min": 2.3, "max": 3.6, "id": ""}
        ],
        "scene": ["", "", ""]
      },
      {
        "id": "",
        "name": "6米8",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201173207-00d1-41848570.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10011fd9a77e7a394784a8a6204a3772f32c.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 6.4, "max": 7.2, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.3, "max": 2.4, "id": ""},
          {"name": "载方", "unit": "方", "min": 35.3, "max": 43.2, "id": ""},
          {"name": "载重", "unit": "吨", "min": 6, "max": 10, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2.4, "max": 2.5, "id": ""},
          {"name": "车高", "unit": "米", "min": 2.8, "max": 4, "id": ""}
        ],
        "scene": ["", "", ""]
      },
      {
        "id": "",
        "name": "7米6",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201173207-00d1-41848570.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/1001c2cc908dc3714e13917b6f6ffeef9ae1.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 7.3, "max": 7.8, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.3, "max": 2.4, "id": ""},
          {"name": "载方", "unit": "方", "min": 42, "max": 48.7, "id": ""},
          {"name": "载重", "unit": "吨", "min": 8, "max": 12, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2.5, "max": 2.6, "id": ""},
          {"name": "车高", "unit": "米", "min": 3, "max": 4, "id": ""}
        ],
        "scene": ["", "", ""]
      },
      {
        "id": "",
        "name": "9米6",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201173545-00d1-29763897.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10016ae36308751f4cbdb3f390d21b67f457.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 9, "max": 9.8, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.3, "max": 2.4, "id": ""},
          {"name": "载方", "unit": "方", "min": 51.8, "max": 61.2, "id": ""},
          {"name": "载重", "unit": "吨", "min": 10, "max": 18, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2.5, "max": 2.6, "id": ""},
          {"name": "车高", "unit": "米", "min": 3.9, "max": 4, "id": ""}
        ],
        "scene": ["", "", ""]
      },
      {
        "id": "",
        "name": "13米",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201173745-00d1-79447887.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240221/1001831408fa68ad44d79380dbede6da2696.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 11.7, "max": 13, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.3, "max": 2.4, "id": ""},
          {"name": "载方", "unit": "方", "min": 67.3, "max": 81.1, "id": ""},
          {"name": "载重", "unit": "吨", "min": 18, "max": 32, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2.5, "max": 2.6, "id": ""},
          {"name": "车高", "unit": "米", "min": 3.6, "max": 4, "id": ""}
        ],
        "scene": ["", "", ""]
      },
      {
        "id": "",
        "name": "17米5",
        "src":
            "https://oimg.huolala.cn/ops/resource/20240201173915-00d1-10896921.png",
        "srcWithSize":
            "https://luna-cdn-public.huolala.cn/luna-public/bfe-uadmin-api/bfeUadmin/20240202/10012b62ec87d38e46ad858f116a9f5cd36f.png",
        "size": [
          {"name": "厢长", "unit": "米", "min": 16, "max": 17.5, "id": ""},
          {"name": "厢宽", "unit": "米", "min": 2.5, "max": 2.8, "id": ""},
          {"name": "载方", "unit": "方", "min": 100, "max": 137.2, "id": ""},
          {"name": "载重", "unit": "吨", "min": 25, "max": 35, "id": ""},
          {"name": "厢高", "unit": "米", "min": 2.5, "max": 2.8, "id": ""},
          {"name": "车高", "unit": "米", "min": 3.9, "max": 4, "id": ""}
        ],
        "scene": ["", "", ""]
      }
    ];
  }

  dynamic initBingWallPaper() {
    return {
      "date": "2023-08-19",
      'headline': "我准备好拍特写了，松鼠先生",
      'title': "看着相机镜头的松鼠",
      'description':
          "1839年的8月19日，法国画家达盖尔公布了其发明的达盖尔摄影法，即银版摄影法，这被认为是最早的具有实用价值的摄影法。因此每年的8月19日被定位世界摄影日。摄影的世界是广阔的，专业人士和业余爱好者所涉足的摄影主题和风格也是多种多样的。无论是抽象还是时尚，抑或是风景和野生动物，都可以成为摄影的主题。图上这只厚脸皮的松鼠就是一个例子。尽管随着数码相机和智能手机的问世，达盖尔摄影法之类的老式摄影法早已过时，但却仍有一些摄影师还在竭力保持老式摄影的魅力和艺术性。",
      'image_url':
          "https://cn.bing.com/th?id=OHR.CameraSquirrel_ZH-CN3580119980_1920x1080.webp",
      'main_text': "世界上第一张照片是由法国科学家约瑟夫·尼塞福尔·涅普斯在1826年拍摄出来的。"
    };
  }

  testGetUserId() {}
}
