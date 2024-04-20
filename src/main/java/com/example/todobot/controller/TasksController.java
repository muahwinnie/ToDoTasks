package com.example.todobot.controller;


import com.example.todobot.model.Task;
import com.example.todobot.service.TaskService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TasksController {

    private final TaskService taskService;

    public TasksController(TaskService taskService) {
        this.taskService = taskService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }



    @PostMapping("/addTask")
    public String addtask(@ModelAttribute("task") Task task){
        taskService.addTask(task);
        return "redirect:/";
    }

    @GetMapping("/updateTask")
    public String redirectUpdate(Model model){

        model.addAttribute("tasks", taskService.getTasks());
        return "index";
    }

    @GetMapping("/updateStatus")
    public String updateStatus(@RequestParam("id") String id, RedirectAttributes redirectAttributes){
        taskService.updateTask(Long.parseLong(id));
        System.out.println("updated");
        redirectAttributes.addFlashAttribute("updateMsg", "Successfully updated the task !");
        return "redirect:/home";
    }

    @GetMapping("/deleteTask")
    public String DeleteTask(@RequestParam("id") String id, RedirectAttributes redirectAttributes){
        taskService.removeTask(taskService.getTaskById(Long.parseLong(id)));
        redirectAttributes.addFlashAttribute("removalMsg", "Successfully removed the task !");
        return "redirect:/home";
    }

}
