//
//  NewsCell.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit

class NewsCell: UITableViewCell {

    //MARK: - IBOutlet(s)
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
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
        newsTitleLabel.text = article.title
        authorLabel.text = article.author
        newsDescriptionLabel.text = article.description
        let imageUrl = URL(string: article.urlToImage ?? "")
        newsImage.sd_setImage(with: imageUrl)
    }

}
