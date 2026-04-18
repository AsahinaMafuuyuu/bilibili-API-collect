# 搜索热词与默认词 API（企业级重构）

## 1. 文档范围
- 源文档：`docs/search/hot.md`
- 重构目标：统一四个“热词/默认词”相关接口的鉴权、参数、错误模型与示例。
- 产物路径：`Rebuild-Api-Docs/search/hot.md`

## 2. 接口清单
| 编号 | 接口用途 | 方法 | 路径 |
| --- | --- | --- | --- |
| HOT-01 | 获取默认搜索词（Web） | GET | `/x/web-interface/wbi/search/default` |
| HOT-02 | 获取热搜榜（Web WBI） | GET | `/x/web-interface/wbi/search/square` |
| HOT-03 | 获取热搜榜（Search 服务） | GET | `/main/hotword` |
| HOT-04 | 获取热搜榜（App） | GET | `/x/v2/search/trending/ranking` |

## 3. 统一约定
### 3.1 认证与鉴权
- `HOT-01`、`HOT-02`：需要 WBI 签名；建议携带有效 Cookie（至少含 `buvid3`）。
- `HOT-03`、`HOT-04`：公开查询接口，无强制登录。

### 3.2 限流与幂等
- 四个接口均为 `GET` 且幂等。
- 建议客户端节流：同一关键词或榜单请求间隔不少于 1 秒。

### 3.3 统一错误对象（重构规范）
- 上游原始响应通常只有 `code/message`。
- 文档层统一约定客户端转换为如下对象，便于日志与告警聚合：

```json
{
  "http_status": 412,
  "code": -412,
  "reason": "Request blocked by risk control",
  "retryable": false,
  "trace_id": "optional-from-gateway"
}
```

## 4. 接口定义
### 4.1 HOT-01 获取默认搜索词（Web）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/x/web-interface/wbi/search/default` |
| 鉴权 | WBI 签名 |
| 版本 | v1（当前文档快照） |

#### 请求参数
无业务参数。

#### 成功响应
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| code | integer | 是 | 业务状态码，`0` 为成功 |
| message | string | 是 | 提示信息 |
| ttl | integer | 是 | 通常为 `1` |
| data.seid | string | 是 | 搜索链路标识 |
| data.show_name | string | 是 | 默认显示文案 |
| data.goto_type | integer | 是 | 跳转类型，常见 `1`（视频） |
| data.goto_value | string | 是 | 跳转目标 ID |
| data.url | string | 是 | 跳转链接 |

#### 错误码
| code | HTTP | 含义 | retryable |
| --- | --- | --- | --- |
| 0 | 200 | 成功 | 否 |
| -400 | 400 | 参数错误或签名错误 | 否 |
| -412 | 412 | 风控拦截 | 否 |

#### 请求示例
```bash
curl -G 'https://api.bilibili.com/x/web-interface/wbi/search/default' \
  --data-urlencode 'wts=<unix_ts>' \
  --data-urlencode 'w_rid=<wbi_signature>'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "0",
  "ttl": 1,
  "data": {
    "seid": "17607543598496143098",
    "show_name": "示例默认搜索词",
    "goto_type": 1,
    "goto_value": "243920322",
    "url": "https://www.bilibili.com/video/BV1Tv411q7gx"
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
  title: Bilibili Search Hot APIs
  version: "1.0.0"
paths:
  /x/web-interface/wbi/search/default:
    get:
      summary: 获取默认搜索词（Web）
      parameters:
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

### 4.2 HOT-02 获取热搜榜（Web WBI）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/x/web-interface/wbi/search/square` |
| 鉴权 | WBI 签名 |

#### 请求参数
| 参数 | 类型 | 必填 | 默认值 | 约束 |
| --- | --- | --- | --- | --- |
| limit | integer | 是 | - | 范围 `1~50` |
| platform | string | 否 | `web` | 当前支持 `web` |

#### 成功响应
`data.trending.list[]` 字段：
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| keyword | string | 是 | 热词关键词 |
| show_name | string | 是 | 展示文案 |
| icon | string | 否 | 图标 URL |
| uri | string | 否 | 跳转 URI（可能为空） |
| goto | string | 否 | 跳转类型（可能为空） |

#### 错误码
| code | HTTP | 含义 |
| --- | --- | --- |
| 0 | 200 | 成功 |
| -400 | 400 | 参数错误 |
| -412 | 412 | 风控拦截 |

#### 请求示例
```bash
curl -G 'https://api.bilibili.com/x/web-interface/wbi/search/square' \
  --data-urlencode 'limit=10' \
  --data-urlencode 'platform=web' \
  --data-urlencode 'wts=<unix_ts>' \
  --data-urlencode 'w_rid=<wbi_signature>'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "0",
  "ttl": 1,
  "data": {
    "trending": {
      "title": "bilibili热搜",
      "trackid": "8079760748892487175",
      "list": [
        {
          "keyword": "示例热词",
          "show_name": "示例热词",
          "icon": "https://i0.hdslb.com/example.png",
          "uri": "",
          "goto": ""
        }
      ],
      "top_list": []
    }
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
  title: Bilibili Search Hot APIs
  version: "1.0.0"
paths:
  /x/web-interface/wbi/search/square:
    get:
      summary: 获取热搜榜（Web WBI）
      parameters:
        - name: limit
          in: query
          required: true
          schema:
            type: integer
            minimum: 1
            maximum: 50
        - name: platform
          in: query
          required: false
          schema:
            type: string
            default: web
```

### 4.3 HOT-03 获取热搜榜（Search 服务）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/main/hotword` |
| Host | `s.search.bilibili.com` |
| 鉴权 | 无 |

#### 请求参数
无业务参数。

#### 成功响应
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| code | integer | 是 | `0` 成功 |
| message | string | 是 | 默认 `success` |
| timestamp | integer | 是 | 榜单统计时间戳 |
| list | array | 是 | 热词列表（通常前 10） |

#### 错误码
| code | HTTP | 含义 |
| --- | --- | --- |
| 0 | 200 | 成功 |
| 非0 | 4xx/5xx | 服务异常 |

#### 请求示例
```bash
curl 'https://s.search.bilibili.com/main/hotword'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "success",
  "timestamp": 1596034742,
  "list": [
    {
      "keyword": "示例热词",
      "show_name": "示例热词",
      "pos": 1,
      "word_type": 8,
      "icon": "https://i0.hdslb.com/example.png"
    }
  ]
}
```

#### 失败响应示例
```json
{
  "code": 500100,
  "message": "internal error",
  "list": []
}
```

#### OpenAPI 3.0 片段
```yaml
openapi: 3.0.3
info:
  title: Bilibili Search Hot APIs
  version: "1.0.0"
paths:
  /main/hotword:
    get:
      summary: 获取热搜榜（Search 服务）
      responses:
        "200":
          description: 成功
```

### 4.4 HOT-04 获取热搜榜（App）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| 路径 | `/x/v2/search/trending/ranking` |
| Host | `app.bilibili.com` |
| 鉴权 | 无（可匿名） |

#### 请求参数
| 参数 | 类型 | 必填 | 默认值 | 约束 |
| --- | --- | --- | --- | --- |
| limit | integer | 否 | `20` | 最大 `100` |

#### 成功响应
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| code | integer | 是 | 业务状态码 |
| message | string | 是 | 提示信息 |
| data.trackid | string | 否 | 追踪 ID |
| data.list | array | 是 | 热词列表 |
| data.list[].position | integer | 是 | 名次 |
| data.list[].keyword | string | 是 | 关键词 |
| data.list[].show_name | string | 是 | 展示文案 |
| data.list[].word_type | integer | 是 | 条目类型 |
| data.list[].hot_id | integer | 是 | 热词 ID |

#### 错误码
| code | HTTP | 含义 |
| --- | --- | --- |
| 0 | 200 | 成功 |
| -400 | 400 | 参数错误 |

#### 请求示例
```bash
curl -G 'https://app.bilibili.com/x/v2/search/trending/ranking' \
  --data-urlencode 'limit=20'
```

#### 成功响应示例
```json
{
  "code": 0,
  "message": "0",
  "ttl": 1,
  "data": {
    "trackid": "2578006123492681222",
    "list": [
      {
        "position": 1,
        "keyword": "示例热词",
        "show_name": "示例热词",
        "word_type": 5,
        "hot_id": 107814
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
  title: Bilibili Search Hot APIs
  version: "1.0.0"
paths:
  /x/v2/search/trending/ranking:
    get:
      summary: 获取热搜榜（App）
      parameters:
        - name: limit
          in: query
          required: false
          schema:
            type: integer
            default: 20
            maximum: 100
      responses:
        "200":
          description: 成功
```

## 5. 变更记录
- 2026-04-18：首版企业级重构，统一字段定义、错误模型与 OpenAPI 片段。
