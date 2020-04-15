//
//  ViewController.swift
//  CAEmitterLayer
//
//  Created by 林祐辰 on 2020/4/14.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    func particle () -> CAEmitterCell {
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
         
        let starship = UIImage(named: "STARSHIP.png")!
        let ship = CALayer()
        ship.frame = CGRect(x: (view.bounds.width) / 2  - (starship.size.width)/10 , y: (view.bounds.height)/2 - (starship.size.height)/10, width: starship.size.width/5, height: starship.size.height/5)
        ship.contents = starship.cgImage
//        ship.contentsScale = starship.scale
        view.layer.insertSublayer(ship,at:2)
        
        let particleCell = CAEmitterCell()
        particleCell.contents = UIImage (named:"particle.png")?.cgImage
        particleCell.birthRate = 8
        particleCell.lifetime = 15
        particleCell.velocity = 20
        particleCell.lifetimeRange = 5
        particleCell.velocityRange = 3
        particleCell.scale = 0.05
        particleCell.scaleRange = 0.2
        particleCell.scaleSpeed = 0.03
        particleCell.spin = 1
        particleCell.spinRange = 0.5
        particleCell.yAcceleration = 20

        let fire = CAEmitterCell()
        fire.contents = UIImage(named: "fire.png")?.cgImage
        fire.birthRate = 340
        fire.lifetime = 0.4
        fire.velocity = 80
        fire.velocityRange = 30
        fire.emissionRange = CGFloat.pi/180*145
        fire.yAcceleration = 200
        fire.scale = 0.4
        fire.scaleSpeed = 0.01
        fire.color = UIColor(red: 255/255, green: 251/255, blue: 136/255, alpha: 1).cgColor
        
        
        let particleCellLayer = CAEmitterLayer()
        particleCellLayer.emitterCells = [particleCell]
        particleCellLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -100)
        particleCellLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        particleCellLayer.emitterShape = .line

        view.layer.insertSublayer(particleCellLayer,at:0)
        
        
        let fireEmitterLayer = CAEmitterLayer()
        fireEmitterLayer.emitterCells = [fire]
        fireEmitterLayer.emitterPosition = CGPoint (x: (view.bounds.width) / 2  - (starship.size.width)/39, y: (view.bounds.height)/2 + (starship.size.height)/11 )
       fireEmitterLayer.emitterSize = CGSize(width: 10, height: 1.1)
       fireEmitterLayer.emitterShape = .point
        
        view.layer.insertSublayer(fireEmitterLayer,at:1)
    }


}

