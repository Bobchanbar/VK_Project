//
//  FriendPageController.swift
//  VK_Project
//
//  Created by Vladimir Barus on 06.11.2020.
//

import UIKit

class FriendPageController: UIViewController {
    var friend: FriendsCollectionModel! {
        didSet {
            friendName.text = friend.name
        }
    }
    let friendName: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        view.addSubview (friendName)
        NSLayoutConstraint.activate([
            friendName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            friendName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
