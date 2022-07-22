//
//  headLineCell.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit

class headLineCell: UICollectionViewCell {

    //MARK: - IBOutlet(s)
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImage.layer.cornerRadius = 10
    }
    
    func configure(article: Articles?) {
        guard let article = article else {
            return
        }
        titleLabel.text = article.title
        authorLabel.text = article.author
        let imageUrl = URL(string: article.urlToImage ?? "")
        newsImage.sd_setImage(with: imageUrl)
    }

}
