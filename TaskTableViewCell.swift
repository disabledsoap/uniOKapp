
import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishLabel:UILabel!
    @IBOutlet weak var CellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
        
        CellView.layer.cornerRadius = 18
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
