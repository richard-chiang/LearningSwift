//
//  ViewController.swift
//  Xylophone
//
//  Created by Richard Chiang on 12/10/2017.

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        var note: String = "note1"
        
        switch (sender.tag) {
        case 1:
            note = "note1"
        case 2:
            note = "note2"
        case 3:
            note = "note3"
        case 4:
            note = "note4"
        case 5:
            note = "note5"
        case 6:
            note = "note6"
        case 7:
            note = "note7"
        default:
            print("not sure where you are clicking")
        }
        
        let url = Bundle.main.url(forResource: note, withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
        
            player.prepareToPlay()
            player.play()
        } catch let error as Error {
            print(error.localizedDescription)
        }
    }
    
  

}

