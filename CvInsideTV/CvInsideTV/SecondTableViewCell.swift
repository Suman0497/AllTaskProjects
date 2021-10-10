//
//  SecondTableViewCell.swift
//  CvInsideTV
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondCollection: UICollectionView!

    
   let names: [String] =
          ["Elon","NASA","Mars","Allen", "John", "Smitha", "Alexander", "Joe", "Angelina", "Taylor", "Louis", "Sabrina", "Samanta Austin", "Abraham", "Karolina"]
      
      let profileImages = ["elon","nasa","mars","image1", "image2", "image3","image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12"]
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondCollection.backgroundColor = .black
        secondCollection.delegate = self
        secondCollection.dataSource = self
        secondCollection.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SecondCollectionViewCell")    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension SecondTableViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath as IndexPath) as! SecondCollectionViewCell
       cell.profileImages.layer.cornerRadius = cell.profileImages.frame.size.width / 2
        
         cell.profileImages.clipsToBounds = true
        cell.profileImages.image = UIImage(named: profileImages[indexPath.item])
        cell.profileNames.text = names[indexPath.item]
               return cell
    }
}
extension SecondTableViewCell: UICollectionViewDelegate{
    
}
extension SecondTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 129, height: 147)
      }

}
