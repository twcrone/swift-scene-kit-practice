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
        
//        self.addGeometryNode()
//        self.addSecondSphere()
//        self.addThirdSphere()
//        self.addBox()
        self.addBoxes()
        self.addBall()
        self.addLightSourceNode()
        self.addCameraNode()
        self.addFloorNode()
    }

    func addBoxes() {

        var y = Float(-1.0)
        
        _addBox(SCNVector3Make(-1, y, 0))
        _addBox(SCNVector3Make(-0.5, y, 0))
        _addBox(SCNVector3Make(0, y, 0))
        _addBox(SCNVector3Make(0.5, y, 0))
        _addBox(SCNVector3Make(1, y, 0))
        
        y++
        
        _addBox(SCNVector3Make(0.5, y, 0))
        _addBox(SCNVector3Make(0, y, 0))
        _addBox(SCNVector3Make(-0.5, y, 0))

        y++
        
        _addBox(SCNVector3Make(0, y, 0))
    }
    
    func _addBox(position: SCNVector3) {
        let geo = SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0.0)
        geo.firstMaterial?.diffuse.contents = randomColor()
        
        let boxNode = SCNNode(geometry: geo)
        boxNode.position = position
        boxNode.physicsBody = SCNPhysicsBody.dynamicBody()
        //        boxNode.rotation = SCNVector4(x: 0.5, y: 0.15, z: 0.37, w: 0.5)
        
        scene.rootNode.addChildNode(boxNode)
        
        boxNode.name = "box"
    }
    
    func addBall() {
        let collisionBox = SCNBox(width: 10.0, height: 10.0, length: 10.0,
            chamferRadius: 0)
        
        let sphereGeometry = SCNSphere(radius: 0.4)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.blackColor()
        
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.position = SCNVector3Make(1, 0, 12)
        sphereNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: collisionBox, options: nil)
        sphereNode.physicsBody = SCNPhysicsBody.dynamicBody()
        sphereNode.physicsBody?.mass = 50
        //sphereNode.physicsBody?.angularVelocityFactor = SCNVector3Zero
        sphereNode.physicsBody?.velocity = SCNVector3(x: -1.25, y: 0.0, z: -25.0)
        sphereNode.physicsBody?.rollingFriction = 0.5
        sphereNode.name = "bigSphere"
        scene.rootNode.addChildNode(sphereNode)
    }

    func addGeometryNode() {
        let collisionBox = SCNBox(width: 10.0, height: 10.0, length: 10.0,
            chamferRadius: 0)

        let sphereGeometry = SCNSphere(radius: 1.0)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.purpleColor()
        
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.position = SCNVector3Make(0.0, 10.0, -30.0)
        sphereNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: collisionBox, options: nil)
        sphereNode.physicsBody = SCNPhysicsBody.dynamicBody()
        sphereNode.physicsBody?.mass = 50
        //sphereNode.physicsBody?.angularVelocityFactor = SCNVector3Zero
        sphereNode.physicsBody?.velocity = SCNVector3(x: 0.0, y: 0.0, z: 25.0)
        sphereNode.physicsBody?.rollingFriction = 0.5
        sphereNode.name = "bigSphere"
        scene.rootNode.addChildNode(sphereNode)
    }
    
    func addSecondSphere() {
        let collisionBox = SCNBox(width: 10.0, height: 10.0, length: 10.0,
            chamferRadius: 0)
        
        let secondSphereGeometry = SCNSphere(radius: 0.5)
        secondSphereGeometry.firstMaterial?.diffuse.contents = UIColor.blueColor()
        let random = Float(arc4random_uniform(7)) - 4.0
        let secondSphereNode = SCNNode(geometry: secondSphereGeometry)
        secondSphereNode.position = SCNVector3(x: random, y: 10.0, z: 5.0)
        secondSphereNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: collisionBox, options: nil)
        secondSphereNode.physicsBody = SCNPhysicsBody.dynamicBody()
        secondSphereNode.physicsBody?.mass = 20
        secondSphereNode.physicsBody?.rollingFriction = 0.5

        scene.rootNode.addChildNode(secondSphereNode)
        
//        let moveUp = SCNAction.moveByX(0.0, y: 1.0, z: 0.0, duration: 1.0)
//        let moveDown = SCNAction.moveByX(0.0, y: -1.0, z: 0.0, duration: 1.0)
//        let sequence = SCNAction.sequence([moveUp,moveDown])
//        let repeatedSequence = SCNAction.repeatActionForever(sequence)
//        secondSphereNode.runAction(repeatedSequence)
    }
    
    var _counter = 0
    
    func update() {
//        _counter++
//        
//        if _counter % 5 == 0 {
//            addSmallSphere()
//        }
//        if _counter % 50 == 0 {
//            addBox()
//        }
//        if _counter % 200 == 0 {
//            addGeometryNode()
//            addThirdSphere()
//        }
//        
//        if _counter % 250 == 0 {
//            addSecondSphere()
//        }
    }
    
    func randomColor() -> UIColor {
        let random = Int(arc4random_uniform(6))
        println(random)
        switch random {
        case 1: return UIColor.redColor()
        case 2: return UIColor.orangeColor()
        case 3: return UIColor.yellowColor()
        case 4: return UIColor.greenColor()
        case 5: return UIColor.blueColor()
        case 6: return UIColor.purpleColor()
        default: return UIColor.whiteColor()
        }
    }
    
    func addBox() {
        let geo = SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0.0)
        geo.firstMaterial?.diffuse.contents = randomColor()
        
        let boxNode = SCNNode(geometry: geo)
        boxNode.position = SCNVector3Make(-1.0, 7.0, 6.0)
//        boxNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: geo, options: nil)
        boxNode.physicsBody = SCNPhysicsBody.dynamicBody()
        boxNode.rotation = SCNVector4(x: 0.5, y: 0.15, z: 0.37, w: 0.5)
        
        scene.rootNode.addChildNode(boxNode)
        
        boxNode.name = "box"
    }
    
    func addSmallSphere() {
        let geo = SCNSphere(radius: 0.25)
        geo.firstMaterial?.diffuse.contents = randomColor()
        
        let boxNode = SCNNode(geometry: geo)
        let randomX = Float(arc4random_uniform(7)) - 4.0
        let randomZ = Float(arc4random_uniform(7))

        boxNode.position = SCNVector3Make(randomX, 10.0, randomZ)
        //        boxNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: geo, options: nil)
        boxNode.physicsBody = SCNPhysicsBody.dynamicBody()
        
        scene.rootNode.addChildNode(boxNode)
        
        boxNode.name = "small"
    }

    func addThirdSphere() {
        let collisionBox = SCNBox(width: 10.0, height: 10.0, length: 10.0,
            chamferRadius: 0)
        
        let secondSphereGeometry = SCNSphere(radius: 0.5)
        secondSphereGeometry.firstMaterial?.diffuse.contents = UIColor.redColor()
        
        let secondSphereNode = SCNNode(geometry: secondSphereGeometry)
        secondSphereNode.position = SCNVector3(x: 0.0, y: 15.0, z: 7.0)
        secondSphereNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: collisionBox, options: nil)
        secondSphereNode.physicsBody = SCNPhysicsBody.dynamicBody()
        secondSphereNode.physicsBody?.mass = 20
        secondSphereNode.physicsBody?.rollingFriction = 0.5
        
        scene.rootNode.addChildNode(secondSphereNode)
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
        floorNode.physicsBody = SCNPhysicsBody.staticBody()
        floorNode.physicsBody?.restitution = 0.75
        floorNode.physicsBody?.rollingFriction = 0.5
        
        scene.rootNode.addChildNode(floorNode)
        
    }
}

