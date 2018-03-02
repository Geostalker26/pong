//
//  SVLSpriteNodeButton.swift
//  mypong
//
//  Created by xcode on 3/2/18.
//  Copyright © 2018 brent. All rights reserved.
//

import SpriteKit

class SVLSpriteNodeButton: SKSpriteNode {

    func touchDown(atPoint pos : CGPoint) {
        
        alpha = 0.5
        self.scene?.view?.isPaused = true
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        alpha = 1.0
        self.scene?.view?.isPaused = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{self.touchDown(atPoint: t.location(in: self))}
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{self.touchUp(atPoint: t.location(in: self))}
    }
}
