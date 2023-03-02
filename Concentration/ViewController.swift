//
//  ViewController.swift
//  Concentration
//
//  Created by serhan on 02.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    var emoji = ["🐹","🦞","🐸","💧","🌨","🌫","🐹","🦞","🐸","💧","🌨","🌫"]
    var buttonName = [String]()
    
    @IBOutlet weak var ScoreLabel: UILabel!
    var Score = 0 {
        didSet {
            ScoreLabel.text = "Score: \(Score)"
        }
    }
    
    var deleteButtonScore = 0 {
        didSet {
            if deleteButtonScore == 0 {
                performSegue(withIdentifier: "page2", sender: nil)
            }
        }
    }
    

    @IBOutlet var collectionButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0...emoji.count-1{
            
            let randomEmoji = emoji.randomElement()!
            
            buttonName.append(randomEmoji)
            
            emoji.remove(at: emoji.firstIndex(of: randomEmoji)!)
        }
        
        for Name in collectionButtons {
            Name.setTitle("", for: .normal)
            deleteButtonScore += 1
        }
        
        
    }
    
    var ad = ""
    var oldTag = 15
    
    @IBAction func cardButtonTapped(_ sender: UIButton) {
        
        
        
        sender.setTitle(buttonName[sender.tag], for: .normal)
        sender.backgroundColor = .white
        
        if (sender.currentTitle == ad) && (sender.tag != oldTag ) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                sender.removeFromSuperview()
                self.deleteButtonScore -= 1
            }
            
            for buton in collectionButtons {
                if (buton.tag == oldTag) && (buton.currentTitle == ad) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        buton.removeFromSuperview()
                        self.deleteButtonScore -= 1
                    }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            sender.setTitle("", for: .normal)
            sender.backgroundColor = .orange
            
        }
        
        ad = sender.currentTitle!
        oldTag = sender.tag
        Score += 1
        
    }

}

