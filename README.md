## 关于本项目
本项目旨在对 B 站 WEB、APP、TV 等客户端中，散落在世界各地的野生 API 进行收集整理，研究使用方法并对其进行说明，运用了黑箱法、控制变量法、代码逆向分析、拆包及反编译法、网络抓包法等研究办法

本文档探讨的对象是主站业务接口，[官方开放平台](https://openhome.bilibili.com/doc) 和 [直播开放平台](https://open-live.bilibili.com/document/) 均不属于本项目范畴，请移步

B站 API 采用 C/S 结构，大多数接口为 REST API 和 gRPC，少部分接口为 WebSocket；REST API 接口请求数据大多为 url query 表单或 JSON，返回数据大多为 JSON 或 Protobuf，强制使用 https 协议

📖阅读地址：[Github Pages](https://socialsisteryi.github.io/bilibili-API-collect/)

小小的 Demo：~~av583785685~~ [视频失效原因](https://shakaianee.top/archives/56/) ([Youtube 备链](https://www.youtube.com/watch?v=nfF91Z6fqGk))

::: warning 声明

1. 本项目遵守 CC-BY-NC 4.0 协议，禁止一切商业使用，如需转载请注明作者 ID
2. **请勿滥用，本项目仅用于学习和测试！请勿滥用，本项目仅用于学习和测试！请勿滥用，本项目仅用于学习和测试！**
3. 利用本项目提供的接口、文档等造成不良影响及后果与本人无关
4. 由于本项目的特殊性，可能随时停止开发或删档
5. 本项目为开源项目，不接受任何形式的催单和索取行为，更不容许存在付费内容
6. **上传任何信息时请注意脱敏，删去账户密码、敏感 cookies 等可能泄漏个人信息的数据（例如 `SESSDATA`、`bili_jct` 之类的 cookies）**

:::

## ⚠️仓库声明（个人重构）

1. 本仓库是我个人基于原项目进行的重构与整理；若涉及侵权或其他权利争议，将按要求删除本仓库及相关内容。
2. 本仓库仅限个人学习与技术研究使用，严禁用于任何商业用途或违法用途。
3. 本仓库重构接口文档以 `Rebuild-Api-Docs/**` 为准，原始文档仅作参考。

## 🧭当前仓库定位（企业级重构模式）

本仓库已进入“归档 + 规范化重构”并行维护阶段：

1. `docs/**` 作为历史原始文档层，仅用于参考，不直接覆盖。
2. `Rebuild-Api-Docs/**` 作为企业级重构产物层，默认输出 OpenAPI JSON。
3. 批次任务必须受 `AGENTS.md` 约束，并以 `TODO.md` 为唯一任务进度源。

为避免上下文偏差，开始任何重构任务前请先阅读：

- `AGENTS.md`（执行硬规则）
- `TODO.md`（待办与完成状态）
- `tests/validate-rebuild-docs.ps1`（结构校验规则）
- `tests/test-rebuild-apis.ps1`（接口实测规则）

## 🗂️重构目录约定

- `docs/**`：原始接口文档（输入源）
- `Rebuild-Api-Docs/**`：重构后文档（输出层）
- `Template/template.json`：重构模板（生成前必须读取；如缺失需先补齐，否则校验脚本会失败）
- `TODO.md`：批次任务清单与勾选状态
- `tests/validate-rebuild-docs.ps1`：OpenAPI 结构校验脚本
- `tests/test-rebuild-apis.ps1`：接口请求测试脚本
- `Aengt-Report/**`：批次执行报告与测试报告

## 🔄标准批次流程（建议直接照做）

1. 读取 `TODO.md`，仅选择 `[ ]` 条目。
2. 计算本批次文件数量（遵守 `AGENTS.md` 的 `<=10` 与 token 分档策略）。
3. 建立映射：`docs/a/b.md -> Rebuild-Api-Docs/a/b.json`。
4. 先读取 `Template/template.json`，再按模板生成目标 JSON。
5. 参数、描述、示例必须来自对应 `docs/*.md`，禁止凭空编造。
6. 写入后运行结构校验与 API 实测。
7. 校验通过后更新 `TODO.md` 勾选状态。
8. 产出 `Aengt-Report/<YYYY-MM-DD_HHmm>.md` 执行报告（40 行以内）。

## ✅本地校验与测试

```powershell
powershell -ExecutionPolicy Bypass -File tests/validate-rebuild-docs.ps1
powershell -ExecutionPolicy Bypass -File tests/test-rebuild-apis.ps1
```

仅测试指定文档批次时：

```powershell
powershell -ExecutionPolicy Bypass -File tests/validate-rebuild-docs.ps1 -BatchFiles @('docs/search/hot.md')
powershell -ExecutionPolicy Bypass -File tests/test-rebuild-apis.ps1 -BatchFiles @('docs/search/hot.md')
```

## 🛠️文档站本地运行

```bash
npm install
npm run dev
npm run build
```

## 🧾重构产物最低要求（OpenAPI JSON）

- 顶层字段：`openapi`、`info`、`servers`、`components`、`paths`
- 元数据字段：`x-source-doc`、`x-template-file`、`x-test-base-url`
- operation 必备：参数声明、`responses.200` 成功示例、至少一个非 2xx 错误响应
- operation 扩展：`x-original-url`、`x-test-request`
- 编码：UTF-8

## 🧱已重构接口（Rebuild-Api-Docs）

当前已完成并落盘的重构接口文件：

- `Rebuild-Api-Docs/search/hot.json`
- `Rebuild-Api-Docs/search/search_request.json`
- `Rebuild-Api-Docs/search/suggest.json`

对应原始文档：

- `docs/search/hot.md -> Rebuild-Api-Docs/search/hot.json`
- `docs/search/search_request.md -> Rebuild-Api-Docs/search/search_request.json`
- `docs/search/suggest.md -> Rebuild-Api-Docs/search/suggest.json`

## 🍴目录

计划整理分类 & 目录：(文档已完结请选中 checkbox)

- [ ] [接口签名与验证](docs/misc/sign)
    - [x] [APP API 签名](docs/misc/sign/APP.md)（`appkey` 与 `sign`）
    - [x] [已知的 APPKey](docs/misc/sign/APPKey.md)
    - [x] [Wbi 签名](docs/misc/sign/wbi.md)（`wts`与`w_rid`）
    - [ ] [bili_ticket](docs/misc/sign/bili_ticket.md)
    - [ ] [v_voucher 验证](docs/misc/sign/v_voucher.md)
- [ ] [杂项](docs/misc)
    - [x] [获取当前时间戳](docs/misc/time_stamp.md)
    - [x] [公共错误码](docs/misc/errcode.md)
    - [x] [图片格式化](docs/misc/picture.md)
    - [x] [表达式渲染](docs/misc/mathjax.md)
    - [x] [bvid 说明](docs/misc/bvid_desc.md)
    - [ ] [设备唯一标识 BUVID](docs/misc/device_identity.md)
    - [ ] [获取 buvid3 / buvid4 / b_nut](docs/misc/buvid3_4.md)
    - [ ] [b23.tv 短链](docs/misc/b23tv.md)
- [ ] [gRPC API 接口定义](grpc_api)
- [ ] [登录](docs/login)
    - [x] [登录操作 (人机认证)](docs/login/login_action)
        - [x] [短信登录](docs/login/login_action/SMS.md)
        - [x] [密码登录](docs/login/login_action/password.md)
        - [x] [二维码登录](docs/login/login_action/QR.md)
        - [ ] SNS 登录 (QQ & 微信 & 微博)
    - [x] [登录基本信息](docs/login/login_info.md)
    - [ ] [个人中心](docs/login/member_center.md)
    - [ ] [注销登录](docs/login/exit.md)
    - [x] [登录记录](docs/login/login_notice.md)
    - [x] [Web 端 Cookie 刷新](docs/login/cookie_refresh.md)
- [ ] [消息中心](docs/message)
    - [ ] [通知类消息](docs/message/msg.md)
    - [x] [私信](docs/message/private_msg.md)
        - [x] [私信消息类型、内容说明](docs/message/private_msg_content.md)
    - [x] [设置](docs/message/settings.md)
- [ ] [用户](docs/user)
    - [x] [基本信息](docs/user/info.md)
    - [x] [状态数](docs/user/status_number.md)
    - [x] [关系](docs/user/relation.md)
    - [ ] [个人空间](docs/user/space.md)
    - [x] ~~[检查昵称是否可注册](docs/user/check_nickname.md)~~ (已失效)
    - [x] [用户注册](docs/user/register.md)
    - [x] [用户认证类型一览](docs/user/official_role.md)
    - [ ] [加入老粉计划](docs/user/contract.md)
    - [x] [所有粉丝勋章](docs/user/medals.md)
    - [ ] [批量查询](docs/user/batch.md)
- [ ] [大会员](docs/vip)
    - [ ] [大会员基本信息](docs/vip/info.md)
    - [ ] [大会员中心](docs/vip/center.md)
    - [ ] [大会员签到](docs/vip/clockin.md)
    - [ ] [大会员操作](docs/vip/action.md)
- [ ] [视频](docs/video)
    - [x] [视频分区一览 (分区代码)](docs/video/video_zone.md)
    - [ ] [视频分区一览 (分区代码) (v2)](docs/video/video_zone_v2.md)
    - [x] [基本信息](docs/video/info.md)
    - [x] ~~[状态数](docs/video/status_number.md)~~ (已失效)
    - [x] [快照](docs/video/snapshot.md)
    - [x] [点赞 & 投币 & 收藏 & 分享](docs/video/action.md)
    - [ ] [TAG](docs/video/tags.md)
    - [x] [视频推荐](docs/video/recommend.md)
    - [x] [播放 & 下载地址 (视频流)](docs/video/videostream_url.md)
    - [ ] [互动视频](docs/video/interact_video.md)
    - [x] [高能进度条](docs/video/pbp.md)
    - [ ] [信息上报 (心跳及记录历史)](docs/video/report.md)
    - [x] [视频属性数据](docs/video/attribute_data.md)
    - [x] [视频在线人数](docs/video/online.md)
    - [x] [视频 AI 摘要](docs/video/summary.md)
    - [ ] [稿件投诉](docs/video/appeal.md)
    - [ ] [视频合集](docs/video/collection.md)
    - [ ] [播放器](docs/video/player.md)
- [ ] [剧集 (番剧、影视)](docs/bangumi)
    - [ ] [基本信息](docs/bangumi/info.md)
    - [ ] [播放 & 下载地址（视频流）](docs/bangumi/videostream_url.md)
    - [ ] [时间轴](docs/bangumi/timeline.md)
    - [ ] [索引](docs/bangumi/season_index.md)
    - [ ] [追番相关](docs/bangumi/follow.md)
    - [ ] 状态数
    - [ ] 操作
- [ ] [视频弹幕](docs/danmaku)
    - [x] [protobuf 实时弹幕](docs/danmaku/danmaku_proto.md)
    - [x] [protobuf 弹幕元数据（BAS 弹幕 / 互动弹幕）](docs/danmaku/danmaku_view_proto.md)
    - [x] [xml 实时弹幕](docs/danmaku/danmaku_xml.md)
    - [x] [历史弹幕](docs/danmaku/history.md)
    - [x] [快照](docs/danmaku/snapshot.md)
    - [ ] [弹幕操作](docs/danmaku/action.md)
    - [ ] 高级弹幕
    - [ ] 屏蔽管理
    - [ ] [智能防挡弹幕](docs/danmaku/webmask.md)
    - [x] [弹幕个人配置修改](docs/danmaku/config.md)
    - [x] [名词解释](docs/danmaku/buzzword.md)
    - [x] [点赞查询](docs/danmaku/thumbup.md)
- [x] [视频笔记](docs/note)
    - [x] [笔记列表](docs/note/list.md)
    - [x] [笔记详细信息](docs/note/info.md)
    - [x] [笔记操作](docs/note/action.md)
- [ ] [图文](docs/opus)
    - [x] [图文详细](docs/opus/detail.md)
    - [x] [空间图文](docs/opus/space.md)
    - [ ] [功能模块](docs/opus/features.md)
    - [ ] [富文本节点](docs/opus/rich_text_nodes.md)
- [ ] [专栏](docs/article)
    - [ ] [专栏内容](docs/article/view.md)
    - [ ] [专栏分类](docs/article/category.md)
    - [x] [卡片信息](docs/article/card.md)
    - [X] [基本信息](docs/article/info.md)
    - [X] [点赞 & 投币 & 收藏 & 分享](docs/article/action.md)
    - [X] [文集基本信息](docs/article/articles.md)
- [ ] [动态](docs/dynamic)
    - [ ] [获取动态列表](docs/dynamic/all.md)
    - [ ] [用户空间动态](docs/dynamic/space.md)
    - [ ] [动态基本信息](docs/dynamic/basicInfo.md)
    - [ ] [动态卡片信息字段](docs/dynamic/card_info.md)
    - [ ] [获取动态详情](docs/dynamic/detail.md)
    - [ ] [动态类型对照](docs/dynamic/dynamic_enum.md)
    - [ ] [动态信息](docs/dynamic/content.md)
    - [ ] [发送 & 转载动态](docs/dynamic/publish.md)
    - [ ] [根据关键字搜索用户（at 别人时的填充列表）](docs/dynamic/atlist.md)
    - [ ] [操作](docs/dynamic/action.md)
    - [ ] [话题](docs/dynamic/topic.md)
    - [ ] [动态内容](docs/dynamic/get_dynamic_detail.md)
    - [ ] [导航栏动态](docs/dynamic/nav.md)
    - [x] [首页公告栏](docs/dynamic/banner.md)
- [ ] [创作中心](docs/creativecenter)
    - [ ] [投稿](docs/creativecenter/upload.md)
    - [ ] [统计与数据](docs/creativecenter/statistics&data.md)
    - [ ] 列表查询相关
    - [x] [电磁力数据](docs/creativecenter/railgun.md)
    - [ ] [合集管理](docs/creativecenter/season.md)
    - [ ] [视频相关杂项](docs/creativecenter/videos.md)
    - [ ] [图文操作](docs/creativecenter/opus.md)
- [ ] [音频](docs/audio)
    - [x] [歌曲基本信息](docs/audio/info.md)
    - [ ] [歌单 & 音频收藏夹详细信息](docs/audio/music_list.md)
    - [ ] [状态数](docs/audio/status_number.md)
    - [ ] [投币 & 收藏](docs/audio/action.md)
    - [x] [播放 & 下载地址（音频流）](docs/audio/musicstream_url.md)
    - [x] [音频榜单](docs/audio/rank.md)
- [ ] [排行榜 & 最新视频](docs/video_ranking)
    - [ ] [排行榜](docs/video_ranking/ranking.md)
    - [ ] [热门视频](docs/video_ranking/popular.md)
    - [ ] [最新视频](docs/video_ranking/dynamic.md)
    - [x] [入站必刷视频](docs/video_ranking/precious_videos.md)
- [ ] [搜索](docs/search)
    - [x] [搜索请求](docs/search/search_request.md)
    - [x] [搜索结果](docs/search/search_response.md)
    - [x] [默认搜索 & 热搜](docs/search/hot.md)
    - [x] [搜索建议](docs/search/suggest.md)
- [ ] [小黑屋](docs/blackroom)
    - [ ] 基本信息
    - [x] [封禁公示](docs/blackroom/banlist.md)
    - [x] [风纪委员及众裁案件相关](docs/blackroom/jury)
        - [x] [风纪委员基本信息](docs/blackroom/jury/base_info.md)
        - [x] [众裁案件基本信息](docs/blackroom/jury/judgement_info.md)
        - [x] [裁决操作](docs/blackroom/jury/action.md)
- [x] [评论区](docs/comment)
    - [x] [评论区明细](docs/comment/list.md)
    - [x] [操作](docs/comment/action.md)
- [ ] [表情](docs/emoji)
    - [x] [表情及表情包信息](docs/emoji/list.md)
    - [x] [操作](docs/emoji/action.md)
- [x] [实时广播（通讯协议）](docs/broadcast)
    - [x] [视频内广播](docs/broadcast/video_room.md)
- [ ] [充电](docs/electric)
  - [ ] [包月充电](docs/electric/monthly.md)
  - [ ] 自定义充电
    - [x] [B 币方式充电](docs/electric/Bcoin.md)
    - [x] [微信 & 支付宝方式充电](docs/electric/WeChat&Alipay.md)
    - [x] [充电留言](docs/electric/charge_msg.md)
  - [x] [充电列表](docs/electric/charge_list.md)
- [ ] ~~[相簿](docs/album)~~ (已下线)
    - [x] ~~[基本信息](docs/album/info.md)~~
    - [x] ~~[相簿列表](docs/album/list.md)~~
    - [x] ~~[推荐作者](docs/album/recommend_author.md)~~
    - [x] ~~[活动列表](docs/album/activity_list.md)~~
    - [x] ~~[操作](docs/album/action.md)~~
    - [ ] ~~投稿~~
- [ ] [历史记录 & 稍后再看](docs/historytoview)
    - [x] [历史记录](docs/historytoview/history.md)
    - [x] [稍后再看](docs/historytoview/toview.md)
- [ ] [收藏夹](docs/fav)
    - [x] [基本信息](docs/fav/info.md)
    - [x] [收藏夹内容](docs/fav/list.md)
    - [ ] [收藏夹操作](docs/fav/action.md)
- [ ] [课程](docs/cheese)
    - [x] [课程基本信息](docs/cheese/info.md)
    - [ ] 已购课程
    - [ ] 分区推荐列表
    - [ ] 操作
    - [x] [播放 & 下载地址（视频流）](docs/cheese/videostream_url.md)
- [ ] [直播](docs/live)
    - [ ] [直播间基本信息](docs/live/info.md)
    - [ ] [直播推荐](docs/live/recommend.md)
    - [ ] [直播分区](docs/live/live_area.md)
    - [ ] [直播间管理](docs/live/manage.md)
    - [ ] 直播间操作
    - [ ] [直播视频流](docs/live/live_stream.md)
    - [ ] [直播信息流](docs/live/message_stream.md)
    - [ ] [直播红包](docs/live/redpocket.md)
    - [ ] [直播间表情包](docs/live/emoticons.md)
    - [ ] [直播间用户实用 API](docs/live/user.md)
    - [x] [直播间禁言相关](docs/live/silent_user_manage.md)
    - [ ] [关注UP直播情况](docs/live/follow_up_live.md)
    - [ ] [直播心跳上报](docs/live/report.md)
    - [ ] [直播间弹幕](docs/live/danmaku.md)
    - [ ] [直播流水](docs/live/live_bill.md)
    - [ ] [礼物相关](docs/live/gift.md)
    - [ ] [大航海/粉丝团](docs/live/guard.md)
    - [ ] [直播回放](docs/live/live_replay.md)
    - [ ] [直播数据](docs/live/live_data.md)
    - [ ] [直播投票](docs/live/live_vote.md)
- [ ] [活动](docs/activity)
    - [ ] [活动列表](docs/activity/list.md)
    - [ ] [活动主题信息](docs/activity/info.md)
- [ ] [转正答题](docs/newbie_exam)
    - [x] [查询信息](docs/newbie_exam/info.md)
    - [x] [拉取题目](docs/newbie_exam/fetch.md)
    - [x] [操作](docs/newbie_exam/action.md)
- [ ] [青少年守护](docs/teenager/)
    - [x] [青少年模式](docs/teenager/teenager_mode.md)
    - [ ] 亲子平台
    - [ ] 课堂模式
- [ ] [B 币钱包](docs/wallet/)
    - [ ] [基本信息](docs/wallet/info.md)
    - [ ] B 币充值
    - [ ] 贝壳相关
- [ ] [哔哩哔哩漫画](docs/manga)
    - [ ] 用户信息
    - [x] [签到](docs/manga/ClockIn.md)
    - [x] [积分商城](docs/manga/point_shop.md)
    - [x] [漫画操作](docs/manga/Comic.md)
    - [ ] [漫画任务操作](docs/manga/Activity.md)
    - [x] [漫画赛季](docs/manga/Season.md)
    - [x] [漫读券/已购相关](docs/manga/User.md)
    - [x] [下载](docs/manga/Download.md)
    - [x] [data.index 解析](docs/manga/index_file.md)
    - [ ] [获取轻享卡信息](docs/manga/light_card.md)
- [ ] 哔哩哔哩游戏
- [ ] [终端网络查询](docs/clientinfo)
    - [x] [基于 IP 的地理位置查询](docs/clientinfo/ip.md)
- [ ] [客服中心](docs/customerservice)
    - [ ] [客服消息](docs/customerservice/msg.md)
- [ ] [web 端组件](docs/web_widget)
    - [x] [分区当日投稿数](docs/web_widget/zone_upload.md)
    - [x] [404 页漫画收集](docs/web_widget/404_manga.md)
    - [ ] [首页横幅头图](docs/web_widget/header.md)
    - [ ] [分区横幅轮播图](docs/web_widget/banner.md)
- [ ] [APP 端组件](docs/APP_widget)
    - [x] [开屏图片 + 恰饭珍贵录像](docs/APP_widget/splash.md)
    - [ ] [获取最新 APP 版本](docs/APP_widget/ver.md)
- [ ] [个性装扮](docs/garb)
    - [x] [APP 主题](docs/garb/skin.md)
    - [x] [主题色](docs/garb/color.md)
    - [ ] [装扮/收藏集](docs/garb/lottery.md)


## 📖相关协议基础

HTTP 协议：[传送门](https://www.cnblogs.com/an-wen/p/11180076.html)

JSON 序列格式：[传送门](https://www.sojson.com/json/json_index.html)

XML 序列格式：[传送门](https://www.w3school.com.cn/xml/xml_intro.asp)

ProtoBuf 序列格式：[传送门](https://www.jianshu.com/p/a24c88c0526a)
