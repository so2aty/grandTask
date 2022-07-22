//
//  ViewController.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit
import SDWebImage

class HeadLinesVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    //MARK: - IBOutlet(s)
    @IBOutlet weak var headLinesCollectionView: UICollectionView!
    
    //MARK: - Variable(s)
    var headLinesVM = HeadLineVM()
    
    //MARK: - Helper functions
    func setUI () {
        
        title = "Head Lines"
        
        // Confirm DataSource & Delegate for TableView
        headLinesCollectionView.delegate = self
        headLinesCollectionView.dataSource = self
        
        // Registration of Payment Method Cell
        headLinesCollectionView.register(UINib(nibName: "headLineCell", bundle: nil), forCellWithReuseIdentifier: "headLineCell")
        
        getHeadLines()
        }
}

// MARK: - HeadLinesVC DataSource & Delegate Methods
extension HeadLinesVC: UICollectionViewDelegate , UICollectionViewDataSource {
    
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headLinesVM.headLinesList.count
    }
    
    // Cell for item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = headLinesCollectionView.dequeueReusableCell(withReuseIdentifier: "headLineCell", for: indexPath) as! headLineCell
        
        cell.configure(article: headLinesVM.headLinesList[indexPath.item])
        
        return cell
    }
    
    // Didselect at item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WebViewVC.instantiate()
        vc.urlString = headLinesVM.headLinesList[indexPath.item].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

// MARK: - Collection View Flow Layout Methods
extension HeadLinesVC : UICollectionViewDelegateFlowLayout {

    // Number of items per Row
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 , height: 400)
    }
}

// MARK: - Load Data Methods
extension HeadLinesVC {
    // Get News Function
    func getHeadLines () {
        self.startLoading()
        headLinesVM.BindingParsingclouser = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async { [self] in
                self.stopLoading()
                self.headLinesCollectionView.reloadData()
              }
        }
        headLinesVM.getAllHeadLines()
    }
}
