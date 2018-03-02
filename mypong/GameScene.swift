//
//  GameScene.swift
//  mypong
//
//  Created by xcode on 2/27/18.
//  Copyright © 2018 brent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var myPaddle = SKSpriteNode()
    var fireBall = SKEmitterNode()
    var myScore = SKLabelNode()
    var enemyScore = SKLabelNode()
    var pause: SVLSpriteNodeButton!
    var score = [Int]()
   
    
    override func didMove(to view: SKView) {
        
        pause = self.childNode(withName: "pause") as! SVLSpriteNodeButton
        pause.isUserInteractionEnabled = true
        
        myScore = self.childNode(withName: "myscore") as! SKLabelNode
        enemyScore = self.childNode(withName: "enemyscore") as! SKLabelNode
        
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        myPaddle = self.childNode(withName: "myPaddle") as! SKSpriteNode
//        fireBall = ball.childNode(withName: "fireBall") as! SKEmitterNode
        
        
        fireBall.targetNode = ball;
        ball.addChild(fireBall)
      
        let walls = SKPhysicsBody(edgeLoopFrom :self.frame)
        
        walls.friction = 0
        walls.restitution = 1
        
        self.physicsBody = walls
        start()
    }
    
    
    func start(){
        score = [0,0]
        myScore.text = "\(score[0])"
        enemyScore.text = "\(score[1])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
    }
    
    func scores(winner: SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if (winner == myPaddle) {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
        }else if (winner == enemy){
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -15, dy: -15))
        }
        
        myScore.text = "\(score[0])"
        enemyScore.text = "\(score[1])"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            if currentGameType == .player2{
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    myPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                myPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
            myPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGameType == .player2{
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    myPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                myPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
       
        switch currentGameType {
        case .beginner:
            if (ball.position.y < 0){
                enemy.run(SKAction.moveTo(x: 0, duration: 1.3))
            }else if(ball.position.y > 120) {
                enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            }
            break
        case .intermediate:
            if (ball.position.y < 0){
                enemy.run(SKAction.moveTo(x: 0, duration: 1.0))
            }else if(ball.position.y > 120) {
                enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            }
            break
        case .expert:
            if (ball.position.y < 0){
                enemy.run(SKAction.moveTo(x: 0, duration: 0.7))
            }else if(ball.position.y > 120) {
                enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            }
            break
        case .player2:
            
            break
        }
        if (ball.position.y < 0){
            enemy.run(SKAction.moveTo(x: 0, duration: 0.5))
        }else if(ball.position.y > 160) {
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
        }
        
        
        if(ball.position.y <= myPaddle.position.y - 50){
            scores(winner: enemy)
        }else if(ball.position.y >= enemy.position.y + 50){
            scores(winner: myPaddle)
        }
    }
}
