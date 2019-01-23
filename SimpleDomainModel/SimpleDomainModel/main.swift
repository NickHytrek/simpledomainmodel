//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String {
        didSet {
            if currency != "USD" || currency != "GBP" || currency != "EUR" || currency != "CAN" {
                currency = "USD"
            }
        }
    }
  
  public func convert(_ to: String) -> Money {
    var newAmount = 0
    if (self.currency == "USD") {
        if (to == "GBP") {
            newAmount = self.amount / 2
        }
        else if (to == "EUR") {
            newAmount = (self.amount * 3) / 2
        }
        else {
            newAmount = (self.amount * 5) / 4
        }
    }
    else if (self.currency == "GBP") {
        if (to == "USD") {
            newAmount = self.amount * 2
        }
        else if (to == "EUR") {
            newAmount = self.amount * 3
        }
        else {
            newAmount = (self.amount * 5) / 2
        }
    }
    else if (self.currency == "EUR") {
        if (to == "USD") {
            newAmount = (self.amount * 2) / 3
        }
        else if (to == "GBP") {
            newAmount = (self.amount / 3)
        }
        else {
            newAmount = (self.amount * 5) / 6
        }
    }
    else {
        if (to == "USD") {
            newAmount = (self.amount * 4) / 5
        }
        else if (to == "GBP") {
            newAmount = (self.amount * 2) / 5
        }
        else {
            newAmount = (self.amount * 6) / 5
        }
    }
    let converted = Money(amount: newAmount, currency: to)
    return converted
  }
  
  public func add(_ to: Money) -> Money {
    var newAmount = 0
    if (self.currency == "USD") {
        if (to.currency == "USD") {
            newAmount = self.amount + to.amount
        }
        else if (to.currency == "GBP") {
            newAmount = (self.amount / 2) + to.amount
        }
        else if (to.currency == "EUR") {
            newAmount = ((self.amount * 3) / 2) + to.amount
        }
        else {
            newAmount = ((self.amount * 4) / 5) + to.amount
        }
    }
    else if (self.currency == "GBP") {
        if (to.currency == "USD") {
            newAmount = (self.amount * 2) + to.amount
        }
        else if (to.currency == "GBP") {
            newAmount = self.amount + to.amount
        }
        else if (to.currency == "EUR") {
            newAmount = (self.amount * 3) + to.amount
        }
        else {
            newAmount = ((self.amount * 5) / 2) + to.amount
        }
    }
    else if (self.currency == "EUR") {
        if (to.currency == "USD") {
            newAmount = ((self.amount * 2) / 3) + to.amount
        }
        else if (to.currency == "GBP") {
            newAmount = (self.amount / 3) + to.amount
        }
        else if (to.currency == "EUR") {
            newAmount = self.amount + to.amount
        }
        else {
            newAmount = ((self.amount * 5) / 6) + to.amount
        }
    }
    else {
        if (to.currency == "USD") {
            newAmount = ((self.amount * 4) / 5) + to.amount
        }
        else if (to.currency == "GBP") {
            newAmount = ((self.amount * 2) / 5) + to.amount
        }
        else if (to.currency == "EUR") {
            newAmount = ((self.amount * 6) / 5) + to.amount
        }
        else {
            newAmount = self.amount + to.amount
        }
    }
    return Money(amount: newAmount, currency:to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    var newAmount = 0
    if (self.currency == "USD") {
        if (from.currency == "USD") {
            newAmount = self.amount - from.amount
        }
        else if (from.currency == "GBP") {
            newAmount = (self.amount / 2) - from.amount
        }
        else if (from.currency == "EUR") {
            newAmount = ((self.amount * 3) / 2) - from.amount
        }
        else {
            newAmount = ((self.amount * 4) / 5) - from.amount
        }
    }
    else if (self.currency == "GBP") {
        if (from.currency == "USD") {
            newAmount = (self.amount * 2) - from.amount
        }
        else if (from.currency == "GBP") {
            newAmount = self.amount - from.amount
        }
        else if (from.currency == "EUR") {
            newAmount = (self.amount * 3) - from.amount
        }
        else {
            newAmount = ((self.amount * 5) / 2) - from.amount
        }
    }
    else if (self.currency == "EUR") {
        if (from.currency == "USD") {
            newAmount = ((self.amount * 2) / 3) - from.amount
        }
        else if (from.currency == "GBP") {
            newAmount = (self.amount / 3) - from.amount
        }
        else if (from.currency == "EUR") {
            newAmount = self.amount - from.amount
        }
        else {
            newAmount = ((self.amount * 5) / 6) - from.amount
        }
    }
    else {
        if (from.currency == "USD") {
            newAmount = ((self.amount * 4) / 5) - from.amount
        }
        else if (from.currency == "GBP") {
            newAmount = ((self.amount * 2) / 5) - from.amount
        }
        else if (from.currency == "EUR") {
            newAmount = ((self.amount * 6) / 5) - from.amount
        }
        else {
            newAmount = self.amount - from.amount
        }
    }
    return Money(amount: newAmount, currency:from.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch type {
    case .Hourly(let hourly):
        return Int(hourly) * hours
    case .Salary(let salary):
        return salary
    }
  }
  
  open func raise(_ amt : Double) {
    switch type {
    case .Hourly(let hourly):
        let newHourly = hourly + amt
        self.type = JobType.Hourly(newHourly)
    case .Salary(let salary):
        let newSalary = salary + Int(amt)
        self.type = JobType.Salary(newSalary)
        
    }
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {return _job    }
    set(value) {
        if self.age > 15 {
            _job = value
        }
    }

  }
  
  fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
    get { return _spouse        }
    set(value) {
        if self.age > 15 {
            _spouse = value
        }
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    let string = "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(_job) spouse:\(_spouse)]"
    return string
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    if spouse1.spouse == nil && spouse2.spouse == nil {
        members.append(spouse1)
        members.append(spouse2)
        spouse1.spouse = spouse2
        spouse2.spouse = spouse1
    }
  }
  
  open func haveChild(_ child: Person) -> Bool {
    if members[0].age > 21 || members[1].age > 21 {
        members.append(child)
        return true
    }
    else {
        return false
    }
  }
  
  open func householdIncome() -> Int {
    var i = 0
    var totalIncome = 0
    while i < members.count {
        if members[i]._job != nil {
            totalIncome = (members[i]._job?.calculateIncome(2000))!
        }
        i = i + 1
    }
    return totalIncome
  }
}





