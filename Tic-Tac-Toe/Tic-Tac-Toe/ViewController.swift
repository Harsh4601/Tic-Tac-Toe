//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Harsh Londhekar on 19/07/20.
//  Copyright © 2020 Harsh Londhekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //cross player
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    //HapticFeedback Controller
    let haptic = haptickFeedback()

    @IBOutlet weak var whoWon: UILabel!
    @IBAction func action(_ sender: UIButton) {
        
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
        if ( activePlayer == 1 ){
            
            sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
            activePlayer = 2
        }else{
            sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
            activePlayer = 1
        }
            
        }
        
        for combination in winningCombinations{
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1{
                    //Cross has won
                    print("CROSS")
                    whoWon.text = "Cross Has Won!"
                }
                else{
                    // Nought has won
                    print("NOUGHT")
                    whoWon.text = "Nought Has Won!"
                }
                
                playAgain.isHidden = false
                whoWon.isHidden = false
                
            }
            
        }
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0{
                gameIsActive = true
               break
                
            }
        }
        if gameIsActive == false
        {
            whoWon.text = "Its A Draw!"
            whoWon.isHidden = false
            playAgain.isHidden = false
        }
        
    }
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
         
        playAgain.isHidden = true
        whoWon.isHidden = true
        
        for i in 1...9{
           let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        haptic.haptiFeedback1()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

