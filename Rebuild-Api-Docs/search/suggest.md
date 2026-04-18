# 搜索建议 API（企业级重构）

## 1. 文档范围
- 源文档：`docs/search/suggest.md`
- 重构产物：`Rebuild-Api-Docs/search/suggest.md`
- 目标：将搜索建议接口升级为可执行、可检查、可导入的企业级文档。

## 2. 接口定义
### 2.1 SUGGEST-01 获取搜索建议（Web）
#### 接口信息
| 项 | 值 |
| --- | --- |
| 方法 | `GET` |
| Host | `s.search.bilibili.com` |
| 路径 | `/main/suggest` |
| 鉴权 | 无强制登录；建议携带 `buvid3` 提升稳定性 |
| 幂等性 | 幂等 |

#### 请求参数
| 参数 | 类型 | 必填 | 默认值 | 约束/枚举 |
| --- | --- | --- | --- | --- |
| term | string | 是 | - | 用户输入关键词 |
| main_ver | string | 否 | `v1` | 固定建议 `v1` |
| highlight | string | 否 | 空 | 高亮开关字段（上游语义不稳定） |
| func | string | 否 | `suggest` | 固定建议值 |
| suggest_type | string | 否 | `accurate` | 建议类型 |
| sub_type | string | 否 | `tag` | 子类型 |
| userid | integer | 否 | - | 用户 mid（用于个性化） |
| tag_num | integer | 否 | `10` | 返回 tag 数量上限 |
| special_num | integer | 否 | `10` | 返回 special 数量上限 |
| bangumi_num | integer | 否 | `10` | 返回番剧建议数量上限 |
| upuser_num | integer | 否 | `3` | 返回 UP 主建议数量上限 |
| rnd | number | 否 | - | 随机浮点值 |
| buvid | string | 否 | - | 对齐 Cookie 的 `buvid3` |
| spmid | string | 否 | `333.1007` | 来源位标识 |

#### 成功响应
| 字段 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| code | integer | 是 | 业务状态码，`0` 为成功 |
| exp_str | string | 否 | 实验桶信息 |
| stoken | string | 否 | 会话标识 |
| result.tag | array | 是 | 建议词列表 |
| result.tag[].value | string | 是 | 建议关键词 |
| result.tag[].term | string | 否 | 与 value 通常一致 |
| result.tag[].name | string | 是 | 带高亮 HTML 的展示文案 |
| result.tag[].ref | integer | 否 | 引用值 |
| result.tag[].spid | integer | 否 | 策略 ID |
| result.tag[].type | string | 否 | 条目类型 |

#### 错误码
| code | HTTP | 含义 | retryable |
| --- | --- | --- | --- |
| 0 | 200 | 成功 | 否 |
| -400 | 400 | 请求参数错误 | 否 |
| -412 | 412 | 风控拦截 | 否 |
| 5xx | 500 | 服务端异常 | 是 |

#### 请求示例
```bash
curl -G 'https://s.search.bilibili.com/main/suggest' \
  --data-urlencode 'term=洛天依' \
  --data-urlencode 'main_ver=v1' \
  --data-urlencode 'func=suggest' \
  --data-urlencode 'suggest_type=accurate' \
  --data-urlencode 'sub_type=tag'
```

#### 成功响应示例
```json
{
  "exp_str": "106301_106700",
  "code": 0,
  "result": {
    "tag": [
      {
        "value": "洛天依",
        "term": "洛天依",
        "ref": 0,
        "name": "<em class=\"suggest_high_light\">洛天依</em>",
        "spid": 5,
        "type": ""
      }
    ]
  },
  "stoken": "4020133863501304726"
}
```

#### 失败响应示例
```json
{
  "code": -400,
  "message": "bad request",
  "result": {
    "tag": []
  }
}
```

#### OpenAPI 3.0 片段
```yaml
openapi: 3.0.3
info:
  title: Bilibili Search Suggest API
  version: "1.0.0"
paths:
  /main/suggest:
    get:
      summary: 获取搜索建议（Web）
      parameters:
        - name: term
          in: query
          required: true
          schema:
            type: string
        - name: main_ver
          in: query
          required: false
          schema:
            type: string
            default: v1
        - name: suggest_type
          in: query
          required: false
          schema:
            type: string
            default: accurate
        - name: tag_num
          in: query
          required: false
          schema:
            type: integer
            default: 10
      responses:
        "200":
          description: 成功
          content:
            application/json:
              schema:
                type: object
                properties:
                  code:
                    type: integer
                  exp_str:
                    type: string
                  stoken:
                    type: string
                  result:
                    type: object
                    properties:
                      tag:
                        type: array
                        items:
                          type: object
                          properties:
                            value:
                              type: string
                            term:
                              type: string
                            name:
                              type: string
                            ref:
                              type: integer
                            spid:
                              type: integer
                            type:
                              type: string
```

## 3. 统一错误对象（推荐）
```json
{
  "http_status": 400,
  "code": -400,
  "reason": "Invalid query parameter: term",
  "retryable": false,
  "trace_id": "optional-from-gateway"
}
```

## 4. 变更记录
- 2026-04-18：完成企业级结构化重构；补齐参数约束、错误语义和 OpenAPI 片段。
