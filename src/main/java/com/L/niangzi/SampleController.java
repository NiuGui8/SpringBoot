package com.L.niangzi;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.L.niangzi.mapper.UserMapper;
import com.L.niangzi.pojo.User;

@RestController
@EnableAutoConfiguration
@MapperScan("com.L.niangzi.mapper")
public class SampleController {
	
	@Resource
	private UserMapper userMapper;
	
	@RequestMapping("/")
    @ResponseBody
    String home() {
		List<User> list = userMapper.queryUserByCondition();
		System.out.println(list);
        return "Hello World! L";
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(SampleController.class, args);
    }
}