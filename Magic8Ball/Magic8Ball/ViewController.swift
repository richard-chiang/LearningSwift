//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Richard Chiang on 2017-10-08.
//  Copyright © 2017 Richard Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    let ballList = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshBallImage() {
        let randomN: Int = Int(arc4random_uniform(UInt32(ballList.count)))
        ballImageView.image = UIImage(named: ballList[randomN])
    }
    
    @IBAction func askBtnClicked(_ sender: UIButton) {
        refreshBallImage()
    } 
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        refreshBallImage()
    }
}

