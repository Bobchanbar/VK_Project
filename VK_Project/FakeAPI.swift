//
//  FakeAPI.swift
//  VK_Project
//
//  Created by Vladimir Barus on 04.11.2020.
//

import UIKit

class FakeAPI {
    static let shared = FakeAPI ()
    
    func getPhoto() -> UIImage? {
        return UIImage (named: "myPhoto")
    }
    func getSelfName() -> String {
        return "Vladimir Barus"
    }
    func getInfo() -> String {
        return "Write about yourself"
    }
    func getStatus() -> String {
        return "online"
    }
}

