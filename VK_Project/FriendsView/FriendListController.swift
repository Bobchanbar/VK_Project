//
//  FriendListController.swift
//  VK_Project
//
//  Created by Vladimir Barus on 06.11.2020.
//

import UIKit

class FriendListController: UITableViewController {

    var friends: [FriendsCollectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib (nibName: "FriendListCell", bundle: nil), forCellReuseIdentifier: "FriendListCell")
        friends = FakeAPI.shared.getFriendsList()
        tableView.rowHeight = 44
        tableView.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListCell", for: indexPath) as? FriendListCell else {
            fatalError()
        }
        cell.friendsName.text = friends [indexPath.row] .name
        cell.friendsPhoto.image = UIImage (named: friends [indexPath.row] .imageName)
        cell.friendsCity.text = friends [indexPath.row] .city
        cell.friendsPhoto.layer.cornerRadius = 44/2
        cell.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = FriendPageController ()
        VC.friend = friends [indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
//        let nav = UINavigationController (rootViewController: VC)
//        nav.modalPresentationStyle = .fullScreen
//        present(nav, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
