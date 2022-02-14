//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var buttonButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        let checkResult = quizBrain.checkAnswer(userAnswer)
        
        if(checkResult)
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.quizProgreesion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        // change the multiple choice answer button
        
        topButton.setTitle(quizBrain.getChoice(0), for: .normal)
        middleButton.setTitle(quizBrain.getChoice(1), for: .normal)
        buttonButton.setTitle(quizBrain.getChoice(2), for: .normal)
        
        topButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        buttonButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
}
