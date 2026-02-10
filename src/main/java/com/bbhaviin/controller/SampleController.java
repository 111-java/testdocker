package com.bbhaviin.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/greetings")
public class SampleController {

    @GetMapping
    public String GetMyData(){
        return "welcome";
    }
}
