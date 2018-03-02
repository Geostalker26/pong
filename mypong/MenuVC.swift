//
//  MenuVC.swift
//  mypong
//
//  Created by xcode on 3/1/18.
//  Copyright © 2018 brent. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    
    case beginner
    case intermediate
    case expert
    case player2
}

class MenuVC: UIViewController {
    
    
    @IBAction func Player2(_ sender: Any) {
        goToGame(game: .player2)
    }
    
    @IBAction func beginner(_ sender: Any) {
        goToGame(game: .beginner)
    }
    
    @IBAction func intermediate(_ sender: Any) {
        goToGame(game: .intermediate)
    }
    
    @IBAction func expert(_ sender: Any) {
        goToGame(game: .expert)
    }
    
    func goToGame(game: gameType){
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
    
}
