package com.example.todobot.controller;



import com.example.todobot.model.Status;
import com.example.todobot.model.Task;
import com.example.todobot.model.Type;
import com.example.todobot.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


@Controller
public class HomeController {


    private final TaskService taskService;

    public HomeController(TaskService taskService) {
        this.taskService = taskService;
    }


    @RequestMapping(value = {"/", "/home"})
    public String redirectHome(Model model){
        Date date = new Date();
        model.addAttribute("numberoftasks", taskService.getNumberofTasks());
        model.addAttribute("outdatedtasks", taskService.getNumberofOutdatedTasks());
        model.addAttribute("donetasks", taskService.getNumberofDoneTasks());
        model.addAttribute("ongoingtasks", taskService.getNumberofOngoingTasks());
        model.addAttribute("closetasks", taskService.getCloseTasks(date));
        model.addAttribute("tasks", taskService.getTasks());
        return "home";
    }

    @RequestMapping("/form")
    public String redirectPage(Model model){
        model.addAttribute("task", new Task());
        model.addAttribute("types", Type.values());
        model.addAttribute("statuses", Status.values());
        return "form";
    }



}
