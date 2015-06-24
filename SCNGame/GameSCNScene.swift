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
        scnView.backgroundColor = UIColor.grayColor()
        
        self.addGeometryNode()
        self.addLightSourceNode()
        self.addCameraNode()
        self.addFloorNode()
    }
    
    func addGeometryNode() {
        let sphereGeometry = SCNSphere(radius: 1.0)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.orangeColor()
        
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.position = SCNVector3Make(0.0, 0.0, 0.0)
        scene.rootNode.addChildNode(sphereNode)
    }
    
    func addLightSourceNode() {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 10, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
    }
    
    func addCameraNode() {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        scene.rootNode.addChildNode(cameraNode)
    }
 
    func addFloorNode() {
        let floorNode = SCNNode()
        let floorGeometry = SCNFloor()
        floorNode.geometry = floorGeometry
        floorNode.position.y = -1.0
        
        scene.rootNode.addChildNode(floorNode)
        
    }
}