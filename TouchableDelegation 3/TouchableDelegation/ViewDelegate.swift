//
//  ViewDelegate.swift
//  TouchableDelegation
//
//  Created by Tia King on 10/27/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

protocol ViewDelegate {
    func userDidTouch()
}

class TouchbleView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        square.delegate = self
    }
    
    func userDidTouch() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        print(storyboard)
        guard let chooseVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        
        self.navigationController?.pushViewController(chooseVC, animated: true)
    }

}
