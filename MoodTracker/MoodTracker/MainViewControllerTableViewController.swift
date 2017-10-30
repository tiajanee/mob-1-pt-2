//
//  MainViewControllerTableViewController.swift
//  MoodTracker
//
//  Created by Tia King on 10/30/17.
//  Copyright © 2017 Tia King. All rights reserved.
//

import UIKit

class Friend {
   
    var name:String
    var mood:String
    
    init(name: String, mood:String) {
        self.name = name
        self.mood = mood
    }
}

class MainViewControllerTableViewController: UITableViewController, FriendDelegate {
    
    func addFriend(friend:Friend) {
        friends.append(friend)
        print("load my shit")
        self.tableView.reloadData()
    }
    
    var friends: [Friend] = []
    var selectedFriend: Friend?
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)

        cell.textLabel?.text = friends[indexPath.row].name
        return cell
    }

}
