# Rollin' Ace 维基

Rollin' Ace（棒球方块小游戏）的官方维基站点。汇总了游戏的基础操作、策略玩法与主要页面导航，帮助玩家快速上手并做出更优决策。

## 目录结构

```
rollinace_wiki/
├── index.html      # 首页：站点简介 + 三大板块导航
├── basics.html     # 01 · 基础操作介绍
├── strategy.html   # 02 · 游戏策略玩法
├── nav.html        # 03 · 主要页面快速导航
├── css/
│   └── wiki.css    # 样式（与游戏站一致的深绿棒球主题）
├── edgeone.json    # EdgeOne Pages 部署配置
└── README.md
```

## 页面内容

| 页面 | 路径 | 内容 |
|---|---|---|
| 首页 | `/` | 站点简介、三大板块入口 |
| 基础操作 | `/basics.html` | 掷主方块、二选一决策、好坏球打席与投手档位、过关/失败、六大道具及获取途径、棒球规则要点 |
| 策略玩法 | `/strategy.html` | 核心概率模型、二选一决策矩阵、道具优先级、好坏球攻防与投手选档、各模式专项策略、决策树与速查表 |
| 页面导航 | `/nav.html` | 单人玩法 / 实时玩法观战 / 其他页面的入口与路径 |

## 本地启动

纯静态站点，无需构建、无需安装依赖。在项目根目录任选一种静态服务器：

**Python：**
```bash
cd /Users/yoko/workspace/ra_project/rollin_wiki
python3 -m http.server 8091
```

**Node：**
```bash
cd /Users/yoko/workspace/ra_project/rollin_wiki
npx http-server -p 8091
```

启动后浏览器访问 <http://localhost:8091/> 即可体验，页间通过顶部导航切换。

## 部署到 EdgeOne Pages

本项目为独立 EdgeOne Pages 静态站点：

1. 将 `rollinace_wiki` 目录内容上传为新的 EdgeOne Pages 项目。
2. `edgeone.json` 已配置 `/`、`/basics`、`/strategy`、`/nav` 的 `rewrites`：
   - `/basics` → `basics.html`
   - `/strategy` → `strategy.html`
   - `/nav` → `nav.html`
3. 页面内链接使用 `xxx.html` 完整路径，本地与线上均可靠。

## 内容来源

维基内容整理自项目技能指南：

- `skills/rollin-ace-game-guide.md`（游戏操作指南）
- `skills/rollin-ace-strategy-guide.md`（游戏策略指南）

> 休闲玩法攻略，非真实棒球竞技，请勿代入现实。