# Greenplum Exporter的RPM安装包制作

## 一、 环境安装

以root权限执行如下命令：

```
yum install rpmdevtools 
```

## 二、操作步骤

以非root账号执行如下命令：

```
git clone http://gitee.com/inrgihc/rpm-greenplum-exporter.git
mv rpm-greenplum-exporter ~/rpmbuild
cd ~/rpmbuild/ && make build
ls -l RPMS/x86_64/
```

## 三、使用教程

- 安装软件

```
[root@localhost ~]# rpm -ivh greenplum_exporter-1.X-rhel7.x86_64.rpm
```

- 配置连接信息

配置文件所在目录: /usr/local/greenplum_exporter/etc/
```
[root@locahost ~]# cd /usr/local/greenplum_exporter/etc/
[root@localhost etc]# ll
total 4
-rw-r----- 1 prometheus prometheus 103 Feb 26 21:55 greenplum.conf
```

配置文件greenplum.conf的内容默认为：

```
GPDB_DATA_SOURCE_URL=postgres://gpadmin:gpadmin@127.0.0.1:5432/postgres?sslmode=disable
```

GPDB_DATA_SOURCE_URL指定了连接Greenplum数据库的连接串

- 启动服务

```
[root@localhost ~]# systemctl start greenplum_exporter
```

- 查看状态

```
[root@localhost ~]# systemctl status greenplum_exporter
```

- 查看日志

```
[root@localhost ~]# journalctl -u greenplum_exporter.service -f
```

- 服务验证

```
curl 'http://127.0.0.1:9297/metrics'
```

- 卸载软件

```
[root@localhost ~]# rpm -qa | grep greenplum_exporter
greenplum_exporter-1.1-rhel7.x86_64
[root@localhost ~]# rpm -e greenplum_exporter-1.X-rhel7.x86_64
```

