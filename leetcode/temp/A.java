
import java.util.logging.Logger;
public class A {
    private static final Logger logger = Logger.getLogger(A.class.getName());
    private Class<?> userClass = User.class;

    public void classTest() throws Exception {
        // 获取Class对象的三种方式
        logger.info("根据类名:  \t" + User.class);
        logger.info("根据对象:  \t" + new User().getClass());
        logger.info("根据全限定类名:\t" + Class.forName("User"));
        // 常用的方法
        logger.info("获取全限定类名:\t" + userClass.getName());
        logger.info("获取类名:\t" + userClass.getSimpleName());
        logger.info("实例化:\t" + userClass.newInstance());
    }

    public static void main(String[] args) throws Exception {
        A a = new A();
        a.classTest();
    }
}
class User {
    private String name = "init";
    private int age;

    public User() {
    }

    public User(String name, int age) {
        super();
        this.name = name;
        this.age = age;
    }

    private String getName() {
        return name;
    }

    private void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User [name=" + name + ", age=" + age + "]";
    }
}