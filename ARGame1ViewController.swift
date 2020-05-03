
import UIKit
import SceneKit
import ARKit

class ARGame1ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var FirstARButton: UIButton!
    @IBOutlet weak var FirstCorrectButton: UIButton!
    @IBOutlet weak var FirstNotCorrectButton: UIButton!
    
    @IBOutlet weak var SecondARButton: UIButton!
    @IBOutlet weak var SecondCorrectButton: UIButton!
    @IBOutlet weak var SecondNotCorrectButton: UIButton!
    
    @IBOutlet weak var ThirdARButton: UIButton!
    @IBOutlet weak var ThirdCorrectButton: UIButton!
    @IBOutlet weak var ThirdNotCorrectButton: UIButton!
    
    @IBOutlet weak var FourthARButton: UIButton!
    @IBOutlet weak var FourthCorrectButton: UIButton!
    @IBOutlet weak var FourthNotCorrectButton: UIButton!
    
    @IBOutlet weak var FifthARButton: UIButton!
    @IBOutlet weak var FifthNotCorrectButton: UIButton!
    @IBOutlet weak var FifthCorrectButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ResultViewController.shareddd.First  = 0
        ResultViewController.shareddd.Second = 0
        ResultViewController.shareddd.Third  = 0
        ResultViewController.shareddd.Fourth = 0
        ResultViewController.shareddd.Fifth  = 0
        
        FirstARButton.layer.cornerRadius  = 10
        SecondARButton.layer.cornerRadius = 10
        ThirdARButton.layer.cornerRadius  = 10
        FourthARButton.layer.cornerRadius = 10
        FifthARButton.layer.cornerRadius  = 10
        
        FirstCorrectButton.layer.cornerRadius  = 15
        SecondCorrectButton.layer.cornerRadius = 15
        ThirdCorrectButton.layer.cornerRadius  = 15
        FourthCorrectButton.layer.cornerRadius = 15
        FifthCorrectButton.layer.cornerRadius  = 15

        FirstNotCorrectButton.layer.cornerRadius  = 15
        SecondNotCorrectButton.layer.cornerRadius = 15
        ThirdNotCorrectButton.layer.cornerRadius  = 15
        FourthNotCorrectButton.layer.cornerRadius = 15
        FifthNotCorrectButton.layer.cornerRadius  = 15
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        
    }
    
    @IBAction func FirstCorrectTapped(_ sender: Any) {
      FirstCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      FirstNotCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
      ResultViewController.shareddd.First  = 1
      ResultViewController.shareddd.FirstTextAnswer = "Your answer is right!"
    }
    @IBAction func FirstNotCorrectTapped(_ sender: Any) {
        FirstCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        FirstNotCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      ResultViewController.shareddd.First  = 0
      ResultViewController.shareddd.FirstTextAnswer = "Introductions don't have to be a big deal. Say 'Hi' and make sure you use your name! You might also want to say, 'Nice to meet you'"
    }
    @IBAction func SecondCorrectTapped(_ sender: Any) {
        SecondNotCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        SecondCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      ResultViewController.shareddd.Second = 1
      ResultViewController.shareddd.SecondTextAnswer = "Your answer is right!"
    }
    @IBAction func SecondNotCorrectTapped(_ sender: Any) {
        SecondNotCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        SecondCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
      ResultViewController.shareddd.Second = 0
      ResultViewController.shareddd.SecondTextAnswer = "Invite him to join you by saying, 'Do you want to sit here?' in class or at a group activity"
    }
    @IBAction func ThirdCorrectTapped(_ sender: Any) {
        ThirdNotCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        ThirdCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      ResultViewController.shareddd.Third  = 1
      ResultViewController.shareddd.ThirdTextAnswer = "Your answer is right!"
    }
    @IBAction func ThirdNotCorrectTapped(_ sender: Any) {
        ThirdNotCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        ThirdCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
      ResultViewController.shareddd.Third  = 0
      ResultViewController.shareddd.ThirdTextAnswer = "Comment on Fluffy's answer, Say something back, like 'Yeah, cucumbers are realyy tasty' or something else"
    }
    @IBAction func FourthCorrectTapped(_ sender: Any) {
        FourthNotCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        FourthCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      ResultViewController.shareddd.Fourth = 1
      ResultViewController.shareddd.FourthTextAnswer = "Your answer is right!"
    }
    @IBAction func FourthNotCorrectTapped(_ sender: Any) {
        FourthNotCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        FourthCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
      ResultViewController.shareddd.Fourth = 0
      ResultViewController.shareddd.FourthTextAnswer = "Teddy can feel better if you will cheer him up"
    }
    @IBAction func FifthCorrectTaped(_ sender: Any) {
        FifthNotCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        FifthCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
      ResultViewController.shareddd.Fifth  = 1
      ResultViewController.shareddd.FifthTextAnswer = "Your answer is right!"
    }
    @IBAction func FifthNotCorrectTapped(_ sender: Any) {
        FifthNotCorrectButton.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        FifthCorrectButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
      ResultViewController.shareddd.Fifth  = 0
      ResultViewController.shareddd.FifthTextAnswer = "You can say, 'I have to go,' 'It's been nice talking,' or 'It was nice to meet you' if you just met."
    }
    
    @IBAction func FinishButtonTapped(_ sender: Any) {
        
        let FirstValue = ResultViewController.shareddd.First
        let SecondValue = ResultViewController.shareddd.Second
        let ThirdValue = ResultViewController.shareddd.Third
        let FourthValue = ResultViewController.shareddd.Fourth
        let FifthValue = ResultViewController.shareddd.Fifth
        
        
        ResultViewController.shareddd.Result = FirstValue! + SecondValue! + ThirdValue! + FourthValue! + FifthValue! 
    }
    
    @IBAction func AddFirstAR(_ sender: Any) {
        
        let cupNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        cupNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "wavingbird.dae", inDirectory: "SceneKit Asset Catalog.scnassets") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        cupNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(cupNode)
    }
    
    @IBAction func AddSecondAR(_ sender: Any){
        
        let SadBearNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        SadBearNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "SadBear.dae", inDirectory: "SceneKit Asset Catalog.scnassets") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        SadBearNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(SadBearNode)
    }
    
    @IBAction func AddThirdAR(_ sender: Any){
        
        let PickleNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        PickleNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "pickle.dae", inDirectory: "SceneKit Asset Catalog.scnassets") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        PickleNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(PickleNode)
    }
    
    @IBAction func AddFourthAR (_ sender: Any){
        
        let GuyNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        GuyNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "aquy.dae", inDirectory: "SceneKit Asset Catalog.scnassets") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        GuyNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(GuyNode)
        
    }
    
    @IBAction func AddFifthAR (_ sender: Any){
        
        let PikachuNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        PikachuNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "pikachu.dae", inDirectory: "SceneKit Asset Catalog.scnassets") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        PikachuNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(PikachuNode)
        
    }
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
    }
    
}
