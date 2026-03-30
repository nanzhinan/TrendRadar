## 本地调试步骤

#### 安装 uv

pip install uv

#### 创建虚拟环境

uv venv .venv

#### 激活虚拟环境

.venv\Scripts\activate

#### 安装项目依赖

uv sync

#### 然后安装 debugpy

pip install debugpy

#### 配置 launch.json

运行即可
