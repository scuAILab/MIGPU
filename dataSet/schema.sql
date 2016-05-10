drop table if exists user;
create table user (
  user_id integer primary key autoincrement,   --用户的id
  user_name varchar(200) not null UNIQUE,      --用户登录的名称
  passwd varchar(200) not null                 --用户登录所用的密码
);

drop table if exists server;
create table server (
  server_id integer primary key autoincrement,--服务器的id
  ip varchar(200) not null UNIQUE,            --服务器的ip
  memory_total integer,                       --总的内存
  memory_surplus integer,                     --剩余内存
  work_total integer,                         --在此节点上总的任务
  work_is_on integer                          --正在运行着的任务
);

drop table if exists device;
create table device (
  device_id integer primary key autoincrement,--设备的id
  deivce_type varchar(200) not null,                  --设备的型号信息
  memory_total integer,                       --显存大小
  memory_surplus integer,                     --可用显存大小
  is_busy boolean,                            --是否是正忙
  work_total integer                          --分配的总任务数
);

drop table if exists work;
create table work (
  work_id integer primary key autoincrement, --任务id
  work_name text not null,                   --任务名称（直接保存启动任务的命令）
  time_begin integer,                        --开始的时间
  time_end integer,                          --结束的时间
  state char,                                --状态（'on'表示正在运行，'wait'表示正在挂起等待）
  server_id integer,                         --分配的服务器
  deivice_id integer,                        --分配的设备
  container_id varchar(200),                 --分配的容器
  FOREIGN KEY (server_id) REFERENCES server(server_id),
  FOREIGN KEY (deivice_id) REFERENCES device(deivice_id)
);

drop table if exists schedule;
create table schedule (
  user_id integer ,                          --任务所属的用户id
  work_id integer,                           --任务的id
  have_on_time integer,                      --已经运行的时间
  time_surplus integer,                      --任务所剩余的时间
  PRIMARY KEY (work_id,user_id),
  FOREIGN KEY (work_id) REFERENCES work(work_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

drop table if exists work_on_device;
create table work_on_device (
  work_id integer ,                          --任务id
  device_id integer,                         --任务所属的设备id
  state char,                                --任务状态
  time_state integer,                        --任务启动的时间
  PRIMARY KEY (work_id,device_id),
  FOREIGN KEY (device_id) REFERENCES device(device_id),
  FOREIGN KEY (work_id) REFERENCES work(work_id)
);
