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
            friendStatus.text = "online"
            friendPhoto.image = UIImage (named: friend.imageName)
        }
    }
    let friendName: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    } ()
    let friendStatus: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .lightGray
        return label
    } ()
    let friendPhoto: UIImageView = {
        let imageView = UIImageView ()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 100/2
        return imageView
    } ()
    let messageButton: UIButton = {
        let button = UIButton (type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor (red: 225/255, green: 226/255, blue: 230/255, alpha: 1)
        button.setTitle("Message", for: .normal)
        button.tintColor = .black
        return button
    } ()
    let addFriendButton: UIButton = {
        let button = UIButton (type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor (red: 43/255, green: 45/255, blue: 46/255, alpha: 1)
        button.setTitle("You're Friends", for: .normal)
        button.tintColor = .white
        return button
    } ()
    
    let toolBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView (frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return collectionView
    }()
    
    let firstSeparator: UIView = {
        let view = UIView ()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        toolBarCollectionView.delegate = self
        toolBarCollectionView.dataSource = self
        toolBarCollectionView.register(UINib(nibName: "ActionViewCell", bundle: nil), forCellWithReuseIdentifier: "actionCell")
        view.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        view.addSubview (friendName)
        view.addSubview (friendStatus)
        view.addSubview (friendPhoto)
        view.addSubview (messageButton)
        view.addSubview (addFriendButton)
        view.addSubview (toolBarCollectionView)
        view.addSubview (firstSeparator)
       
        NSLayoutConstraint.activate([
            friendPhoto.widthAnchor.constraint(equalTo: friendPhoto.heightAnchor),
            friendPhoto.heightAnchor.constraint(equalToConstant: 100),
            friendPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            friendPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            friendName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            friendName.leadingAnchor.constraint(equalTo: friendPhoto.trailingAnchor, constant: 16),
           
            friendStatus.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 8),
            friendStatus.leadingAnchor.constraint(equalTo: friendPhoto.trailingAnchor, constant: 16),
            
            messageButton.topAnchor.constraint(equalTo: friendPhoto.bottomAnchor, constant: 16),
            messageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            messageButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 24)/2),
            messageButton.heightAnchor.constraint(equalToConstant: 35),
            
            addFriendButton.topAnchor.constraint(equalTo: friendPhoto.bottomAnchor, constant: 16),
            addFriendButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 8),
            addFriendButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor),
            addFriendButton.heightAnchor.constraint(equalTo: messageButton.heightAnchor),
            
            toolBarCollectionView.topAnchor.constraint(equalTo: messageButton.bottomAnchor, constant: 16),
            toolBarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBarCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
            firstSeparator.topAnchor.constraint(equalTo: toolBarCollectionView.bottomAnchor, constant: 8),
            firstSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            firstSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            firstSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
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

extension FriendPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.toolBarCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actionCell", for: indexPath)
                as? ActionViewCell else {
                fatalError()
            }
            switch indexPath.row {
            case 0:
                cell.toolBarLabel.text = "Call"
                cell.toolBarImage.image = UIImage (named: "call")
            case 1:
                cell.toolBarLabel.text = "Money"
                cell.toolBarImage.image = UIImage (named: "money")
            case 2:
                cell.toolBarLabel.text = "Gift"
                cell.toolBarImage.image = UIImage (named: "gift")
            case 3:
                cell.toolBarLabel.text = "Notif"
                cell.toolBarImage.image = UIImage (named: "notification")
            default: fatalError()
            }
            return cell
//        case self.friendsCollectionView:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
//                fatalError()
//            }
//            cell.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
//            cell.friendsName.text = friends [indexPath.row] .name
//            cell.friendsPhoto.image = UIImage (named: friends [indexPath.row].imageName)
//            cell.friendsPhoto.layer.masksToBounds = true
//            cell.friendsPhoto.layer.cornerRadius = 70/2
//            return cell
            
        default: fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.toolBarCollectionView:
            return 4
//        case self.friendsCollectionView:
//            return friends.count
        default: fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case self.toolBarCollectionView:
            let totalCellWidth = 70 * 4
            let totalSpaceWidth = 20 * (4-1)
            let leftInset = (UIScreen.main.bounds.width - CGFloat(totalCellWidth + totalSpaceWidth))/2
            let rightInset = leftInset
            return UIEdgeInsets (top: 0, left: leftInset, bottom: 0, right: rightInset)
//        case self.friendsCollectionView:
//            return UIEdgeInsets (top: 0, left: 0, bottom: 0, right: 0)
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.toolBarCollectionView:
            return CGSize (width: 70, height: 70)
//        case self.friendsCollectionView:
//            return CGSize (width: 70, height: 100)
        default:
            fatalError()
        }
    }
    
}
