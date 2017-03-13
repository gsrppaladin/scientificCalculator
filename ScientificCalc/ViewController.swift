//
//  ViewController.swift
//  ScientificCalc
//
//  Created by Sam Greenhill on 3/5/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBOutlet var leftStackViewLeftContraint: NSLayoutConstraint!
    @IBOutlet var rightStackViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet var resultLbl: UILabel!
    
    var op:Int = 0 //track which operator was pressed.
    var setZero: Bool = true
    var operand: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setZero = true
        op = 0
        resultLbl.text = "0"
    }
    
    
    @IBAction func numericPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func operatorPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
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

