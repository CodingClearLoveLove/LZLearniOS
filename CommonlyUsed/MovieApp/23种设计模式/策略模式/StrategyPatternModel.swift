//
//  StrategyPatternModel.swift
//  MovieApp
//
//  Created by 湛亚磊 on 2021/3/4.
//

/**
 策略模式
 
 解释地址:https://www.runoob.com/design-pattern/strategy-pattern.html
 
 在策略模式（Strategy Pattern）中，一个类的行为或其算法可以在运行时更改。这种类型的设计模式属于行为型模式。

 在策略模式中，我们创建表示各种策略的对象和一个行为随着策略对象改变而改变的 context 对象。策略对象改变 context 对象的执行算法。
 
 
 
 意图：定义一系列的算法,把它们一个个封装起来, 并且使它们可相互替换。

 主要解决：在有多种算法相似的情况下，使用 if...else 所带来的复杂和难以维护。

 何时使用：一个系统有许多许多类，而区分它们的只是他们直接的行为。

 如何解决：将这些算法封装成一个一个的类，任意地替换。

 关键代码：实现同一个接口。
 
 优点： 1、算法可以自由切换。 2、避免使用多重条件判断。 3、扩展性良好。

 缺点： 1、策略类会增多。 2、所有策略类都需要对外暴露。

 使用场景： 1、如果在一个系统里面有许多类，它们之间的区别仅在于它们的行为，那么使用策略模式可以动态地让一个对象在许多行为中选择一种行为。 2、一个系统需要动态地在几种算法中选择一种。 3、如果一个对象有很多的行为，如果不用恰当的模式，这些行为就只好使用多重的条件选择语句来实现。

 注意事项：如果一个系统的策略多于四个，就需要考虑使用混合模式，解决策略类膨胀的问题。
 
 
 */


import UIKit


//1.创建一个接口。
protocol Strategy {
    func doOperation(with num1:Int,with num2:Int) -> Int
}


//2.创建实现接口的实体类。
//加法
class OperationAdd:NSObject, Strategy {
    func doOperation(with num1: Int, with num2: Int) -> Int {
        return num1+num2
    }
}
//减法
class OperationSubtract: NSObject,Strategy {
    func doOperation(with num1: Int, with num2: Int) -> Int {
        return num1-num2
    }
}
//乘法
class OperationMultiply: NSObject,Strategy {
    func doOperation(with num1: Int, with num2: Int) -> Int {
        return num1*num2
    }
}

//3.常见context
class Context: NSObject {
    private var strategy:Strategy?
    init(with context:Strategy) {
        super.init()
        self.strategy = context
    }
    
    func executeStrategy(with num1:Int,with num2:Int) -> Int? {
        return strategy?.doOperation(with: num1, with: num2) 
    }
}
