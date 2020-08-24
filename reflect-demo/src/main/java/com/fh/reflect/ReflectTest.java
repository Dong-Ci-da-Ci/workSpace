package com.fh.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectTest {

    public static void main(String[] args) throws ClassNotFoundException {
        //一、获取class的三种方式
        //1.方式一.getClass
        Person person = new Person();
        //Class<? extends Person> personClass = person.getClass();
        //2.方式二 任何数据类型都有一个静态的class属性 (也就是常用的类名.class)
        //3.方式三  通过Class静态方法：foName
        Class personClass = Class.forName("com.fh.reflect.Person");
        System.out.println("=================获取类中的所有的属性（getDeclaredFields）====================");
        Field[] declaredFields = personClass.getDeclaredFields();
        for (Field field : declaredFields){
            System.out.println(field.getName()+": " +field.getType().getName());
        }

        System.out.println("=================获取类中的被public修饰的属性（getField）====================");
        Field[] fields = personClass.getFields();
        for (Field field : fields){
            System.out.println(field.getName());
        }

        System.out.println("=================获取类中所有方法（getDeclaredMethod）====================");
        Method[] declaredMethods = personClass.getDeclaredMethods();
        for(Method method : declaredMethods){
            System.out.println(method.getName());
        }

        System.out.println("=================获取类中的被public修饰的方法(包括父类里面的方法)（getMethod）====================");
        Method[] methods = personClass.getMethods();
        for (Method method : methods){
            System.out.println(method.getName());
        }

        System.out.println("=================获取类中所有构造方法（getMethod）====================");
        Constructor[] constructors = personClass.getConstructors();
        for (Constructor constructor : constructors){
            System.out.println(constructor.getName());
        }




    }
}
