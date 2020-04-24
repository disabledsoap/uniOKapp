import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var CellView: UIView!
   // @IBOutlet weak var Circle: UIView!
    
    
  /*  override init(style: UICollectionViewCellStyle, reuseidentifier: String?) {
        super.init(style: style, reuseidentifier: reuseidentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    /*   let defaults = UserDefaults.standard
    
    struct Keys {
        static let colorset = "colorset"
    }
    
    func getColor() {
        
        
        
    }*/
    
   /*func DrawCircle() {
     
       
        
        let circleCenter = Circle.center
        
        let circlePath = UIBezierPath(arcCenter: circleCenter, radius: (Circle.bounds.width/2 - 5), startAngle: -CGFloat.pi/2, endAngle: (2 * CGFloat.pi), clockwise: true)
        
        let CircleLayer = CAShapeLayer()
        CircleLayer.path = circlePath.cgPath
     
        switch ColorValueVC.shared.ColorValue{
        case 0:
            CircleLayer.strokeColor = UIColor.clear.cgColor
        case 1:
           CircleLayer.strokeColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        case 2:
            CircleLayer.strokeColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        case 3:
            CircleLayer.strokeColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        case 4:
            CircleLayer.strokeColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        case 5:
            CircleLayer.strokeColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case 6:
            CircleLayer.strokeColor = #colorLiteral(red: 1, green: 0.9141723998, blue: 0.9191490494, alpha: 1)
        default:
           CircleLayer.strokeColor = UIColor.clear.cgColor
        }
        CircleLayer.lineWidth = 2
        CircleLayer.strokeEnd = 0
        CircleLayer.fillColor = UIColor.clear.cgColor
        CircleLayer.lineCap = CAShapeLayerLineCap.round
        
        let Animation = CABasicAnimation(keyPath: "strokeEnd")
        Animation.duration = 1.5
        Animation.toValue = 1
        Animation.fillMode = CAMediaTimingFillMode.forwards
        Animation.isRemovedOnCompletion = false
        
        CircleLayer.add(Animation, forKey: nil)
        Circle.layer.addSublayer(CircleLayer)
        Circle.layer.backgroundColor = UIColor.clear.cgColor
    
        SaveCircle()
    
    func SaveCircle() {
        defaults.set(CircleLayer, forKey: Keys.colorset)
    }
    
    }*/
  
   
    
}
