# API Enterprise Standardization TODO

> 当前状态假设：本项目尚未进行企业级 API 规范化（默认全部未完成）。

- 文档接口文件总数：195 (docs/**/*.md) 
- gRPC 协议文件总数：128 (grpc_api/**/*.proto) 
- 需纳入规范化跟踪总数：323

## 0. 规范化基线（全局任务）

- [ ] 建立统一接口文档模板（接口描述、路径、方法、鉴权、限流、幂等、错误码、示例、变更记录）
- [ ] 统一参数命名与类型约束（命名风格、必填规则、默认值、枚举约束）
- [ ] 统一认证与授权说明（Cookie/Token/AppKey/签名字段）
- [ ] 统一错误模型（业务码、HTTP 状态码、重试语义、可观测字段）
- [ ] 统一版本策略（v1/v2 兼容说明、弃用策略、迁移窗口）
- [ ] 为 REST 文档补齐 OpenAPI/JSON Schema 机器可读定义
- [ ] 为 gRPC proto 补齐字段注释规范与 breaking-change 检查规则
- [ ] 建立示例请求/响应规范（脱敏、最小可运行示例、错误示例）
- [ ] 建立自动化校验（lint、链接检查、结构检查、schema 校验）
- [ ] 建立文档发布与变更日志流程（PR 模板 + Changelog）
- [ ] 建立测试与契约验证流程（冒烟、回归、契约测试）
- [ ] 建立 SDK/代码生成策略（OpenAPI Generator / protoc）

## 1. docs 接口文档规范化清单

### docs/activity
- [ ] [DOC] `docs/activity/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/activity/list.md` -> 按企业级模板完成规范化

### docs/album
- [ ] [DOC] `docs/album/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/album/activity_list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/album/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/album/list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/album/recommend_author.md` -> 按企业级模板完成规范化

### docs/APP_widget
- [ ] [DOC] `docs/APP_widget/splash.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/APP_widget/ver.md` -> 按企业级模板完成规范化

### docs/article
- [ ] [DOC] `docs/article/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/article/articles.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/article/card.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/article/category.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/article/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/article/view.md` -> 按企业级模板完成规范化

### docs/audio
- [ ] [DOC] `docs/audio/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/audio/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/audio/music_list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/audio/musicstream_url.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/audio/rank.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/audio/status_number.md` -> 按企业级模板完成规范化

### docs/bangumi
- [ ] [DOC] `docs/bangumi/follow.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/bangumi/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/bangumi/season_index.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/bangumi/timeline.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/bangumi/videostream_url.md` -> 按企业级模板完成规范化

### docs/blackroom
- [ ] [DOC] `docs/blackroom/banlist.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/blackroom/jury/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/blackroom/jury/base_info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/blackroom/jury/judgement_info.md` -> 按企业级模板完成规范化

### docs/broadcast
- [ ] [DOC] `docs/broadcast/readme.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/broadcast/video_room.md` -> 按企业级模板完成规范化

### docs/cheese
- [ ] [DOC] `docs/cheese/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/cheese/videostream_url.md` -> 按企业级模板完成规范化

### docs/clientinfo
- [ ] [DOC] `docs/clientinfo/ip.md` -> 按企业级模板完成规范化

### docs/comment
- [ ] [DOC] `docs/comment/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/comment/list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/comment/readme.md` -> 按企业级模板完成规范化

### docs/creativecenter
- [ ] [DOC] `docs/creativecenter/opus.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/creativecenter/railgun.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/creativecenter/season.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/creativecenter/statistics&data.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/creativecenter/upload.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/creativecenter/videos.md` -> 按企业级模板完成规范化

### docs/customerservice
- [ ] [DOC] `docs/customerservice/msg.md` -> 按企业级模板完成规范化

### docs/danmaku
- [ ] [DOC] `docs/danmaku/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/buzzword.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/config.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/danmaku_proto.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/danmaku_view_proto.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/danmaku_xml.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/history.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/snapshot.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/thumbup.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/danmaku/webmask.md` -> 按企业级模板完成规范化

### docs/dynamic
- [ ] [DOC] `docs/dynamic/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/all.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/atlist.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/banner.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/basicInfo.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/card_info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/content.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/detail.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/dynamic_enum.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/get_dynamic_detail.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/nav.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/publish.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/space.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/dynamic/topic.md` -> 按企业级模板完成规范化

### docs/electric
- [ ] [DOC] `docs/electric/Bcoin.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/electric/charge_list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/electric/charge_msg.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/electric/monthly.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/electric/WeChat&Alipay.md` -> 按企业级模板完成规范化

### docs/emoji
- [ ] [DOC] `docs/emoji/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/emoji/list.md` -> 按企业级模板完成规范化

### docs/fav
- [ ] [DOC] `docs/fav/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/fav/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/fav/list.md` -> 按企业级模板完成规范化

### docs/garb
- [ ] [DOC] `docs/garb/color.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/garb/lottery.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/garb/skin.md` -> 按企业级模板完成规范化

### docs/historytoview
- [ ] [DOC] `docs/historytoview/history.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/historytoview/toview.md` -> 按企业级模板完成规范化

### docs/live
- [ ] [DOC] `docs/live/danmaku.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/emoticons.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/follow_up_live.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/gift.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/guard.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_area.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_bill.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_data.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_replay.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_stream.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/live_vote.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/manage.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/message_stream.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/recommend.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/redpocket.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/report.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/silent_user_manage.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/live/user.md` -> 按企业级模板完成规范化

### docs/login
- [ ] [DOC] `docs/login/cookie_refresh.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/exit.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_action/password.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_action/QR.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_action/readme.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_action/SMS.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/login_notice.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/login/member_center.md` -> 按企业级模板完成规范化

### docs/manga
- [ ] [DOC] `docs/manga/Activity.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/ClockIn.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/Comic.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/Download.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/index_file.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/light_card.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/point_shop.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/Season.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/manga/User.md` -> 按企业级模板完成规范化

### docs/message
- [ ] [DOC] `docs/message/msg.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/message/private_msg.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/message/private_msg_content.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/message/settings.md` -> 按企业级模板完成规范化

### docs/misc
- [ ] [DOC] `docs/misc/b23tv.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/buvid3_4.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/bvid_desc.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/device_identity.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/errcode.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/mathjax.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/picture.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/sign/APP.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/sign/APPKey.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/sign/bili_ticket.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/sign/v_voucher.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/sign/wbi.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/misc/time_stamp.md` -> 按企业级模板完成规范化

### docs/newbie_exam
- [ ] [DOC] `docs/newbie_exam/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/newbie_exam/fetch.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/newbie_exam/info.md` -> 按企业级模板完成规范化

### docs/note
- [ ] [DOC] `docs/note/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/note/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/note/list.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/note/readme.md` -> 按企业级模板完成规范化

### docs/opus
- [ ] [DOC] `docs/opus/detail.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/opus/features.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/opus/rich_text_nodes.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/opus/space.md` -> 按企业级模板完成规范化

### docs/search
- [x] [DOC] `docs/search/hot.md` -> 按企业级模板完成规范化
- [x] [DOC] `docs/search/search_request.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/search/search_response.md` -> 按企业级模板完成规范化
- [x] [DOC] `docs/search/suggest.md` -> 按企业级模板完成规范化

### docs/teenager
- [ ] [DOC] `docs/teenager/teenager_mode.md` -> 按企业级模板完成规范化

### docs/user
- [ ] [DOC] `docs/user/batch.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/check_nickname.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/contract.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/medals.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/official_role.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/register.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/relation.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/space.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/user/status_number.md` -> 按企业级模板完成规范化

### docs/video
- [ ] [DOC] `docs/video/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/appeal.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/attribute_data.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/collection.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/info.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/interact_video.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/online.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/pbp.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/player.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/recommend.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/report.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/snapshot.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/status_number.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/summary.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/tags.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/video_zone.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/video_zone_v2.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video/videostream_url.md` -> 按企业级模板完成规范化

### docs/video_ranking
- [ ] [DOC] `docs/video_ranking/dynamic.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video_ranking/popular.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video_ranking/precious_videos.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/video_ranking/ranking.md` -> 按企业级模板完成规范化

### docs/vip
- [ ] [DOC] `docs/vip/action.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/vip/center.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/vip/clockin.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/vip/info.md` -> 按企业级模板完成规范化

### docs/wallet
- [ ] [DOC] `docs/wallet/info.md` -> 按企业级模板完成规范化

### docs/web_widget
- [ ] [DOC] `docs/web_widget/404_manga.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/web_widget/banner.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/web_widget/header.md` -> 按企业级模板完成规范化
- [ ] [DOC] `docs/web_widget/zone_upload.md` -> 按企业级模板完成规范化

## 2. grpc_api 协议规范化清单

### grpc_api/bilibili
- [ ] [PROTO] `grpc_api/bilibili/account/fission/v1/fission.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/ad/v1/ad.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/api/player/v1/player.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/api/probe/v1/probe.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/api/ticket/v1/ticket.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/archive/middleware/v1/preload.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/archive/v1/archive.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/ad.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/card.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/common.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/double.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/single.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/click/v1/heartbeat.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/download.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/dynamic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/experimental.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/internaldevice.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/night.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/other.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/pegasus.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/play.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/privacy.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/search.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/v1/distribution.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/common/dynamic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v1/dynamic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/campus.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/dynamic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/opus.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/history.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/media.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/search.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/space.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/listener/v1/listener.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/mine/v1/mine.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/nativeact/v1/nativeact.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playeronline/v1/playeronline.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/pgcanymodel/pgcanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/pugvanymodel.proto/pugvanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/ugcanymodel/ugcanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/v1/playerunite.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/playurl/v1/playurl.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/resource/privacy/v1/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/resource/v1/module.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/search/v2/search.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/show/gateway/v1/service.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/show/mixture/v1/mixture.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/show/popular/v1/popular.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/show/rank/v1/rank.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/show/region/v1/region.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/space/v1/space.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/splash/v1/splash.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/topic/v1/topic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/view/v1/view.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/common.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/pgcanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/pugvanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/ugcanymodel.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/v1/viewunite.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/app/wall/v1/wall.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/editor/notify.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/esports/notify.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/fission/notify.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/im/notify.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/dm.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/native.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/resource.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/search.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/note/sync.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ogv/freya.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ogv/live.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ticket/activitygame.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/tv/proj.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/broadcast.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/laser.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/mod.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/push.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/room.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/test.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v2/laser.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/cheese/gateway/player/v1/playurl.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/community/interfacess/biligram/v1/biligram.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/community/service/dm/v1/dm.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/community/service/govern/v1/govern.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/common/common.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/v1/avatar.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/v1/plugin.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dynamic/common/dynamic.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dynamic/gw/gateway.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dynamic/interfaces/campus/v1/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/dynamic/interfaces/feed/v1/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/gaia/gw/gw_api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/im/interfaces/inner-interface/v1/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/im/interfaces/v1/im.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/im/type/im.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/live/app/room/v1/room.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/live/general/interfaces/v1/interfaces.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/main/common/arch/doll/v1/doll.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/main/community/reply/v1/reply.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/device/device.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/fawkes/fawkes.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/locale/locale.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/metadata.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/network/network.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/parabox/parabox.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/metadata/restriction/restriction.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pagination/pagination.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pangu/gallery/v1/gallery.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pangu/gallery/v1/openplatform/apiserver/v1alpha1/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pgc/gateway/player/v1/playurl.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pgc/gateway/player/v2/playurl.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/pgc/service/premiere/v1/premiere.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/playershared/playershared.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/polymer/app/search/v1/search.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/polymer/community/govern/v1/govern.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/polymer/contract/v1/contract.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/polymer/demo/demo.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/polymer/list/v1/list.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/relation/interfaces/api.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/render/render.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/rpc/status.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/tv/interfaces/dm/v1/dm.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/vega/deneb/v1/deneb.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/web/interfaces/v1/interfaces.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/bilibili/web/space/v1/space.proto` -> 按企业级协议注释与兼容规则完成规范化

### grpc_api/datacenter
- [ ] [PROTO] `grpc_api/datacenter/hakase/protobuf/android_device_info.proto` -> 按企业级协议注释与兼容规则完成规范化

### grpc_api/pgc
- [ ] [PROTO] `grpc_api/pgc/biz/room.proto` -> 按企业级协议注释与兼容规则完成规范化
- [ ] [PROTO] `grpc_api/pgc/gateway/vega/v1/vega.proto` -> 按企业级协议注释与兼容规则完成规范化

## 3. 里程碑建议（可选）

- [ ] M1: 完成全局模板与规则，接入 lint/校验流水线
- [ ] M2: 完成 `docs` 高优先级目录（login/user/video/search）规范化
- [ ] M3: 完成全部 `docs` 规范化并发布首版 changelog
- [ ] M4: 完成 `grpc_api` 全量 proto 规范化及兼容性检查接入
- [ ] M5: 输出 OpenAPI/proto 生成产物与 SDK 试运行结果
