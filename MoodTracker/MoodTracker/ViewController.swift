//
//  ViewController.swift
//  MoodTracker
//
//  Created by Tia King on 10/30/17.
//  Copyright © 2017 Tia King. All rights reserved.
//

import UIKit

protocol FriendDelegate {
    func addFriend(friend:Friend)
}

class ViewController: UIViewController {
    
    var delegate: FriendDelegate?
    @IBOutlet weak var MoodPicker: UISegmentedControl!
    @IBOutlet weak var AddName: UITextField!
    
    @IBAction func AddFriend(_ sender: UIButton) {
        var friend = Friend(name: AddName.text!, mood: MoodPicker.titleForSegment(at: MoodPicker.selectedSegmentIndex)!)
        delegate?.addFriend(friend: friend)
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

