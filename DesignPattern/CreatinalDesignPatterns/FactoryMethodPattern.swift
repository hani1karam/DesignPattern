//
//  FactoryMethodPattern.swift
//  DesignPattern
//
//  Created by Mac on 06/08/2022.
//

import Foundation
protocol Creator {

    func factoryMethod() -> Product

    func someOperation() -> String
}
protocol Product {

    func operation() -> String
}
extension Creator {

    func someOperation() -> String {
        let product = factoryMethod()

        return "Creator: The same creator's code has just worked with " + product.operation()
    }
}
class ConcreteCreator1: Creator {

    public func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
}

class ConcreteCreator2: Creator {

    public func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}
class ConcreteProduct1: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
}

class ConcreteProduct2: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct2}"
    }
}
class Client {
    static func someClientCode(creator: Creator) {
        print("Client: I'm not aware of the creator's class, but it still works.\n"
            + creator.someOperation())
    }
}
