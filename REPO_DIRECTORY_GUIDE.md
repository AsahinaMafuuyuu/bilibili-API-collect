# Repository Directory Guide

## 这个仓库在做什么

这是一个以文档为核心的仓库，主要收集与整理 B 站相关接口信息：

- `docs/` 侧重 REST/业务接口的 Markdown 文档整理。
- `grpc_api/` 侧重 gRPC/Protobuf 协议定义（`.proto`）整理。
- 通过 VuePress 把文档构建成站点进行浏览。

## 顶层目录职责（目录级别）

- `.github/`
  - GitHub 协作与自动化配置。
  - 包含 Issue 模板和 CI/部署工作流（例如 VuePress 部署）。

- `.vuepress/`
  - 文档站点框架配置目录（VuePress）。
  - 包含站点配置、客户端扩展、主题布局和公开静态资源入口。

- `assets/`
  - 项目使用的图片等资源素材目录。
  - 例如 logo、分区图标等可复用静态资源。

- `docs/`
  - **核心文档内容库**。
  - 按业务域拆分子目录（如 `video`、`user`、`login`、`dynamic` 等），每个目录下是对应主题的 Markdown 文档。
  - 面向“接口说明与使用”层，偏阅读型内容。

- `grpc_api/`
  - **核心协议定义库**。
  - 按命名空间/业务域组织 `.proto` 文件（如 `bilibili`、`pgc`、`datacenter`）。
  - 面向“协议结构与 gRPC 定义”层，偏协议与数据结构。

## 大致目录结构（简化）

```text
bilibili-API-collect/
├─ .github/
│  ├─ ISSUE_TEMPLATE/
│  └─ workflows/
├─ .vuepress/
│  ├─ public/
│  ├─ theme/
│  ├─ client.js
│  └─ config.js
├─ assets/
│  ├─ img/
│  ├─ zone_icon/
│  └─ zone_v2_icon/
├─ docs/
│  ├─ activity/ article/ audio/ bangumi/ ...（大量业务分类）
│  ├─ login/ message/ user/ video/ dynamic/ ...
│  └─ misc/ search/ vip/ wallet/ ...
├─ grpc_api/
│  ├─ bilibili/
│  ├─ datacenter/
│  ├─ pgc/
│  └─ readme.md
├─ README.md
├─ CONTRIBUTING.md
├─ package.json
├─ LICENSE
└─ .gitignore
```

## 可以这样理解 `docs` vs `grpc_api`

- `docs`：偏“接口文档产品层”，告诉你这个接口怎么用、参数和返回是什么、场景是什么。
- `grpc_api`：偏“协议定义层”，告诉你消息结构和服务接口本身长什么样（`.proto`）。
- 两者互补：一个偏说明书，一个偏协议原型。
