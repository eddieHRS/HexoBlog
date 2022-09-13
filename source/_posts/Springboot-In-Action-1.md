---
title: Springboot In Action[1] - 总览 
date: 2022-09-13 22:32:14
tags: ["SpringBoot", "SpringBoot In Action"]
---

## Main Topics
Spring Boot 产生的目的是为了让Spring 更加简单易用。  
在Spring Boot In Action 中介绍了Spring Boot的四大主题。
1. auto-configuration 自动装配
2. starter-dependencies 起始依赖
3. command-line interface CLI
4. actuator(用于观察，监控Spring)
   

## Details of Topic

* auto-configuration 摆脱配置的苦海
  > Spring 框架提供轻量的POJO取代了EJB(Enterprise JavaBeans)。然而 Spring 框架的配置却极为繁琐。  
  最开始，Spring 框架采用 xml 配置文件的方式进行配置，在 Spring2.5 之后，引入了基于注解的配置，Spring 3.0 引入了 Java-based 的配置。 随着Spring 版本的更替，配置的方式越来越简便，但是还是免不了进行大量的配置。比如要引入 Spring MVC的功能，就需要写大量 SpringMVC 的配置类。
* starter-dependencies 不为版本所纠缠
  > 版本兼容问题是最讨厌的问题之一，堪比"锟斤拷"。但是Sprin Boot以场景驱动，直接将该场景下的需要的jar包整合成一个starter 包。开发者在遇到该开发场景的时候，直接引入 starter，无需考虑版本问题，方便快捷。
* CLI 编写application 的另一种方式
  > 无需打开IDE,在shell直接写Spring Application
* actuator
  > 提供一种运行时了解Spring内部的能力。  
    例如，Spring上下文加载的类的数量，个数，种类等等。