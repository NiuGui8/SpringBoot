这一部分将介绍，如何开发一个 `HELLO WORLD` 网页应用，会着重关注 `spring boot` 的一些关键特性，我们使用大部分 IDE 都支持的 `maven` 构建方式：

注意：项目开始之前，需要检查 java 和 maven 是否已经安装

### 创建 `pom.xml` 文件

	<?xml version="1.0" encoding="UTF-8"?>
	<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
		<modelVersion>4.0.0</modelVersion>
	
		<groupId>com.example</groupId>
		<artifactId>myproject</artifactId>
		<version>0.0.1-SNAPSHOT</version>
	
		<parent>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-parent</artifactId>
			<version>2.1.1.RELEASE</version>
		</parent>
	
		<!-- Additional lines to be added here... -->
	
	</project>