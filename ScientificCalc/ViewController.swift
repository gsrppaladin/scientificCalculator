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
    var operand: Float = 0 //i think this is what is put into the resultLbl. 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setZero = true
        op = 0
        resultLbl.text = "0"
    }
    
    
    @IBAction func numericPressed(_ sender: UIButton) {
        
        if setZero {
            resultLbl.text = "0"
            setZero = false
        }
        
        var result: Float = Float(resultLbl.text!)!
        
        result = result * 10 + Float(sender.tag)
        //the 10 is because after the first number is used it goes up by ten. 
        resultLbl.text = "\(result)"
        
    }
    
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if op != 0 {
            operand = calculateResults(oprtr: op)
            resultLbl.text = "\(operand)"
            op = sender.tag // because we pressed the operator.
            setZero = true
        } else {
            //if op is equal to 0 that means that that is the first time that we pressed that operator and we need to calc result of float 
            let res: Float =  Float(resultLbl.text!)!
            operand = res
            setZero = true
            op = sender.tag
        }
    
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        
        resultLbl.text = "0"
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        operand = calculateResults(oprtr: op)
        resultLbl.text = "\(operand)"
        op = 0
        setZero = true
    }
    
    
    
    func calculateResults(oprtr: Int) -> Float {
        
        var returnValue: Float = Float(resultLbl.text!)!
        
        switch (oprtr) {
        case 1:
            returnValue = operand * returnValue
            break
            
        case 2:
            returnValue = operand / returnValue
            break
            
        case 3:
            returnValue = operand + returnValue
            break
        case 4:
            returnValue = operand - returnValue
            break
            
        default:
            break
        }
        
        return returnValue
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

