//
//  Observer.swift
//  DesignPattern
//
//  Created by Mac on 21/08/2022.
//

import Foundation
class Subject {

    var state: Int = { return Int(arc4random_uniform(10)) }()

    private lazy var observers = [Observer]()

    func subscribe(_ observer: Observer) {
        print("Attached an observer")
        observers.append(observer)
    }

    func unsubscribe(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Detached an observer")
        }
    }

    func notify() {
        print("Notifying observers")
        observers.forEach({ $0.update(subject: self)})
    }

    func someBusinessLogic() {
        print("I'm doing something important")
        state = Int(arc4random_uniform(10))
        print("state has just changed to: \(state)")
        notify()
    }
}

protocol Observer: class {

    func update(subject: Subject)
}

class ConcreteObserverA: Observer {

    func update(subject: Subject) {

        if subject.state < 3 {
            print("Reacted to the event")
        }
    }
}

class ConcreteObserverB: Observer {

    func update(subject: Subject) {

        if subject.state >= 3 {
            print("Reacted to the event")
        }
    }
}
