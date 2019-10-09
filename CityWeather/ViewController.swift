//
//  ViewController.swift
//  CityWeather
//
//  Created by Md Zahidul Islam Mazumder on 24/8/19.
//  Copyright © 2019 Md Zahidul Islam Mazumder. All rights reserved.
//

import UIKit
var city = ""
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func york(_ sender: UIButton) {
        info(ct: "Tokyo")
    }
    
    @IBAction func london(_ sender: UIButton) {
        info(ct: "London")
    }
    
    @IBAction func moscow(_ sender: UIButton) {
        info(ct: "Moscow")
    }
    
    @IBAction func dhaka(_ sender: UIButton) {
        info(ct: "Dhaka")
    }
    
    @IBAction func beijing(_ sender: UIButton) {
        info(ct: "Beijing")
    }
    
    @IBAction func lahore(_ sender: UIButton) {
        info(ct: "Lahore")
    }
    
    @IBAction func seoul(_ sender: UIButton) {
        info(ct: "Seoul")
    }
    func info(ct:String)  {
        city = ct
        performSegue(withIdentifier: "getWeather", sender: self)
    }
}

