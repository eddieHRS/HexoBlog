---
title: SpringBoot In Action[2] - 配置项
date: 2022-09-13 22:42:31
tags: ["SpringBoot In Action"]
categories: ["SpringBoot"]
---

## 
Conditional Configuration Support
SpringBoot 支持带条件的配置类注入。例如
|注解|意义|
|-------|-------|
|@ConditionalOnClass()|A.class 必须在classpath找得到|
|@ConditionalOnMissingBean(A.class)|只有在A.class缺失的情况下才加载|

## 重写自动配置的配置类
> SpringBoot的 Conditional Configuration Support给我们自定义配置类提供了可能。  
SpringBoot的类加载顺序是先加载Application中的配置类，再加载Auto-Configuration中的配置类。如果在自动配置的配置类上增加 @ConditionalOnMissingBean(A.class)注解，那么在Application 代码中，自定义了配置类A,那么 自动装配的配置类就不会被加载。也就达到了我们在Application代码中自定义配置类的目的。

## 外部配置
> 除了在代码中重写配置类，SpringBoot提供了多种外部配置的方式。
SpringBoot 会从九个地方获取参数(优先级从上至下逐渐降低)
1. 命令行参数
2. JNDI 属性
3. JVM参数
4. 操作系统环境变量
5. random开头的参数
6. jar 包外部 application.properties / application.yml 文件
7. jar 包内部 application.properties / application.yml 文件
8. 被 @PropertySource 注解的
9. 默认配置

> 在我们日常开发中，使用 application.yml/application.properties是最为常见的方式。application.yml/application.properties 可以放在以下四个地方:

1. 与 jar包同级的总目录 config下   
|--app.jar  
|--config  
|--application.yml  
2. 与jar包同级
|--app.jar  
|--application.yml
3. 在jar包中，config package下
4. 在jar包中，classpath下
此处，从上往下，优先级降低，一致地，优先级高的配置会覆盖优先级低的。  

tips: application.yml 的 优先级比 application.properties 高

## 自定义配置项
在日常开发中，有一些业务参数需要自己定义，那么这些业务参数如何像springboot自带的那些参数一样，注入到Spring中呢?
例如我需要定义参数 prefix.a 和 prefix.b
使用@ConfigurationProperties("prefix")注解
使用@ConfigurationProperties 需要 @EnableConfigurationProperties注解一起使用。但是如果使用了AutoConfiguration功能，那么 @EnableConfigurationProperties就被默认引入了。

```Java
@Compont
@ConfigurationProperties("prefix")
public class MyProperties{
    private String a;

    private String b;
}
```
如此，就可以把自动读入配置项中的 prefix.a 和 prefix.b。

## springboot 配置文件区分开发环境
在日常开发中，生产，测试，开发环境的配置项各不相同，需要区分
1. 使用 @Profile
> * 在配置类上增加注解 @Profile("dev")
> * 将 spring.profiles.active=dev(可以通过 命令行参数，环境变量方式设置，也可以写在 application.yml中)
2. 使用 application-.yml/properties (多个配置文件)
> * application.yml/properties 中写不区分环境的配置
> * application-.yml/properties 中写开发环境的配置
> * application-.yml/properties 中写生产环境的配置
> * 使用spring.profiles.active=dev/product 激活环境

3. 在 application.yml中使用 --- 区分环境 (单个配置文件)
```Yaml
here is config do not depends on env

---

spring:
  profiles: product

here is config use in product env 


---
spring:
  profiles: dev

here is config use in dev env 

使用spring.profiles.active=dev/product 激活环境
```
