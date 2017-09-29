//
//  ViewController.swift
//  hustle-mode
//
//  Created by Derek Freer on 9/29/17.
//  Copyright © 2017 Derek Freer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBg: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var onMode: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func onPressPowerButton(_ sender: Any) {
        powerButton.isHidden = true
        darkBlueBg.isHidden = true
        onMode.isHidden = false
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 100, width: 375, height: 667)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.statusLabel.isHidden = false
            self.reset.isHidden = false
        }
    }
    
    @IBAction func onClickReset(_ sender: Any) {
        
        reset.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 400, width: 375, height: 667)
        }) { (finished) in
            self.onMode.isHidden = true
            self.hustleLabel.isHidden = true
            self.statusLabel.isHidden = true
            
            self.powerButton.isHidden = false
            self.darkBlueBg.isHidden = false
        }
    }
    
}
