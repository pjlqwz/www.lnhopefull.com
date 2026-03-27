# 千羽网络官网设计规范 v2.0

## 一、网站结构

```
www.lnhopefull.com/
│
├── index.html                    # 首页
│
├── opc/                          # 一人公司栏目
│   ├── index.html                 # 一人公司概述
│   ├── solution.html             # 解决方案
│   ├── cases.html                # 案例展示
│   └── pricing.html              # 定价
│
├── opd/                          # 一人部门栏目
│   ├── index.html                 # 一人部门概述
│   ├── solution.html             # 解决方案
│   ├── cases.html                # 案例展示
│   └── pricing.html              # 定价
│
├── custom/                       # 定制服务栏目
│   ├── index.html                 # 定制服务概述
│   ├── process.html              # 服务流程
│   └── cases.html                # 案例
│
├── news/                         # 新闻中心
│   ├── index.html                 # 新闻列表
│   └── {slug}.html              # 文章详情（动态）
│
├── about/                        # 关于我们
│   ├── index.html                 # 公司介绍
│   └── contact.html              # 联系方式
│
├── css/
│   └── style.css                 # 主样式文件
│
├── js/
│   └── main.js                   # 主脚本文件
│
├── img/                          # 图片资源
│   ├── logo.png                  # Logo
│   ├── favicon.ico               # Favicon
│   └── ...                       # 其他图片
│
└── fonts/                        # 字体资源（如需本地化）
```

## 二、视觉风格

### 配色方案（科技公司深色风格）

```css
:root {
    /* 主背景 - 深蓝黑 */
    --bg-primary: #0A1628;
    --bg-secondary: #111D32;
    --bg-card: #162040;
    
    /* 强调色 - 科技蓝 */
    --accent-primary: #00D4FF;
    --accent-secondary: #0EA5E9;
    --accent-glow: rgba(0, 212, 255, 0.3);
    
    /* 文字颜色 */
    --text-primary: #FFFFFF;
    --text-secondary: #94A3B8;
    --text-muted: #64748B;
    
    /* 渐变 */
    --gradient-hero: linear-gradient(135deg, #0A1628 0%, #1E3A5F 100%);
    --gradient-accent: linear-gradient(135deg, #00D4FF 0%, #0EA5E9 100%);
    
    /* 边框 */
    --border-subtle: rgba(255, 255, 255, 0.08);
    --border-accent: rgba(0, 212, 255, 0.3);
}
```

### 字体

```css
font-family: -apple-system, BlinkMacSystemFont, 
             "PingFang SC", "Microsoft YaHei", 
             "Helvetica Neue", Arial, sans-serif;
```

### 风格关键词

- **深色主题**：科技感、专业、可信
- **简洁留白**：内容为主，呼吸感强
- **霓虹点缀**：蓝色光效增加活力
- **几何元素**：线条、方块构建结构感

## 三、通用组件

### 导航栏
- 固定顶部，背景半透明毛玻璃效果
- Logo左侧，导航链接居中
- 右侧联系方式
- 滚动后背景加深

### 底部Footer
- 深色背景
- 三栏布局：公司信息、快速链接、联系方式
- 底部版权信息

### 按钮
```
主按钮：蓝色渐变背景，白色文字，圆角8px
次按钮：透明背景，蓝色边框，蓝色文字
```

### 卡片
- 深色背景 + 微妙边框
- 悬停：边框变蓝色发光效果
- 圆角：12-16px

## 四、首页结构

1. **Hero区**：大标题 + 副标题 + CTA按钮 + 背景粒子/网格效果
2. **核心价值**：3-4个图标卡片横排
3. **三大产品入口**：一人公司 / 一人部门 / 定制服务（卡片形式）
4. **数据展示**：数字动画效果（200+客户、500+案例等）
5. **客户案例**：2-3个精选案例展示
6. **新闻动态**：最新3条新闻
7. **CTA区**：立即咨询

## 五、响应式断点

```css
/* 移动端优先 */
@media (min-width: 768px) { ... }   /* 平板 */
@media (min-width: 1024px) { ... }  /* 桌面 */
@media (min-width: 1280px) { ... }  /* 大屏 */
```

## 六、技术要求

- 纯HTML + CSS + 原生JS（无框架依赖）
- Bootstrap 5（仅用于栅格系统，不使用其组件样式）
- Font Awesome 6 图标
- CSS动画 + IntersectionObserver实现滚动动画
- 所有CDN链接需测试可用性

## 七、文件命名规范

- HTML文件：`kebab-case`（连字符分隔）
- CSS类名：`kebab-case`
- JS变量：`camelCase`
- 图片：`kebab-case`

## 八、代码质量要求

- 语义化HTML标签
- CSS变量统一管理
- 代码注释清晰
- 无控制台错误
- 所有交互有反馈
