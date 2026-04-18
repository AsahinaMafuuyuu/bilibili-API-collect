# API Enterprise Standardization TODO

> 褰撳墠鐘舵€佸亣璁撅細鏈」鐩皻鏈繘琛屼紒涓氱骇 API 瑙勮寖鍖栵紙榛樿鍏ㄩ儴鏈畬鎴愶級銆?

- 鏂囨。鎺ュ彛鏂囦欢鎬绘暟锛?95 (docs/**/*.md) 
- gRPC 鍗忚鏂囦欢鎬绘暟锛?28 (grpc_api/**/*.proto) 
- 闇€绾冲叆瑙勮寖鍖栬窡韪€绘暟锛?23

## 0. 瑙勮寖鍖栧熀绾匡紙鍏ㄥ眬浠诲姟锛?

- [ ] 寤虹珛缁熶竴鎺ュ彛鏂囨。妯℃澘锛堟帴鍙ｆ弿杩般€佽矾寰勩€佹柟娉曘€侀壌鏉冦€侀檺娴併€佸箓绛夈€侀敊璇爜銆佺ず渚嬨€佸彉鏇磋褰曪級
- [ ] 缁熶竴鍙傛暟鍛藉悕涓庣被鍨嬬害鏉燂紙鍛藉悕椋庢牸銆佸繀濉鍒欍€侀粯璁ゅ€笺€佹灇涓剧害鏉燂級
- [ ] 缁熶竴璁よ瘉涓庢巿鏉冭鏄庯紙Cookie/Token/AppKey/绛惧悕瀛楁锛?
- [ ] 缁熶竴閿欒妯″瀷锛堜笟鍔＄爜銆丠TTP 鐘舵€佺爜銆侀噸璇曡涔夈€佸彲瑙傛祴瀛楁锛?
- [ ] 缁熶竴鐗堟湰绛栫暐锛坴1/v2 鍏煎璇存槑銆佸純鐢ㄧ瓥鐣ャ€佽縼绉荤獥鍙ｏ級
- [ ] 涓?REST 鏂囨。琛ラ綈 OpenAPI/JSON Schema 鏈哄櫒鍙瀹氫箟
- [ ] 涓?gRPC proto 琛ラ綈瀛楁娉ㄩ噴瑙勮寖涓?breaking-change 妫€鏌ヨ鍒?
- [ ] 寤虹珛绀轰緥璇锋眰/鍝嶅簲瑙勮寖锛堣劚鏁忋€佹渶灏忓彲杩愯绀轰緥銆侀敊璇ず渚嬶級
- [ ] 寤虹珛鑷姩鍖栨牎楠岋紙lint銆侀摼鎺ユ鏌ャ€佺粨鏋勬鏌ャ€乻chema 鏍￠獙锛?
- [ ] 寤虹珛鏂囨。鍙戝竷涓庡彉鏇存棩蹇楁祦绋嬶紙PR 妯℃澘 + Changelog锛?
- [ ] 寤虹珛娴嬭瘯涓庡绾﹂獙璇佹祦绋嬶紙鍐掔儫銆佸洖褰掋€佸绾︽祴璇曪級
- [ ] 寤虹珛 SDK/浠ｇ爜鐢熸垚绛栫暐锛圤penAPI Generator / protoc锛?

## 1. docs 鎺ュ彛鏂囨。瑙勮寖鍖栨竻鍗?

### docs/activity
- [ ] [DOC] `docs/activity/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/activity/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/album
- [ ] [DOC] `docs/album/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/album/activity_list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/album/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/album/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/album/recommend_author.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/APP_widget
- [ ] [DOC] `docs/APP_widget/splash.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/APP_widget/ver.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/article
- [ ] [DOC] `docs/article/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/article/articles.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/article/card.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/article/category.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/article/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/article/view.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/audio
- [ ] [DOC] `docs/audio/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/audio/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/audio/music_list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/audio/musicstream_url.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/audio/rank.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/audio/status_number.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/bangumi
- [ ] [DOC] `docs/bangumi/follow.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/bangumi/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/bangumi/season_index.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/bangumi/timeline.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/bangumi/videostream_url.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/blackroom
- [ ] [DOC] `docs/blackroom/banlist.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/blackroom/jury/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/blackroom/jury/base_info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/blackroom/jury/judgement_info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/broadcast
- [ ] [DOC] `docs/broadcast/readme.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/broadcast/video_room.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/cheese
- [ ] [DOC] `docs/cheese/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/cheese/videostream_url.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/clientinfo
- [ ] [DOC] `docs/clientinfo/ip.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/comment
- [ ] [DOC] `docs/comment/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/comment/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/comment/readme.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/creativecenter
- [ ] [DOC] `docs/creativecenter/opus.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/creativecenter/railgun.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/creativecenter/season.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/creativecenter/statistics&data.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/creativecenter/upload.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/creativecenter/videos.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/customerservice
- [ ] [DOC] `docs/customerservice/msg.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/danmaku
- [ ] [DOC] `docs/danmaku/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/buzzword.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/config.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/danmaku_proto.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/danmaku_view_proto.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/danmaku_xml.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/history.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/snapshot.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/thumbup.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/danmaku/webmask.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/dynamic
- [ ] [DOC] `docs/dynamic/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/all.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/atlist.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/banner.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/basicInfo.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/card_info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/content.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/detail.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/dynamic_enum.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/get_dynamic_detail.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/nav.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/publish.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/space.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/dynamic/topic.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/electric
- [ ] [DOC] `docs/electric/Bcoin.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/electric/charge_list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/electric/charge_msg.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/electric/monthly.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/electric/WeChat&Alipay.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/emoji
- [ ] [DOC] `docs/emoji/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/emoji/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/fav
- [ ] [DOC] `docs/fav/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/fav/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/fav/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/garb
- [ ] [DOC] `docs/garb/color.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/garb/lottery.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/garb/skin.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/historytoview
- [ ] [DOC] `docs/historytoview/history.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/historytoview/toview.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/live
- [ ] [DOC] `docs/live/danmaku.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/emoticons.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/follow_up_live.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/gift.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/guard.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_area.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_bill.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_data.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_replay.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_stream.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/live_vote.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/manage.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/message_stream.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/recommend.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/redpocket.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/report.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/silent_user_manage.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/live/user.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/login
- [ ] [DOC] `docs/login/cookie_refresh.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/exit.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_action/password.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_action/QR.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_action/readme.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_action/SMS.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/login_notice.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/login/member_center.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/manga
- [ ] [DOC] `docs/manga/Activity.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/ClockIn.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/Comic.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/Download.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/index_file.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/light_card.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/point_shop.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/Season.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/manga/User.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/message
- [ ] [DOC] `docs/message/msg.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/message/private_msg.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/message/private_msg_content.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/message/settings.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/misc
- [ ] [DOC] `docs/misc/b23tv.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/buvid3_4.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/bvid_desc.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/device_identity.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/errcode.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/mathjax.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/picture.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/sign/APP.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/sign/APPKey.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/sign/bili_ticket.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/sign/v_voucher.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/sign/wbi.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/misc/time_stamp.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/newbie_exam
- [ ] [DOC] `docs/newbie_exam/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/newbie_exam/fetch.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/newbie_exam/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/note
- [ ] [DOC] `docs/note/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/note/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/note/list.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/note/readme.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/opus
- [ ] [DOC] `docs/opus/detail.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/opus/features.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/opus/rich_text_nodes.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/opus/space.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/search
- [x] [DOC] `docs/search/hot.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [x] [DOC] `docs/search/search_request.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/search/search_response.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [x] [DOC] `docs/search/suggest.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/teenager
- [ ] [DOC] `docs/teenager/teenager_mode.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/user
- [ ] [DOC] `docs/user/batch.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/check_nickname.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/contract.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/medals.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/official_role.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/register.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/relation.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/space.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/user/status_number.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/video
- [ ] [DOC] `docs/video/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/appeal.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/attribute_data.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/collection.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/interact_video.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/online.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/pbp.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/player.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/recommend.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/report.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/snapshot.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/status_number.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/summary.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/tags.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/video_zone.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/video_zone_v2.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video/videostream_url.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/video_ranking
- [ ] [DOC] `docs/video_ranking/dynamic.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video_ranking/popular.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video_ranking/precious_videos.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/video_ranking/ranking.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/vip
- [ ] [DOC] `docs/vip/action.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/vip/center.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/vip/clockin.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/vip/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/wallet
- [ ] [DOC] `docs/wallet/info.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

### docs/web_widget
- [ ] [DOC] `docs/web_widget/404_manga.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/web_widget/banner.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/web_widget/header.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?
- [ ] [DOC] `docs/web_widget/zone_upload.md` -> 鎸変紒涓氱骇妯℃澘瀹屾垚瑙勮寖鍖?

## 2. grpc_api 鍗忚瑙勮寖鍖栨竻鍗?

### grpc_api/bilibili
- [ ] [PROTO] `grpc_api/bilibili/account/fission/v1/fission.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/ad/v1/ad.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/api/player/v1/player.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/api/probe/v1/probe.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/api/ticket/v1/ticket.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/archive/middleware/v1/preload.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/archive/v1/archive.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/ad.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/card.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/common.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/double.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/card/v1/single.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/click/v1/heartbeat.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/download.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/dynamic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/experimental.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/internaldevice.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/night.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/other.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/pegasus.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/play.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/privacy.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/setting/search.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/distribution/v1/distribution.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/common/dynamic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v1/dynamic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/campus.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/dynamic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/dynamic/v2/opus.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/history.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/media.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/search.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/interfaces/v1/space.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/listener/v1/listener.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/mine/v1/mine.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/nativeact/v1/nativeact.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playeronline/v1/playeronline.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/pgcanymodel/pgcanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/pugvanymodel.proto/pugvanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/ugcanymodel/ugcanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playerunite/v1/playerunite.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/playurl/v1/playurl.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/resource/privacy/v1/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/resource/v1/module.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/search/v2/search.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/show/gateway/v1/service.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/show/mixture/v1/mixture.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/show/popular/v1/popular.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/show/rank/v1/rank.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/show/region/v1/region.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/space/v1/space.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/splash/v1/splash.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/topic/v1/topic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/view/v1/view.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/common.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/pgcanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/pugvanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/ugcanymodel.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/viewunite/v1/viewunite.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/app/wall/v1/wall.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/editor/notify.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/esports/notify.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/fission/notify.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/im/notify.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/dm.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/native.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/resource.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/main/search.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/note/sync.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ogv/freya.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ogv/live.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/ticket/activitygame.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/message/tv/proj.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/broadcast.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/laser.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/mod.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/push.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/room.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v1/test.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/broadcast/v2/laser.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/cheese/gateway/player/v1/playurl.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/community/interfacess/biligram/v1/biligram.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/community/service/dm/v1/dm.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/community/service/govern/v1/govern.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/common/common.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/v1/avatar.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dagw/component/avatar/v1/plugin.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dynamic/common/dynamic.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dynamic/gw/gateway.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dynamic/interfaces/campus/v1/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/dynamic/interfaces/feed/v1/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/gaia/gw/gw_api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/im/interfaces/inner-interface/v1/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/im/interfaces/v1/im.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/im/type/im.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/live/app/room/v1/room.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/live/general/interfaces/v1/interfaces.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/main/common/arch/doll/v1/doll.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/main/community/reply/v1/reply.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/device/device.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/fawkes/fawkes.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/locale/locale.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/metadata.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/network/network.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/parabox/parabox.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/metadata/restriction/restriction.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pagination/pagination.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pangu/gallery/v1/gallery.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pangu/gallery/v1/openplatform/apiserver/v1alpha1/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pgc/gateway/player/v1/playurl.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pgc/gateway/player/v2/playurl.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/pgc/service/premiere/v1/premiere.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/playershared/playershared.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/polymer/app/search/v1/search.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/polymer/community/govern/v1/govern.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/polymer/contract/v1/contract.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/polymer/demo/demo.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/polymer/list/v1/list.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/relation/interfaces/api.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/render/render.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/rpc/status.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/tv/interfaces/dm/v1/dm.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/vega/deneb/v1/deneb.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/web/interfaces/v1/interfaces.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/bilibili/web/space/v1/space.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲

### grpc_api/datacenter
- [ ] [PROTO] `grpc_api/datacenter/hakase/protobuf/android_device_info.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲

### grpc_api/pgc
- [ ] [PROTO] `grpc_api/pgc/biz/room.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲
- [ ] [PROTO] `grpc_api/pgc/gateway/vega/v1/vega.proto` -> 鎸変紒涓氱骇鍗忚娉ㄩ噴涓庡吋瀹硅鍒欏畬鎴愯鑼冨寲

## 3. 閲岀▼纰戝缓璁紙鍙€夛級

- [ ] M1: 瀹屾垚鍏ㄥ眬妯℃澘涓庤鍒欙紝鎺ュ叆 lint/鏍￠獙娴佹按绾?
- [ ] M2: 瀹屾垚 `docs` 楂樹紭鍏堢骇鐩綍锛坙ogin/user/video/search锛夎鑼冨寲
- [ ] M3: 瀹屾垚鍏ㄩ儴 `docs` 瑙勮寖鍖栧苟鍙戝竷棣栫増 changelog
- [ ] M4: 瀹屾垚 `grpc_api` 鍏ㄩ噺 proto 瑙勮寖鍖栧強鍏煎鎬ф鏌ユ帴鍏?
- [ ] M5: 杈撳嚭 OpenAPI/proto 鐢熸垚浜х墿涓?SDK 璇曡繍琛岀粨鏋?

