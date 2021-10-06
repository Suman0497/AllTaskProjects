

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var imageView: UIImageView!

  
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = true
  }
  
  var photo: Photo? {
    didSet {
      if let photo = photo {
        imageView.image = photo.image
       
      }
    }
  }
}
