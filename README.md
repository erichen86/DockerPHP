# 在Mac下运行Docker

## 环境要求

Mac系统，已经安装过以下组件：

- VirtualBox
- git
- Homebrew
- pip

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install wget
sudo easy_install pip
```

## 安装Docker Toolbox


下载 [Docker Toolbox](https://www.docker.com/products/docker-toolbox)



## 使用DockerPHP

准备基础的目录，由于Mac下默认允许挂载/Users/的文件，因此本套方案将系统文件挂载位置强制设置为`~/opt/`

- ~/opt/data   存放MySQL数据库
- ~/opt/htdocs 项目代码
- ~/opt/log    存放所有输出的Log

创建这些目录:

```
mkdir ~/opt ~/opt/data ~/opt/data/memcached ~/opt/data/mysql ~/opt/data/redis ~/opt/log ~/opt/log/nginx ~/opt/log/php ~/opt/htdocs
```

Clone本项目

```
cd ~/opt/htdocs
git clone https://github.com/erichen86/DockerPHP.git
cd DockerPHP
```

下载镜像及构建

```
make dl
make build
```

构建及运行环境

```
docker-compose build
docker-compose up -d
```

绑定域名

```
sudo vi /etc/hosts
加入
192.168.99.100 docker
192.168.99.100 laravel.app
192.168.99.100 admin.laravel.app
```

现在可以通过访问`http://docker/`来查看Web服务器根目录


构建Laravel项目文件

```
composer create-project laravel/laravel laravel --prefer-dist "5.1.*"
```


