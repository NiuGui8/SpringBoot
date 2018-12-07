这一部分将介绍，如何开发一个 `HELLO WORLD` 网页应用，会着重关注 `spring boot` 的一些关键特性，我们使用大部分 IDE 都支持的 `maven` 构建方式：

注意：项目开始之前，需要检查 java 和 maven 是否已经安装

### 1 创建 `pom.xml` 文件

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

### 2 添加依赖 jar 包至 `classpath`

`spring boot` 提供了许多 	`starts` 来帮助开发者引入 jar 包至 `classpath` 中，例子中已经在 `pom.xml` 中引入了 `spring-boot-starter-parent`。 它是一个特殊的 	`starter ` 提供了很多默认的依赖。它还提供了一个依赖管理部分，以便您可以忽略  “blessed” 依赖项的版本标记。 

其他 `Starters` 提供了你在开发一些特定项目的时候需要用到的依赖， 比如我们需要开发一个 web 项目，我们需要引入 `spring-boot-starter-web` 依赖项。

在这之前，我们可以运行 `mvn dependency:tree` 查看当前的依赖树结构， 我们可以发现 `spring-boot-starter-parent` 并不会引入任何依赖，我们引入  `spring-boot-starter-web` 之后再运行 `mvn dependency:tree` , 就能看到导入了很多依赖。

	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
	</dependencies>

`mvn dependency:tree` 可以查看当前的依赖树结构

### 3 代码编写

为了完成这个项目，我们需要编写一个 java 类，maven 默认会编译 `src/main/java` 包下的源代码，所以我们首先需要创建这个目录结构，然后在该目录下添加一个类 `src/main/java/Example.java` :
	
	import org.springframework.boot.*;
	import org.springframework.boot.autoconfigure.*;
	import org.springframework.web.bind.annotation.*;
	
	@RestController
	@EnableAutoConfiguration
	public class Example {
	
		@RequestMapping("/")
		String home() {
			return "Hello World!";
		}
	
		public static void main(String[] args) throws Exception {
			SpringApplication.run(Example.class, args);
		}
	
	}

这里看起来并没有几行代码 ， 但其实 `spring boot`已经为我们做了很多工作，后面会介绍重要的部分


#### 3.1 `@RestController` 和 `@RequestMapping` 

例子中使用的第一的注解是 	`@RestController` , 这就是所谓的 	`stereotype ` 直接，它给阅读代码的提供了暗示，对 spring 来说表演了一个特定的角色。在这种情况下 ， Spring 在处理 web 请求时，就认为它是一个 web 的 `@Controller`。

*这两个注解是 Spring MVC 里面的注解，并不是 Spring boot 特有的。

#### 3.2 `@EnableAutoConfiguration`
 
这个注解告诉 Spring 基于你添加的依赖去“猜”你想如何去配置你的项目， 当 `spring-boot-starter-web` 加入了 `Spring MVC` 和 `Tomcat` 只有，自动配置器就假设你是在开发 web 项目，并加载相应的配置。

自动配置被设计成可以很好地与 “Starts” 一起工作，但是这两个概念没有直接联系。您可以在启动程序之外自由选择 jar 依赖项。 `Spring Boot` 仍然尽力自动配置您的应用程序。

#### 3.3 `main` 方法

例子中的最后一部分是一个 `mian` 方法， 这就是 java 中一个普通的程序入口类， `main` 方法通过调用 `SpringApplication.run()` 方法来启动 `Spring boot` , 反过来，开始自动配置 `Tomcat` 服务器。需要传入 `Example` 至 `run()` 方法中，告诉 `SpringApplicatio` 哪个才是主要的 `Spring` 组件， 命令行中传入的 args 参数也可以传入。

#### 3.4 启动项目

到这一步，您的项目应该就可以正常工作了，可以在项目的根目录使用 `mvn spring-boot:run` 命令来启动您的 `Spring boot` 项目

启动成功后，在浏览器输入 `localhost:8080`,访问是否启动成功

#### 3.5 构建可执行 jar 文件

可执行jar(有时称为 “fat jar” )是包含已编译类以及代码需要运行的所有jar依赖项的归档文件。

	可执行jar和Java

	Java不提供加载嵌套jar文件(本身包含在jar中的jar文件)的标准方法。
	如果希望分发自包含的应用程序，这可能会有问题。
	为了解决这个问题，许多开发人员使用“uber”jar。
	uber jar将来自应用程序所有依赖项的所有类打包到一个归档文件中。
	这种方法的问题是，很难看到应用程序中有哪些库。如果在多个jar中使用相同的文件名(但内容不同)，也会出现问题。
	Spring boot 采用了一种不同的方法，可以直接嵌套jar。

为了创建可执行文件，我们需要在 `POM.XML` 中加入 `spring-boot-maven-plugin` 插件：

	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

`spring-boot-starter-parent` 包含了 `<executions>` 配置来绑定需要打包的文件类型， 如果你们有用到 `spring-boot-starter-parent` ， 需要自己指定

使用 `mvn package ` 进行打包， 打包文件在 `target` 目录下， 你可以看到一个 `myproject-0.0.1-SNAPSHOT.jar` 文件，大约 10M ,如果你想看 jar包的内部结构 ，可以使用命令 `jar tvf target/myproject-0.0.1-SNAPSHOT.jar`.

您还应该看到一个更小的文件，名为 `myproject-0.0.1- snap .jar`。原始的目标目录,这是Maven在通过Spring引导重新打包之前创建的原始jar文件

