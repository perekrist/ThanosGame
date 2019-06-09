//
//  ViewController.swift
//  ThanosGame
//
//  Created by Перегудова Кристина on 11/04/2019.
//  Copyright © 2019 HITs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BestScoreLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ThanosImage: UIImageView!
    @IBOutlet weak var ThanosGameLabel: UILabel!
    @IBOutlet weak var PlayBotton: UIButton!
    @IBOutlet weak var InstructionButton: UIButton!
    @IBOutlet weak var SettingsButton: UIButton!
    @IBOutlet weak var InstructionImage: UIImageView!
    
    var bestScore = 0
    var currentScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel.text = "Score: \(currentScore)"
        if currentScore > bestScore {
            bestScore = currentScore
        }
        BestScoreLabel.text = "Best score: \(bestScore)"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : GameViewController = segue.destination as! GameViewController
        destVC.bestScore1 = bestScore
        destVC.score = currentScore
    }
    @IBAction func InstructionPressed(_ sender: UIButton) {
        if InstructionImage.isHidden {
            InstructionImage.isHidden = false
            ThanosImage.isHidden = true
            ThanosGameLabel.isHidden = true
            PlayBotton.isHidden = true
            SettingsButton.isHidden = true            
            
        }
        else {
            InstructionImage.isHidden = true
            ThanosImage.isHidden = false
            ThanosGameLabel.isHidden = false
            PlayBotton.isHidden = false
            SettingsButton.isHidden = false


        }
    }
    


}

