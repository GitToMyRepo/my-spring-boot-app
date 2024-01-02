# Overview
This is a very **Simple** dockerized Spring Boot/MySQL project

# Build
## Docker Build
In a 'clean' Docker Desktop, execute the following commands in PowerShell:
```
docker run -p 3307:3306 --name my-mysql-container -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=mydatabase mysql:latest

docker network create spring-mysql-docker-network

docker network connect spring-mysql-docker-network my-mysql-container

docker build -t springboot-mysql-docker-image .

docker run -p 8080:8080 --name springboot-mysql-docker-container --net spring-mysql-docker-network -e MYSQL_HOST=my-mysql-container -e MYSQL_USER=root -e MYSQL_PASSWORD=my-secret-pw -e MYSQL_PORT=3306 springboot-mysql-docker-image

```

## Docker Compose Build
In a 'clean' Docker Desktop, execute the following command in PowerShell:
```
docker-compose up
```
These are the expected logs
```
PS C:\dev\my-spring-boot-app> docker-compose up
[+] Building 3.8s (8/8) FINISHED                                                                                                                                                                  docker:default
 => [springboot-mysql-container internal] load build definition from Dockerfile                                                                                                                             0.0s
 => => transferring dockerfile: 245B                                                                                                                                                                        0.0s
 => [springboot-mysql-container internal] load .dockerignore                                                                                                                                                0.0s
 => => transferring context: 2B                                                                                                                                                                             0.0s
 => [springboot-mysql-container internal] load metadata for docker.io/library/openjdk:8-jdk-alpine                                                                                                          3.7s
 => [springboot-mysql-container 1/3] FROM docker.io/library/openjdk:8-jdk-alpine@sha256:94792824df2df33402f201713f932b58cb9de94a0cd524164a0f2283343547b3                                                    0.0s
 => [springboot-mysql-container internal] load build context                                                                                                                                                0.0s
 => => transferring context: 94B                                                                                                                                                                            0.0s
 => CACHED [springboot-mysql-container 2/3] WORKDIR /app                                                                                                                                                    0.0s
 => CACHED [springboot-mysql-container 3/3] COPY target/my-spring-boot-app-0.0.1-SNAPSHOT.jar my-spring-boot-app-0.0.1-SNAPSHOT.jar                                                                         0.0s
 => [springboot-mysql-container] exporting to image                                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                                                     0.0s
 => => writing image sha256:2701d1b898d3eafcf52dfbde3ed0bbd881cc2632776a5b0ed5bf026d440c26a9                                                                                                                0.0s
 => => naming to docker.io/library/my-spring-boot-app-springboot-mysql-container                                                                                                                            0.0s
[+] Running 3/2
 ✔ Network my-spring-boot-app_spring-mysql-docker-network     Created                                                                                                                                       0.0s
 ✔ Container my-spring-boot-app-my-mysql-container-1          Created                                                                                                                                       0.1s
 ✔ Container my-spring-boot-app-springboot-mysql-container-1  Created                                                                                                                                       0.1s
Attaching to my-mysql-container-1, springboot-mysql-container-1
my-mysql-container-1          | 2024-01-02 21:11:21+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.2.0-1.el8 started.
my-mysql-container-1          | 2024-01-02 21:11:22+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
my-mysql-container-1          | 2024-01-02 21:11:22+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.2.0-1.el8 started.
my-mysql-container-1          | 2024-01-02 21:11:22+00:00 [Note] [Entrypoint]: Initializing database files
my-mysql-container-1          | 2024-01-02T21:11:22.358797Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
my-mysql-container-1          | 2024-01-02T21:11:22.360334Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
my-mysql-container-1          | 2024-01-02T21:11:22.360952Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.2.0) initializing of server in progress as process 80
my-mysql-container-1          | 2024-01-02T21:11:22.375286Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
my-mysql-container-1          | 2024-01-02T21:11:22.945454Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
my-mysql-container-1          | 2024-01-02T21:11:24.853310Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
my-mysql-container-1          | 2024-01-02T21:11:29.219677Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.
my-mysql-container-1          | 2024-01-02 21:11:29+00:00 [Note] [Entrypoint]: Database files initialized
my-mysql-container-1          | 2024-01-02 21:11:29+00:00 [Note] [Entrypoint]: Starting temporary server
my-mysql-container-1          | 2024-01-02T21:11:29.348918Z 0 [System] [MY-015015] [Server] MySQL Server - start.
my-mysql-container-1          | 2024-01-02T21:11:29.569022Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
my-mysql-container-1          | 2024-01-02T21:11:29.570617Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.2.0) starting as process 124
my-mysql-container-1          | 2024-01-02T21:11:29.585921Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
my-mysql-container-1          | 2024-01-02T21:11:29.737746Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
my-mysql-container-1          | 2024-01-02T21:11:30.015883Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
my-mysql-container-1          | 2024-01-02T21:11:30.015917Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
my-mysql-container-1          | 2024-01-02T21:11:30.019288Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
my-mysql-container-1          | 2024-01-02T21:11:30.032626Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
my-mysql-container-1          | 2024-01-02T21:11:30.032665Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.2.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
my-mysql-container-1          | 2024-01-02T21:11:30.034384Z 0 [System] [MY-015016] [Server] MySQL Server - end.
my-mysql-container-1          | 2024-01-02 21:11:30+00:00 [Note] [Entrypoint]: Temporary server started.
my-mysql-container-1          | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
my-mysql-container-1          | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
my-mysql-container-1          | 2024-01-02 21:11:32+00:00 [Note] [Entrypoint]: Creating database mydatabase
my-mysql-container-1          |
my-mysql-container-1          | 2024-01-02 21:11:32+00:00 [Note] [Entrypoint]: Stopping temporary server
my-mysql-container-1          | 2024-01-02T21:11:32.049125Z 11 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.2.0).
my-mysql-container-1          | 2024-01-02T21:11:34.035758Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.2.0)  MySQL Community Server - GPL.
my-mysql-container-1          | 2024-01-02T21:11:34.039232Z 0 [System] [MY-015016] [Server] MySQL Server - end.
my-mysql-container-1          | 2024-01-02 21:11:34+00:00 [Note] [Entrypoint]: Temporary server stopped
my-mysql-container-1          |
my-mysql-container-1          | 2024-01-02 21:11:34+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
my-mysql-container-1          |
my-mysql-container-1          | 2024-01-02T21:11:34.059128Z 0 [System] [MY-015015] [Server] MySQL Server - start.
my-mysql-container-1          | 2024-01-02T21:11:34.227462Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
my-mysql-container-1          | 2024-01-02T21:11:34.228187Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.2.0) starting as process 1
my-mysql-container-1          | 2024-01-02T21:11:34.233600Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
my-mysql-container-1          | 2024-01-02T21:11:34.353821Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
my-mysql-container-1          | 2024-01-02T21:11:34.514707Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
my-mysql-container-1          | 2024-01-02T21:11:34.514750Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
my-mysql-container-1          | 2024-01-02T21:11:34.519776Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
my-mysql-container-1          | 2024-01-02T21:11:34.532356Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
my-mysql-container-1          | 2024-01-02T21:11:34.532457Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.2.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
springboot-mysql-container-1  |
springboot-mysql-container-1  |   .   ____          _            __ _ _
springboot-mysql-container-1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
springboot-mysql-container-1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
springboot-mysql-container-1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
springboot-mysql-container-1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
springboot-mysql-container-1  |  =========|_|==============|___/=/_/_/_/
springboot-mysql-container-1  |  :: Spring Boot ::                (v2.7.2)
springboot-mysql-container-1  |
springboot-mysql-container-1  | 2024-01-02 21:11:53.298  INFO 1 --- [           main] com.example.MySpringBootAppApplication   : Starting MySpringBootAppApplication v0.0.1-SNAPSHOT using Java 1.8.0_212 on 27be4c01c7d9 with PID 1 (/app/my-spring-boot-app-0.0.1-SNAPSHOT.jar started by root in /app)
springboot-mysql-container-1  | 2024-01-02 21:11:53.301  INFO 1 --- [           main] com.example.MySpringBootAppApplication   : No active profile set, falling back to 1 default profile: "default"
springboot-mysql-container-1  | 2024-01-02 21:11:54.222  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data JPA repositories in DEFAULT mode.
springboot-mysql-container-1  | 2024-01-02 21:11:54.271  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 39 ms. Found 1 JPA repository interfaces.
springboot-mysql-container-1  | 2024-01-02 21:11:54.988  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
springboot-mysql-container-1  | 2024-01-02 21:11:55.007  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
springboot-mysql-container-1  | 2024-01-02 21:11:55.008  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.65]
springboot-mysql-container-1  | 2024-01-02 21:11:55.124  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
springboot-mysql-container-1  | 2024-01-02 21:11:55.124  INFO 1 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1761 ms
springboot-mysql-container-1  | 2024-01-02 21:11:55.376  INFO 1 --- [           main] o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo [name: default]
springboot-mysql-container-1  | 2024-01-02 21:11:55.436  INFO 1 --- [           main] org.hibernate.Version                    : HHH000412: Hibernate ORM core version 5.6.10.Final
springboot-mysql-container-1  | 2024-01-02 21:11:55.607  INFO 1 --- [           main] o.hibernate.annotations.common.Version   : HCANN000001: Hibernate Commons Annotations {5.1.2.Final}
springboot-mysql-container-1  | 2024-01-02 21:11:55.704  INFO 1 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
springboot-mysql-container-1  | 2024-01-02 21:11:56.015  INFO 1 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
springboot-mysql-container-1  | 2024-01-02 21:11:56.059  INFO 1 --- [           main] org.hibernate.dialect.Dialect            : HHH000400: Using dialect: org.hibernate.dialect.MySQL8Dialect
springboot-mysql-container-1  | Hibernate:
springboot-mysql-container-1  |
springboot-mysql-container-1  |     create table user (
springboot-mysql-container-1  |        id bigint not null auto_increment,
springboot-mysql-container-1  |         email varchar(255),
springboot-mysql-container-1  |         username varchar(255),
springboot-mysql-container-1  |         primary key (id)
springboot-mysql-container-1  |     ) engine=InnoDB
springboot-mysql-container-1  | 2024-01-02 21:11:56.644  INFO 1 --- [           main] o.h.e.t.j.p.i.JtaPlatformInitiator       : HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
springboot-mysql-container-1  | 2024-01-02 21:11:56.652  INFO 1 --- [           main] j.LocalContainerEntityManagerFactoryBean : Initialized JPA EntityManagerFactory for persistence unit 'default'
springboot-mysql-container-1  | 2024-01-02 21:11:57.117  WARN 1 --- [           main] JpaBaseConfiguration$JpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
```

# Test
## Set up test data
Execute the following command in a PowerShell and SQL after the containers are up
```
PS C:\Users\kenwu> docker exec -it my-spring-boot-app-my-mysql-container-1 bash
bash-4.4# mysql -uroot -pmy-secret-pw
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.2.0 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydatabase         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use mydatabase;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| user                 |
+----------------------+
1 row in set (0.00 sec)

mysql> describe user;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | bigint       | NO   | PRI | NULL    | auto_increment |
| email    | varchar(255) | YES  |     | NULL    |                |
| username | varchar(255) | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into user (email, username) values ('ken@gmail.com', 'ken');
Query OK, 1 row affected (0.01 sec)

mysql> insert into user (email, username) values ('jonny@gmail.com', 'john');
Query OK, 1 row affected (0.01 sec)
```

## Run the test
Execute the following commands in a Command Prompt:
```
C:\Users\kenwu>curl http://localhost:8080/api/health
OK

C:\Users\kenwu>curl http://localhost:8080/api/users
[{"id":1,"username":"ken","email":"ken@gmail.com"},{"id":2,"username":"john","email":"jonny@gmail.com"}]
```
