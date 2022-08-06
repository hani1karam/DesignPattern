//
//  PrototypePattern.swift
//  DesignPattern
//
//  Created by Mac on 06/08/2022.
//

import Foundation
class InfoData{
    var name:String?
    var phone:String?
     init(name: String? = nil, phone: String? = nil) {
        self.name = name
        self.phone = phone
    }
    func copy(name:String?,phone:String?){
        let copyName = name == nil ? self.name : name!
        let copyPhone = phone == nil ? self.phone : phone!
    }

}
