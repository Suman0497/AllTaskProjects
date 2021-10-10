//
//  FirstSectionTableViewCell.swift
//  CvInsideTV
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FirstSectionTableViewCell: UITableViewCell {
    
    
    var techImages = ["news1", "news2", "news3", "news4", "news5", "news6", "news7", "news8", "news9"]
    
    var techNews = [
        "Vitamin A treatment trial for Covid loss of smell",
        "Facebook to act on illegal sale of Amazon rainforest","China's Xi vows 'reunification' with Taiwan", "Energy price cap not fit for purpose - suppliers", "Nations agree to 15% minimum corporate tax rate", "Mars scientists now know where to look for life", "'How I escaped a hidden world of gangs and exploitation'", "Kristen Stewart: Why playing Diana made me nervous", "Doctors warned about 'dry scooping' fitness fad"]
    
    @IBOutlet weak var collectionOut: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionOut.dataSource = self
        self.collectionOut.delegate = self
        self.collectionOut.register(UINib.init(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstCollectionViewCell")
        collectionOut.backgroundColor = UIColor(red: 64/255, green: 69/255, blue: 82/255, alpha: 1)
        collectionOut.backgroundColor = .black
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension FirstSectionTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return techImages.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath as IndexPath) as! FirstCollectionViewCell
        cell.techNews.text = techNews[indexPath.item]
        cell.techImages.image = UIImage(named: techImages[indexPath.item])
        return cell
    }
}
extension FirstSectionTableViewCell: UICollectionViewDelegate{
    
}
extension FirstSectionTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 380, height: 300)
    }
}
