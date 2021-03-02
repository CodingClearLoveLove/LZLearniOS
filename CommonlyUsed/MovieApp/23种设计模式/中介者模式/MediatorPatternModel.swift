//
//  MediatorPatternModel.swift
//  MovieApp
//
//  Created by 湛亚磊 on 2021/3/2.
//

/**
 中介者模式
 中介者模式（Mediator Pattern）是用来降低多个对象和类之间的通信复杂性。这种模式提供了一个中介类，该类通常处理不同类之间的通信，并支持松耦合，使代码易于维护。中介者模式属于行为型模式。
 
 介绍文档:https://www.runoob.com/design-pattern/mediator-pattern.html
 
 
 
 意图：用一个中介对象来封装一系列的对象交互，中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。
 
 主要解决：对象与对象之间存在大量的关联关系，这样势必会导致系统的结构变得很复杂，同时若一个对象发生改变，我们也需要跟踪与之相关联的对象，同时做出相应的处理。
 
 何时使用：多个类相互耦合，形成了网状结构。
 
 如何解决：将上述网状结构分离为星型结构。
 
 优点： 1、降低了类的复杂度，将一对多转化成了一对一。 2、各个类之间的解耦。 3、符合迪米特原则。

 缺点：中介者会庞大，变得复杂难以维护。

 使用场景： 1、系统中对象之间存在比较复杂的引用关系，导致它们之间的依赖关系结构混乱而且难以复用该对象。 2、想通过一个中间类来封装多个类中的行为，而又不想生成太多的子类。

 注意事项：不应当在职责混乱的时候使用。
 
 */

import UIKit



//1.创建中介类
class ChatRoom: NSObject {
    static func showMessage(with user:User,with message:String)  {
        print(Date().date_String()+"[\(user.getName())]:\(message)")
    }
}


//2.创建User类
class User: NSObject {
    private var name:String = ""
    
    func getName() -> String {
        return name
    }
    
    func setName(with name:String)  {
        self.name = name
    }
    
    init(with name:String) {
        super.init()
        self.name = name
    }
    
    func sendMesage(message:String)  {
        ChatRoom.showMessage(with: self,with: message)
    }
    
}

