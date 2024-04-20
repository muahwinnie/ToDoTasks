package com.example.todobot.model;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotBlank
    private String title;

    private String description;


    private Type type;

    private Status status;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addedDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dueDate;


    public Task(long id, Type type, Status status, Date addedDate, Date dueDate) {
        this.id = id;
        this.type = type;
        this.status = status;
        this.addedDate = addedDate;
        this.dueDate = dueDate;
    }

    public Task() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", type=" + type +
                ", status=" + status +
                ", addedDate=" + addedDate +
                ", dueDate=" + dueDate +
                '}';
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }
}
