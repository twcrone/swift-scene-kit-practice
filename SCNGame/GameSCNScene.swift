//
//  GameSCNScene.swift
//  SCNGame
//
//  Created by Todd Crone on 6/24/15.
//  Copyright (c) 2015 Todd Crone. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class GameSCNScene: SCNScene {
    
    let scnView: SCNView!
    let _size: CGSize!
    var scene:SCNScene!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(currentview view: SCNView) {
        super.init()
        scnView = view
        _size = scnView.bounds.size
        
        scene = SCNScene()
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.yellowColor()
    }
}