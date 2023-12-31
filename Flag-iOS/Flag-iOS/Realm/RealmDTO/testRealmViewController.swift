//
//  testRealmViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/18.
//

import UIKit

import RealmSwift

class testRealmViewController: UIViewController {
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // test
        
        let jay = UserFriendList()
        jay.userName = "최지우"
        jay.userId = "jay"
        
        let hy = UserFriendList()
        hy.userName = "성현주"
        hy.userId = "hy"

        try! realm.write {
            realm.add(jay)
            realm.add(hy)
        }

        let savedFriendsList = realm.objects(UserFriendList.self)
        print(savedFriendsList)
    }
}

class UserFriendList: Object {
    @objc dynamic var userName: String = ""
    @objc dynamic var userId: String = ""
}
