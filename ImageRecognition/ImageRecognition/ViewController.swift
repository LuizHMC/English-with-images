//
//  ViewController.swift
//  ImageRecognition
//
//  Created by Luiz Henrique Monteiro de Carvalho on 24/03/20.
//  Copyright © 2020 Luiz Henrique Monteiro de Carvalho. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        //viewWillAppear(true)
        
     
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
        configuration.detectionImages = referenceImages

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        let referenceImage = imageAnchor.referenceImage
        //referenceImage.name
        let plane = SCNPlane(width: referenceImage.physicalSize.width, height: referenceImage.physicalSize.height)
        let text = SCNText(string: referenceImage.name, extrusionDepth: 2)
        
        let materialText = SCNMaterial()
        materialText.diffuse.contents = UIColor.blue
        text.materials = [materialText]
        
        plane.firstMaterial?.diffuse.contents = UIColor.white
        
        let planeNode = SCNNode(geometry: plane)
        let textNode = SCNNode(geometry: text)
        textNode.position = planeNode.position
        textNode.scale = SCNVector3(x:0.001, y:0.001, z:0.001)
        
        
        planeNode.eulerAngles.x = -Float.pi / 2
        textNode.eulerAngles.x = -Float.pi / 2
        
        planeNode.opacity = 0.01
        
        node.addChildNode(planeNode)
        node.addChildNode(textNode)
        
        //planeNode.runAction(waitRemoveAction)
        //textNode.runAction(waitRemoveAction)
    }
    
    var waitRemoveAction: SCNAction {
        return .sequence([.wait(duration: 5.0), .fadeOut(duration: 1.0 ), .removeFromParentNode()])
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
