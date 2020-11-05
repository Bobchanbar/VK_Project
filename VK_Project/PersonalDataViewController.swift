//
//  PersonalDataViewController.swift
//  VK_Project
//
//  Created by Vladimir Barus on 03.11.2020.
//

import UIKit

class PersonalDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addInfo: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    @IBOutlet weak var friendsButton: UIButton!
    @IBOutlet weak var friendsCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsCount.translatesAutoresizingMaskIntoConstraints = false
        
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = 100/2
        photo.image = FakeAPI.shared.getPhoto()
        view.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        editButton.layer.masksToBounds = true
        editButton.layer.cornerRadius = 6
        
        name.text = FakeAPI.shared.getSelfName()
        addInfo.text = FakeAPI.shared.getInfo()
        status.text = FakeAPI.shared.getStatus()
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        tableView.rowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PersonalDataTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalDataTableViewCell")
        
        collectionView.register(UINib(nibName: "ActionViewCell", bundle: nil), forCellWithReuseIdentifier: "actionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        friendsCount.font = .systemFont(ofSize: 12)
        friendsCount.textColor = .lightGray
        friendsCount.text = "\(FakeAPI.shared.getFriendsCount())"
        friendsButton.contentHorizontalAlignment = .left
        guard let buttonTitle = friendsButton.titleLabel else {
            return
        }
        NSLayoutConstraint.activate([
            friendsCount.centerYAnchor.constraint(equalTo: buttonTitle.centerYAnchor),
            friendsCount.leadingAnchor.constraint(equalTo: buttonTitle.trailingAnchor, constant: 8)
        ])
    }
}
extension PersonalDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalDataTableViewCell", for: indexPath) as? PersonalDataTableViewCell else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell.label.text = "education"
            cell.label.textColor = .lightGray
            cell.tumb.image = UIImage (named: "hat")
        case 1:
            cell.label.text = "followers"
            cell.label.textColor = .lightGray
            cell.tumb.image = UIImage (named: "wave")
        case 2:
            cell.label.text = "add company"
            cell.label.textColor = .systemTeal
            cell.tumb.image = UIImage (named: "case")
        case 3:
            cell.label.text = "additional info"
            cell.label.textColor = .white
            cell.tumb.image = UIImage (named: "info")
        default:
            fatalError()
        }
        cell.backgroundColor = UIColor (red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}

extension PersonalDataViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actionCell", for: indexPath)
            as? ActionViewCell else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell.toolBarLabel.text = "Story"
            cell.toolBarImage.image = UIImage (named: "photo")
        case 1:
            cell.toolBarLabel.text = "Post"
            cell.toolBarImage.image = UIImage (named: "posts")
        case 2:
            cell.toolBarLabel.text = "Photo"
            cell.toolBarImage.image = UIImage (named: "photoIcon")
        case 3:
            cell.toolBarLabel.text = "Clip"
            cell.toolBarImage.image = UIImage (named: "clip")
        default: fatalError()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalCellWidth = 70*4
        let totalSpaceWidth = 20*(4-1)
        let leftInset = (UIScreen.main.bounds.width - CGFloat(totalCellWidth + totalSpaceWidth))/2
        let rightInset = leftInset
        return UIEdgeInsets (top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 70, height: 70)
    }
}

