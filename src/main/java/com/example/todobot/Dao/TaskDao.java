package com.example.todobot.Dao;

import com.example.todobot.model.Status;
import com.example.todobot.model.Task;
import com.example.todobot.model.Type;

import java.util.Date;
import java.util.List;

public interface TaskDao {

    public void addTask(Task task);
    public int getNumberOngoingTasks();
    public int getNumberOutdatedTasks();
    public int getNumberTotalTasks();
    public int getNumberDoneTasks();
    public void removeTask(Task task);
    public void updateOutdatedTasks();
    public void updateTask(Task task, Status status);
    public List<Task> getAllTasks();
    public List<Task> getTasksByStatus(Status status);
    public List<Task> getTasksByType(Type type);
    public Task getTaskById(long Id);
    public Task getTaskByTitle(String title);
    public List<Task> getOutdatedTasks(Date date);
    public List<Task> getDailyTasks(Date date);
    public List<Task> getCloseTasks(Date date);
}
