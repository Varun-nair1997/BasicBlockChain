//
//  ViewController.swift
//  BlockChainApp
//
//  Created by Varun Nair on 2/14/20.
//  Copyright © 2020 Varun Nair. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var U1Amt: UITextField!
    @IBOutlet weak var U2Amt: UITextField!
    @IBOutlet weak var U1Label: UILabel!
    @IBOutlet weak var U2Label: UILabel!
    

    let firstAccount = 0001
    let secondAccount = 0002
    var BTCChain = BlockChain()
    let reward = 100

    var accounts: [String: Int] = ["0000": 1000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction", message: "Please check transaction details", preferredStyle: .alert)
    
//    blockchain maintainence and verification code
    func transaction(from: String, to: String, Amount: Int, type: String)
    {
        if accounts[from] == nil
        {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        }
        else if accounts[from]!-Amount<0
        {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        }
        else
        {
            accounts.updateValue(accounts[from]!-Amount, forKey: from)
        }
        
        if accounts[to] == nil
        {
            accounts.updateValue(Amount, forKey: to)
        }
        else
        {
            accounts.updateValue(accounts[to]!+Amount, forKey: to)
        }
        if type == "genesis"
        {
            BTCChain.createInitialBlock(data: "From: \(from): To: \(to): Amount: \(Amount) BTC")
        }
        else if type == "normal"
        {
            BTCChain.createBlock(data: "From: \(from): To: \(to): Amount: \(Amount) BTC")
        }
    }
    func chainState()
    {
        for i in 0...BTCChain.chain.count-1
        {
            print ("\tBlock: \(BTCChain.chain[i].index!)\n\tHash: \(BTCChain.chain[i].hash!)\n\tPreviousHAsh: \(BTCChain.chain[i].prev_hash!)\n\tData\(BTCChain.chain[i].data!)")
            U1Label.text = "\(accounts[String(describing: firstAccount)]!) BTC"
            U2Label.text = "\(accounts[String(describing: secondAccount)]!) BTC"
            print(accounts)
            print(chainValidity())
        }
    }
    
    func chainValidity() -> String
    {
        var isChainValid = true
            for i in 1...BTCChain.chain.count-1
            {
                if BTCChain.chain[i].prev_hash != BTCChain.chain[i-1].hash
                {
                    isChainValid = false
                }
            }
        return "Chain is valid: \(isChainValid)\n"
    }
    
//    UI connection code
    @IBAction func redMine(_ sender: Any)
    {
        transaction(from: "0000", to: "\(firstAccount)", Amount: 100, type: "normal")
        print("New block mined by: \(firstAccount)")
        chainState()
    }
    @IBAction func greenMine(_ sender: Any)
    {
        transaction(from: "0000", to: "\(secondAccount)", Amount: 100, type: "normal")
        print("New block mined by: \(secondAccount)")
        chainState()
    }
    @IBAction func redSend(_ sender: Any)
    {
        if U1Amt.text == ""
        {
            present(invalidAlert, animated: true, completion: nil)
        }
        else
        {
            transaction(from: "\(firstAccount)", to: "\(secondAccount)", Amount: Int(U1Amt.text!)!, type: "normal")
            print("\(U1Amt.text!) BTC sent from \(firstAccount) to \(secondAccount)")
            chainState()
            U1Amt.text = ""
        }
    }
    @IBAction func greenSend(_ sender: Any)
    {
        if U2Amt.text == ""
        {
            present(invalidAlert, animated: true, completion: nil)
        }
        else
        {
            transaction(from: "\(secondAccount)", to: "\(firstAccount)", Amount: Int(U2Amt.text!)!, type: "normal")
            print("\(U2Amt.text!) BTC sent from \(secondAccount) to \(firstAccount)")
            chainState()
            U2Amt.text = ""
        }
    }
    
//    For display code
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        transaction(from: "0000", to: "\(firstAccount)", Amount: 50, type: "genesis")
        transaction(from: "\(firstAccount)", to: "\(secondAccount)", Amount: 10, type: "normal")
        chainState()
        self.invalidAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
