//
//  NewsDetailsVC.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit
import SDWebImage

class NewsDetailsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUI()
    }

    //MARK: - IBOutlet(s)
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var urlBtn: UIButton!

    //MARK: - IBAction(s)
    @IBAction func urlBtnPressed(_ sender: UIButton) {
        if article?.url == "" {
            let alert = Alerts.instance.showAlert(title: "No URL", message: "There is no URL Available for this Artical")
            self.present(alert, animated: true, completion: nil)
        } else {
            guard  let Url = URL(string: article?.url ?? "") else {return}
            if UIApplication.shared.canOpenURL(Url) {
                UIApplication.shared.open(Url)
            }
        }
    }
    
    //MARK: - Variable(s)
    var article: Articles?
    
    
    //MARK: - Helper functions
    func setUI () {
        
        //Title for Screen
        title = "News Details"
        
        guard let article = article else {
            return
        }
        
        //Setting Veiw objects
        let imageUrl = URL(string: article.urlToImage ?? "")
        newsImage.sd_setImage(with: imageUrl)
        titleLabel.text = article.title
        authorLabel.text = article.author
        descriptionTextView.text = article.description
        publishedLabel.text = article.publishedAt
    }
}

//MARK: - VC Initializer
extension NewsDetailsVC {
    static func instantiate() -> NewsDetailsVC {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NewsDetailsVC") as! NewsDetailsVC
        return vc
    }
}
