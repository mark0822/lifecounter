//
//  ViewController.swift
//  lifecounter
//
//  Created by Mark on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    var count1 = 20
    var count2 = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPlayer1Buttons()
        setPlayer2Buttons()
    }
    
    func setPlayer1Buttons(){
        let add1Button = view.viewWithTag(11) as? UIButton
        add1Button?.addTarget(self, action: #selector(ViewController.add1ButtonClicked1(sender:)), for: .touchUpInside)
        let add5Button = view.viewWithTag(15) as? UIButton
        add5Button?.addTarget(self, action: #selector(ViewController.add5ButtonClicked1(sender:)), for: .touchUpInside)
        let minus1Button = view.viewWithTag(-11) as? UIButton
        minus1Button?.addTarget(self, action: #selector(ViewController.minus1ButtonClicked1(sender:)), for: .touchUpInside)
        let minus5Button = view.viewWithTag(-15) as? UIButton
        minus5Button?.addTarget(self, action: #selector(ViewController.minus5ButtonClicked1(sender:)), for: .touchUpInside)
    }
    
    @objc func add1ButtonClicked1(sender: UIButton){
        count1 += 1
        let player1 = view.viewWithTag(1) as? UITextView
        player1?.text = String(count1)
    }
    
    @objc func add5ButtonClicked1(sender: UIButton){
        count1 += 5
        let player1 = view.viewWithTag(1) as? UITextView
        player1?.text = String(count1)
    }
    
    @objc func minus1ButtonClicked1(sender: UIButton){
        count1 -= 1
        let player1 = view.viewWithTag(1) as? UITextView
        player1?.text = String(count1)
        if player1Loses() {
            let resultTextView = view.viewWithTag(99) as? UITextView
            resultTextView?.text = "Player 1 LOSES!"
            resultTextView?.font = UIFont.systemFont(ofSize: 30)
            resultTextView?.textColor = .systemRed
            resultTextView?.textAlignment = NSTextAlignment.center
        }
    }
    
    @objc func minus5ButtonClicked1(sender: UIButton){
        count1 -= 5
        let player1 = view.viewWithTag(1) as? UITextView
        player1?.text = String(count1)
        if player1Loses() {
            let resultTextView = view.viewWithTag(99) as? UITextView
            resultTextView?.text = "Player 1 LOSES!"
            resultTextView?.font = UIFont.systemFont(ofSize: 30)
            resultTextView?.textColor = .systemRed
            resultTextView?.textAlignment = NSTextAlignment.center
        }
    }
    
    func player1Loses() -> Bool{
        if count1 <= 0 {
            return true
        }
        return false
    }
    
    func setPlayer2Buttons(){
        let add1Button = view.viewWithTag(21) as? UIButton
        add1Button?.addTarget(self, action: #selector(ViewController.add1ButtonClicked2(sender:)), for: .touchUpInside)
        let add5Button = view.viewWithTag(25) as? UIButton
        add5Button?.addTarget(self, action: #selector(ViewController.add5ButtonClicked2(sender:)), for: .touchUpInside)
        let minus1Button = view.viewWithTag(-21) as? UIButton
        minus1Button?.addTarget(self, action: #selector(ViewController.minus1ButtonClicked2(sender:)), for: .touchUpInside)
        let minus5Button = view.viewWithTag(-25) as? UIButton
        minus5Button?.addTarget(self, action: #selector(ViewController.minus5ButtonClicked2(sender:)), for: .touchUpInside)
    }
    
    @objc func add1ButtonClicked2(sender: UIButton){
        count2 += 1
        let player2 = view.viewWithTag(2) as? UITextView
        player2?.text = String(count2)
    }
    
    @objc func add5ButtonClicked2(sender: UIButton){
        count2 += 5
        let player2 = view.viewWithTag(2) as? UITextView
        player2?.text = String(count2)
    }
    
    @objc func minus1ButtonClicked2(sender: UIButton){
        count2 -= 1
        let player2 = view.viewWithTag(2) as? UITextView
        player2?.text = String(count2)
        if player2Loses() {
            let resultTextView = view.viewWithTag(99) as? UITextView
            resultTextView?.text = "Player 2 LOSES!"
            resultTextView?.font = UIFont.systemFont(ofSize: 30)
            resultTextView?.textColor = .systemRed
            resultTextView?.textAlignment = NSTextAlignment.center
        }
    }
    
    @objc func minus5ButtonClicked2(sender: UIButton){
        count2 -= 5
        let player2 = view.viewWithTag(2) as? UITextView
        player2?.text = String(count2)
        if player2Loses() {
            let resultTextView = view.viewWithTag(99) as? UITextView
            resultTextView?.text = "Player 2 LOSES!"
            resultTextView?.font = UIFont.systemFont(ofSize: 30)
            resultTextView?.textColor = .systemRed
            resultTextView?.textAlignment = NSTextAlignment.center
        }
    }
    
    func player2Loses() -> Bool{
        if count2 <= 0 {
            return true
        }
        return false
    }
}

