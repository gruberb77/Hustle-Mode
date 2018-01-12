//
//  ViewController.swift
//  Hustle-Mode
//
//  Created by Brent Gruber on 1/11/18.
//  Copyright © 2018 Brent Gruber. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var DarkBlueBG: UIImageView!
    @IBOutlet weak var PowerBtn: UIButton!
    @IBOutlet weak var CloudHolder: UIView!
    @IBOutlet weak var Rocket: UIImageView!
    @IBOutlet weak var HustleLbl: UILabel!
    @IBOutlet weak var Clouds: UIImageView!
    
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func PowerBtnPressed(_ sender: Any) {
        CloudHolder.isHidden = false;
        Rocket.isHidden = false;
        Clouds.isHidden = false;
        DarkBlueBG.isHidden = true;
        PowerBtn.isHidden = true;
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.Rocket.frame = CGRect(x: 0, y: 20, width: 375, height: 402)
        }) { (finished) in
            self.HustleLbl.isHidden = false
        }
    }
}

