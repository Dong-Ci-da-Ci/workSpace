package com.fh.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ReflectTest2 {
    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        //给你一个类名字，创建一个该类所对应的对象 （相当于 Person p = new Person()  ）
        //通过反射创建类实例&&通过放射
        String className = "com.fh.reflect.Person";
        Class aClass = Class.forName(className);
        Person person = (Person) aClass.newInstance();
        person.getAge();

        //通过放射调用构造函数以及有参的构造函数创建实例
        Constructor constructor = aClass.getConstructor(String.class);
        Person  person1 =(Person) constructor.newInstance("小明同学");
        System.out.println(person1.getName());

        //无参
        Constructor constructor1 = aClass.getConstructor();
        Person person2= (Person) constructor1.newInstance();
        person2.setName("呵呵");
        System.out.println(person2.getName());

    }
}
