//
//  User.swift
//  LoginWithFirebase
//
//  Created by 白数叡司 on 2020/08/17.
//  Copyright © 2020 AEG. All rights reserved.
//

import FirebaseFirestore

struct User {
    
    let name: String
    let createdAt: Timestamp
    let email: String
    
    init(dic: [String: Any]) {
        self.name = dic["name"] as! String
        self.createdAt = dic["createdAt"] as! Timestamp
        self.email = dic["email"] as! String
    }
    
}
