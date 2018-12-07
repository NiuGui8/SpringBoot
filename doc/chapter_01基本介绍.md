## spring boot 学习笔记一
`spring boot` 的优点，约定大于配置，配置精简，启动项目步骤简化。可内置服务器，提供将项目打包成 jar 包的插件，即使是 web 项目，也可以通过 java -jar 命令启动，部署简单。等等 

### 安装

`spring boot` 没啥特别的，像其他项目中导入 jar 包一样， 可以直接把 `spring-boot-*.jar` 之类的 jar 包复制到项目中，也可以用 maven ，gradle 之类的工具导入进来

#### maven 安装

`spring boot` 支持 maven 3.3 及以上版本, `spring boot` 依赖使用的 `groupid` 是 `org.springframework.boot`.

一般来说， `spring boot ` 项目需要继承 `spring-boot-starter-parent` 这个项目和声明一个或多个项目启动需要的依赖，`spring boot`也提供了一些可选的 `maven` 插件，可打包可执行的 `jar` 包，下面是一个典型项目的 `pom.xml`:

	<?xml version="1.0" encoding="UTF-8"?>
	<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
		<modelVersion>4.0.0</modelVersion>
	
		<groupId>com.example</groupId>
		<artifactId>myproject</artifactId>
		<version>0.0.1-SNAPSHOT</version>
	
		<!-- Inherit defaults from Spring Boot -->
		<parent>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-parent</artifactId>
			<version>2.1.1.RELEASE</version>
		</parent>
	
		<!-- Add typical dependencies for a web application -->
		<dependencies>
			<dependency>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter-web</artifactId>
			</dependency>
		</dependencies>
	
		<!-- Package as an executable jar -->
		<build>
			<plugins>
				<plugin>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-maven-plugin</artifactId>
				</plugin>
			</plugins>
		</build>
	
	</project>


继承 `spring-boot-starter-parent` 是使用 `spring boot` 一种很好的方式， 但是这种方式并不能适应所有的情况，有时候你可能需要继承不同的 parent , 也有可能不想要它默认的设置，所以这不是唯一的方案（其他方案后面的章节会讲到）。


#### Gradle 安装

[https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-gradle-installation](https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-gradle-installation)

### 安装 Spring boot cli

`spring boot` 提供命令行工具，可以帮你快速的建立原型，它执行的是 	`Groovy` 脚本， 这意味着您拥有熟悉的类似java的语法，而不需要那么多样板代码。当然你不必须使用这个命令行工具， 但这无疑是启动 `spring boot ` 项目最快的方式。

#### 安装方式

[https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-manual-cli-installation](https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-manual-cli-installation)

#### 版本升级

[https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-upgrading-from-an-earlier-version](https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#getting-started-upgrading-from-an-earlier-version)

