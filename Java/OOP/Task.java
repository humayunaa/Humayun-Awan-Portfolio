import java.time.LocalDate;
import java.time.Period;

enum State {
    TODO, BEGN, HALT, WAIT, DONE
}
//instead of this.* do name_of(*) i.e create a function below which reads in
public class Task {
    final String title;
    String description;
    LocalDate schedule;
    LocalDate deadline;  //not final
    State state = State.TODO;

    public Task(String title, State state) {
        this.title = title;
        //do setState(state) "same for other fields" [lead to this.state = state], instead of this.state = state
        //as it will change DONE to TO-DO automatically if Repeated-Task
        setState(state);
    } public Task(String title, State state, LocalDate schedule) {
        this(title, state);
        //this.title = title;
        //setState(state);;
        setSchedule(schedule);
    } public Task(String title, State state, String description, LocalDate schedule, LocalDate deadline) {
        this(title, state);
        //this.title = title;
        setDescription(description);
        //setState(state);
        setSchedule(schedule);
        setDeadline(deadline);
    } 

    public String getTitle() {
        return this.title;
    } public String getDescription() {
        return this.description;
    } public LocalDate getSchedule() {
        return this.schedule;
    } public LocalDate getDeadline() {
        return this.deadline;
    }public State getState() {
        return this.state;
    }

    //---we need these sets as we use them in chore, repeated task etc.---
    //remember we call this instead of this.* in constructor public Task()
    public void setState(State state) {
        this.state = state; 
    } public void setDescription(String description) {
        this.description = description;
    } public void setSchedule(LocalDate schedule) {
        this.schedule = schedule;
    } public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }

    public String toString() {
        String message = this.title + " (" + this.state + ")";
        if (this.schedule != null) {
            return message += " scheduled: " + this.schedule;
        }
        if (this.deadline != null) {
            return message += " deadline: " + this.deadline;
        }
        return message;
    }
    public static void main(String args[]) {
        Task t1 = new Task("T1", State.TODO);
        System.out.println(t1);

        Task t2 = new RepeatedTask("T2", State.DONE);
        System.out.println(t2);
        //t2.setState(State.DONE);
        //System.out.println(t2);

        Task t3 = new Chore("T3", State.TODO, LocalDate.now(), LocalDate.now().plus(Period.ofDays(7)));
        System.out.println(t3);
        t3.setState(State.DONE);
        System.out.println(t3);
        //t3.getRepeat();

        Task t4 = new SharedTask("T4", "Humayun");
        System.out.println(t4);

        Task t5 = new Dependency("T5", State.TODO, t1);
        System.out.println(t5);
        t5.setState(State.DONE);
        t1.setState(State.DONE);
        System.out.println(t5);
    }
}

//USUALLY DO EXTENDS IN DIFF FILES
//DONT DO public class __ extends Task -- DO: class __ extends Task

class RepeatedTask extends Task {

    public RepeatedTask(String title, State state) {
        super(title, state);
    }

    @Override
    public void setState(State state) {  //need this here so we need this in TASK
        if (state == State.DONE) {
            this.state = State.TODO;
        } else {
            this.state = state;
        }
    }
}

class Chore extends RepeatedTask {
    //new field
    LocalDate repeat;
    Chore(String title, State state, LocalDate schedule, LocalDate repeat) {
        //cant add schedule to this. its in Task(title, state, schedule)
        //BUT its NOT in Repeated-Task
        super(title, state);
        setSchedule(schedule);
        setRepeat(repeat);
    }

    public LocalDate getRepeat() {
        return this.repeat;
    }

    public void setRepeat(LocalDate repeat) {
        this.repeat = repeat;
    }

    @Override
    public void setState(State state) {
        super.setState(state);  //WHY NEED????
        if (state == State.DONE) {
            LocalDate repeat_new = repeat.plus(Period.ofDays(7));
            setSchedule(repeat);
            setRepeat(repeat_new);
        }
    }
}

class SharedTask extends Task {
    //new field
    String name;
    public SharedTask(String title, String name) {
        //state always starts with wait
        super(title, State.WAIT);
        this.name = name;  //name doesnt change so no setName(name)
    }

    @Override  //@Override if its in the master class and we wanna do something different
    public String toString() {
        return super.toString() + " shared with: " + name;
    }
}

class Dependency extends Task {
    //new field
    // i think type is Task because
    // task_dependency is another task i.e t1 rather than something else
    // task_dependecy.state == t1.state
    Task task_dependency;

    public Dependency(String title, State state, Task task_dependency) {
        super(title, state); //can do super(titlem state) as it is in Task
        this.task_dependency = task_dependency;  //doesnt change dont need setTaskDependency
    }

    @Override
    public String toString() {
        return super.toString() + " dependent on: " + task_dependency.toString();
    }

    @Override
    public void setState(State state) {
        if (state == State.DONE && !(task_dependency.state == State.DONE)) {
            return;
        }
        this.state = state;
    }
}