//
//  Proxy.swift
//  DesignPattern
//
//  Created by Mac on 13/08/2022.
//

import Foundation
protocol SMSServiceProtocol {
    func sendSMS(sender: String, receiver: String, message: String)
}

class SMSService: SMSServiceProtocol {
    func sendSMS(sender: String, receiver: String, message: String) {
        print("\(sender)sent SMS Successfully")
    }
}


class SMSServiceProxy {
    
    private var smsService: SMSService?
    
    private var sentMessagesCount: [String : Int] = [:]
    
    func sendSMS(sender: String, receiver: String, message: String) {
        
        if smsService == nil {
            smsService = SMSService()
        }
        
        if sentMessagesCount[sender] == nil {
            sentMessagesCount[sender] = 1
            smsService?.sendSMS(sender: sender, receiver: receiver, message: message)
        }
        else if sentMessagesCount[sender] ?? 0 < 100 {
            let oldValue = sentMessagesCount[sender] ?? 0
            sentMessagesCount.updateValue(oldValue + 1, forKey: sender)
            smsService?.sendSMS(sender: sender, receiver: receiver, message: message)
        }
        else {
            print("Limit")
        }
        
        print(sentMessagesCount)
    }
}
