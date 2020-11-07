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
    func getFriendsCount() -> Int {
        return 100
    }
    func getFriendsList() -> [FriendsCollectionModel] {
        let friends = [
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Kirill", imageName: "kirillPhoto", city: "Moscow")
        ]
        return friends
    }
    func getFriendsFriendsList() -> [FriendsCollectionModel] {
        let friends = [
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow"),
            FriendsCollectionModel (name: "Vladimir", imageName: "myPhoto", city: "Moscow")
        ]
        return friends
    }
}

