package com.example.todobot.Dao;


import com.example.todobot.model.Status;
import com.example.todobot.model.Task;
import com.example.todobot.model.Type;
import jakarta.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class TaskDaoImpl implements TaskDao{

    @Autowired
    private SessionFactory sf;

    @Override
    public void addTask(Task task) {
        sf.getCurrentSession().persist(task);
    }

    @Override
    public int getNumberOngoingTasks() {
        return (int) sf.getCurrentSession().createQuery("from Task where status= 0 ", Task.class).getResultCount();
    }

    @Override
    public int getNumberOutdatedTasks() {
        return  (int) sf.getCurrentSession().createQuery("from Task where status= 2",Task.class).getResultCount();
    }

    @Override
    public int getNumberTotalTasks() {
        return  (int) sf.getCurrentSession().createQuery("from Task ",Task.class).getResultCount();
    }

    @Override
    public int getNumberDoneTasks() {
        return  (int) sf.getCurrentSession().createQuery("from Task where status= 1",Task.class).getResultCount();
    }

    @Override
    public void removeTask(Task task) {
        sf.getCurrentSession().remove(task);
    }


    @Override
    public void updateTask(Task task, Status status) {
        task.setStatus(status);
        sf.getCurrentSession().merge(task);
    }

    @Override
    @Scheduled(cron = "0 0 0 * * ?") // This will run the method every day at midnight
    public void updateOutdatedTasks() {
        List<Task> allTasks = getAllTasks();
        Date currentDate = new Date();
        for (Task task : allTasks) {
            if (task.getDueDate().before(currentDate)) {
                updateTask(task, Status.OUTDATED);
            }
        }
    }
    @Override
    public List<Task> getAllTasks() {
        return sf.getCurrentSession().createQuery("from Task", Task.class).getResultList();
    }

    @Override
    public List<Task> getTasksByStatus(Status status) {
        return null;
    }

    @Override
    public List<Task> getTasksByType(Type type) {
        return null;
    }

    @Override
    public Task getTaskByTitle(String title) {
        return null;
    }

    @Override
    public Task getTaskById(long Id){
        String hql = "from Task where id= :Id";
        Query<Task> query= sf.getCurrentSession().createQuery(hql, Task.class);
        query.setParameter("Id", Id);
        return query.uniqueResult();
    }

    @Override
    public List<Task> getOutdatedTasks(Date date) {
        return null;
    }

    @Override
    public List<Task> getDailyTasks(Date date) {
        return null;
    }

    @Override
    public List<Task> getCloseTasks(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, -3);
        Date startDate = c.getTime();
        c.add(Calendar.DATE, 6);
        Date endDate = c.getTime();

        String hql = "FROM Task T WHERE T.dueDate BETWEEN :startDate AND :endDate";
        Query<Task> query = sf.getCurrentSession().createQuery(hql, Task.class);
        query.setParameter("startDate", startDate);
        query.setParameter("endDate", endDate);
        List<Task> tasks = query.list();
        System.out.println(tasks);
        return tasks;



    }
}
