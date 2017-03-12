//
//  ViewController.swift
//  ScientificCalc
//
//  Created by Sam Greenhill on 3/5/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftStackViewLeftContraint: NSLayoutConstraint!
    
    
    @IBOutlet var rightStackViewLeftConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillLayoutSubviews() {
        checkOrientation(orientation: UIDevice.current.orientation)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkOrientation(orientation: UIDevice.current.orientation)
    }

    func checkOrientation(orientation: UIDeviceOrientation) {
        if orientation.isPortrait {
            leftStackViewLeftContraint.isActive = false
            rightStackViewLeftConstraint.isActive = true
        } else {
            leftStackViewLeftContraint.isActive = true
            rightStackViewLeftConstraint.isActive = false
        }
        
    }
    
    


}

