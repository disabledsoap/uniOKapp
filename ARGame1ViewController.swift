
import UIKit
import SceneKit
import ARKit

class ARGame1ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var SituationLabel: UILabel!
    @IBOutlet weak var FirstAnswerButton: UIButton!
    @IBOutlet weak var SecondAnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SituationLabel.layer.cornerRadius     = 15
        FirstAnswerButton.layer.cornerRadius  = 15
        SecondAnswerButton.layer.cornerRadius = 15
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
      
        sceneView.session.run(configuration)
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    @IBAction func AddFluffy(_ sender: Any) {
        
        let FluffyNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        FluffyNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        sceneView.scene.rootNode.addChildNode(FluffyNode)
        
    }
    
    struct MyCameraCoordinates {
      var x = Float()
      var y = Float()
      var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> MyCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = MyCameraCoordinates()
        cc.z = cameraCoordinates.translation.z
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        
        return cc
    }
    
    @IBAction func Answer1(_ sender: Any) {
        
    }
    
    @IBAction func Answer2(_ sender: Any) {
        
    }
    
}
