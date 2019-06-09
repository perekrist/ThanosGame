//
//  GameViewController.swift
//  ThanosGame
//
//  Created by Перегудова Кристина on 11/04/2019.
//  Copyright © 2019 HITs. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var LokiButton: UIButton!
    @IBOutlet weak var ThanosButton: UIButton!
    @IBOutlet weak var BossButton: UIButton!
    @IBOutlet weak var ThanosGloveButton: UIButton!
    
    var score = 0
    var bestScore1 = 0
    var seconds = 10
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0
        LokiButton.isHidden = false
        ThanosButton.isHidden = false
        BossButton.isHidden = false
        ScoreLabel.text = "Score: \(score)"
        TimerLabel.text = "\(seconds) s"
        runTimer()
    }
    @IBAction func ThanosButtonPressed(_ sender: Any) {
        score += 1
        ScoreLabel.text = "Score: \(score)"
    }
    @IBAction func LokiButtonPressed(_ sender: Any) {
        score -= 10
        ScoreLabel.text = "Score: \(score)"
    }
    @IBAction func BossButtonPressed(_ sender: Any) {
        score += 5
        ScoreLabel.text = "Score: \(score)"
    }
    @IBAction func ThanosGloveButtonPressed(_ sender: Any) {
        score += 7
        ScoreLabel.text = "Score: \(score)"
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        TimerLabel.text = "\(seconds) s"
        if seconds == 0 {
            timer.invalidate()
            LokiButton.isHidden = true
            ThanosButton.isHidden = true
            BossButton.isHidden = true
            performSegue(withIdentifier: "ViewController", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        destVC.bestScore = bestScore1
        destVC.currentScore = score
    }

    

}
