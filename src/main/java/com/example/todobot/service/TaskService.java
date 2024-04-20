package com.example.todobot.service;

import com.example.todobot.Dao.TaskDao;
import com.example.todobot.model.Status;
import com.example.todobot.model.Task;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class TaskService {
    private final TaskDao taskDao;

    public TaskService(TaskDao taskDao) {
        this.taskDao = taskDao;
    }

    public List<Task> getCloseTasks(Date date){
        return taskDao.getCloseTasks(date);
    }

    public List<Task> getTasks(){
        return taskDao.getAllTasks();
    }

    public int getNumberofTasks(){
        return taskDao.getNumberTotalTasks();
    }
    public int getNumberofOngoingTasks(){
        return taskDao.getNumberOngoingTasks();
    }
    public int getNumberofOutdatedTasks(){
        return taskDao.getNumberOutdatedTasks();
    }

    /**
     * UPDATES THE TASK EITHER TO DONE OR ONGOING BASED ON ITS CURRENT STATUS
     * @param id
     */
    public void updateTask(long id){
        Task t = getTaskById(id);
        if(t.getStatus().equals(Status.DONE)){
            taskDao.updateTask(t,Status.ONGOING);
        } else{
            taskDao.updateTask(t,Status.DONE);
        }
    }

    public void removeTask(Task task){
        taskDao.removeTask(task);
    }

    public Task getTaskById(long id){
        return taskDao.getTaskById(id);
    }
    public int getNumberofDoneTasks(){
        return taskDao.getNumberDoneTasks();
    }


    public void addTask(Task task) {
        taskDao.addTask(task);
    }
}
