# 搜索请求 API（企业级重构）

## 1. 文档范围
- 源文档：`docs/search/search_request.md`
- 重构产物：`Rebuild-Api-Docs/search/search_request.md`
- 说明：本文件覆盖 Web 搜索主入口与分类搜索入口；结果项的细粒度字段可再结合 `docs/search/search_response.md` 继续细化。

## 2. 接口清单
| 编号 | 接口用途 | 方法 | 路径 |
| --- | --- | --- | --- |
| SEARCH-01 | 综合搜索（Web） | GET | `/x/web-interface/wbi/search/all/v2` |
| SEARCH-02 | 分类搜索（Web） | GET | `/x/web-interface/wbi/search/type` |

## 3. 统一约定
### 3.1 鉴权与访问前置
- 两个接口均要求 `WBI` 签名。
- 建议携带 Cookie（至少 `buvid3`，部分场景建议 `SESSDATA`）。
- 官方说明中提到：若 Cookie 不足，可能返回 `-412`。

### 3.2 幂等与分页
- 两个接口均为 `GET` 幂等。
- `SEARCH-02` 支持 `page` 分页；每页条数通常为 `20`。

### 3.3 统一错误对象（重构规范）
```json
{
  "http_status": 412,
  "code": -412,
  "reason": "Request blocked by risk control",
  "retryable": false,
  "trace_id": "optional"
}
```

## 4. 接口定义
### 4.1 SEARCH-01 综合搜索（Web）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/x/web-interface/wbi/search/all/v2` |
| 鉴权 | WBI 签名 + 建议 `buvid3` Cookie |
| 版本 | v2 |

#### 请求参数
| 参数 | 类型 | 必填 | 默认值 | 约束 |
| --- | --- | --- | --- | --- |
| keyword | string | 是 | - | 搜索关键词，建议 URL Encode |
| wts | integer | 是 | - | WBI 时间戳 |
| w_rid | string | 是 | - | WBI 签名 |

#### 成功响应
顶层结构：`code`、`message`、`ttl`、`data`。

`data` 关键字段：
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| seid | string | 是 | 搜索链路 ID |
| page | integer | 是 | 当前页（综合搜索通常固定为 1） |
| pagesize | integer | 是 | 每页条数（通常 20） |
| numResults | integer | 是 | 总命中数（上限受平台策略限制） |
| numPages | integer | 是 | 总页数 |
| pageinfo | object | 否 | 各类型结果统计 |
| top_tlist | object | 否 | 各类型命中数量 |
| show_module_list | array | 否 | 模块返回顺序 |
| result | array | 是 | 搜索结果分组 |

`result[]` 字段：
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| result_type | string | 是 | 结果分类（如 `video`、`media_bangumi`） |
| data | array | 是 | 对应分类下的条目列表 |

#### 错误码
| code | HTTP | 含义 | retryable |
| --- | --- | --- | --- |
| 0 | 200 | 成功 | 否 |
| -400 | 400 | 参数错误/签名错误 | 否 |
| -412 | 412 | 风控拦截 | 否 |
| 5xx | 500 | 服务端异常 | 是 |

#### 请求示例
```bash
curl -G 'https://api.bilibili.com/x/web-interface/wbi/search/all/v2' \
  --data-urlencode 'keyword=洛天依' \
  --data-urlencode 'wts=<unix_ts>' \
  --data-urlencode 'w_rid=<wbi_signature>' \
  -b 'buvid3=<value>; SESSDATA=<value>'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "0",
  "ttl": 1,
  "data": {
    "seid": "8850295244740510044",
    "page": 1,
    "pagesize": 20,
    "numResults": 1000,
    "numPages": 50,
    "result": [
      {
        "result_type": "video",
        "data": [
          {
            "type": "video",
            "aid": 968772260,
            "bvid": "BV1Tp4y1S7cu",
            "title": "示例标题",
            "author": "示例UP主"
          }
        ]
      }
    ]
  }
}
```

#### 失败响应示例
```json
{
  "code": -412,
  "message": "请求被拦截",
  "ttl": 1,
  "data": null
}
```

#### OpenAPI 3.0 片段
```yaml
openapi: 3.0.3
info:
  title: Bilibili Search Request APIs
  version: "1.0.0"
paths:
  /x/web-interface/wbi/search/all/v2:
    get:
      summary: 综合搜索（Web）
      parameters:
        - name: keyword
          in: query
          required: true
          schema:
            type: string
        - name: wts
          in: query
          required: true
          schema:
            type: integer
        - name: w_rid
          in: query
          required: true
          schema:
            type: string
      responses:
        "200":
          description: 成功
```

### 4.2 SEARCH-02 分类搜索（Web）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/x/web-interface/wbi/search/type` |
| 鉴权 | WBI 签名 + Cookie（建议带 `buvid3`） |
| 风控要求 | Referer 在 `.bilibili.com` 域下，User-Agent 避免敏感特征 |

#### 请求参数
| 参数 | 类型 | 必填 | 默认值 | 枚举/约束 |
| --- | --- | --- | --- | --- |
| search_type | string | 是 | - | `video`、`media_bangumi`、`media_ft`、`live`、`live_room`、`live_user`、`article`、`topic`、`bili_user`、`photo` |
| keyword | string | 是 | - | 搜索关键词 |
| order | string | 否 | 见说明 | 视频：`totalrank/click/pubdate/dm/stow/scores`；用户：`0/fans/level`；直播间：`online/live_time` |
| order_sort | integer | 否 | `0` | 仅用户搜索有效，`0` 降序、`1` 升序 |
| category_id | integer | 否 | `0` | 仅部分搜索类型生效 |
| duration | integer | 否 | `0` | 仅视频：`0` 全部，`1` <10min，`2` 10-30min，`3` 30-60min，`4` >60min |
| page | integer | 否 | `1` | 页码，最小 1 |
| wts | integer | 是 | - | WBI 时间戳 |
| w_rid | string | 是 | - | WBI 签名 |

#### 成功响应
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| code | integer | 是 | 业务状态码 |
| message | string | 是 | 提示信息 |
| ttl | integer | 是 | 通常 `1` |
| data.page | integer | 是 | 当前页 |
| data.pagesize | integer | 是 | 每页条数（通常 `20`） |
| data.numResults | integer | 是 | 总结果数 |
| data.numPages | integer | 是 | 总页数 |
| data.result | array | 是 | 分类结果列表 |
| data.pageinfo | object | 否 | `live_room/live_user` 等附加统计 |

#### 错误码
| code | HTTP | 含义 | retryable |
| --- | --- | --- | --- |
| 0 | 200 | 成功 | 否 |
| -400 | 400 | 参数错误/签名错误 | 否 |
| -412 | 412 | 风控拦截 | 否 |
| 5xx | 500 | 服务端异常 | 是 |

#### 请求示例
```bash
curl -G 'https://api.bilibili.com/x/web-interface/wbi/search/type' \
  --data-urlencode 'search_type=video' \
  --data-urlencode 'keyword=少年' \
  --data-urlencode 'order=totalrank' \
  --data-urlencode 'duration=0' \
  --data-urlencode 'page=1' \
  --data-urlencode 'wts=<unix_ts>' \
  --data-urlencode 'w_rid=<wbi_signature>' \
  -b 'buvid3=<value>; SESSDATA=<value>'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "0",
  "ttl": 1,
  "data": {
    "page": 1,
    "pagesize": 20,
    "numResults": 1000,
    "numPages": 50,
    "result": [
      {
        "type": "video",
        "aid": 78977417,
        "bvid": "BV1KJ411C7Un",
        "title": "示例搜索结果",
        "author": "示例UP主"
      }
    ]
  }
}
```

#### 失败响应示例
```json
{
  "code": -400,
  "message": "请求错误",
  "ttl": 1,
  "data": null
}
```

#### OpenAPI 3.0 片段
```yaml
openapi: 3.0.3
info:
  title: Bilibili Search Request APIs
  version: "1.0.0"
paths:
  /x/web-interface/wbi/search/type:
    get:
      summary: 分类搜索（Web）
      parameters:
        - name: search_type
          in: query
          required: true
          schema:
            type: string
            enum: [video, media_bangumi, media_ft, live, live_room, live_user, article, topic, bili_user, photo]
        - name: keyword
          in: query
          required: true
          schema:
            type: string
        - name: page
          in: query
          required: false
          schema:
            type: integer
            default: 1
            minimum: 1
        - name: wts
          in: query
          required: true
          schema:
            type: integer
        - name: w_rid
          in: query
          required: true
          schema:
            type: string
      responses:
        "200":
          description: 成功
```

## 5. 兼容性与迁移说明
- 历史路径 `/x/web-interface/search/all/v2` 与 `/x/web-interface/search/type` 可视为旧链路，建议优先使用 `wbi` 路径。
- 若内部网关封装了签名，可在网关层统一注入 `wts/w_rid`，客户端仅提交业务参数。

## 6. 变更记录
- 2026-04-18：完成首版企业级重构，统一鉴权前置、分页语义、错误模型与 OpenAPI 片段。
