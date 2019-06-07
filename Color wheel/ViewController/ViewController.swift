//
//  ViewController.swift
//  Color wheel
//
//  Created by Stephanie Bowles on 6/7/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func changeColor(_ sender: ColorWheel) {
        view.backgroundColor = sender.color
    }
    
    
}

