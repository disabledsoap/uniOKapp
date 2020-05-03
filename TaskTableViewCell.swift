
import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishLabel:UILabel!
    @IBOutlet weak var CellView: UIView!
    @IBOutlet weak var ShadowView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
        
        CellView.layer.cornerRadius = 18
        
        ShadowView.layer.shadowColor = UIColor.gray.cgColor
        ShadowView.layer.shadowOpacity = 1
        ShadowView.layer.shadowOffset = .zero
        ShadowView.layer.shadowRadius = 10
        
        ShadowView.layer.cornerRadius = 25
        
        startLabel.layer.cornerRadius = 18
        finishLabel.layer.cornerRadius = 18
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
