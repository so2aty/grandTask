//
//  HomeVC.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - IBOutlet(s)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - Variable(s)
    var homeVM = HomeVM()
    var newDetailsVM = NewsDetailsVM()
    
    //MARK: - Helper functions
    func setUI () {
        
        //Title for Screen
        title = "Home"
        
        // Confirm DataSource & Delegate for TableView
        homeTableView.dataSource = self
        homeTableView.delegate = self
       
        // Confirm searchBar Delegate
        searchBar.delegate = self
        
        // Registration of Payment Method Cell
        homeTableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
        
        getNews(search: nil)
    }
}

// MARK: - HomeVC DataSource & Delegate Methods
extension HomeVC: UITableViewDelegate , UITableViewDataSource {
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.newsList.count
    }
    
    // Cell for Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.configure(article: homeVM.newsList[indexPath.row])
        
        return cell
    }
    
    //Did Select Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailsVC.instantiate()
        vc.article = homeVM.newsList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Load Data Methods
extension HomeVC {
    // Get News Function
    func getNews (search: String?) {
        self.startLoading()
        homeVM.BindingParsingclouser = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async { [self] in
                self.stopLoading()
                self.homeTableView.reloadData()
            }
        }
        homeVM.getAllNews(search: search)
    }
}

// MARK: - Search In API
extension HomeVC: UISearchBarDelegate , UISearchControllerDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text, text != "" {
            self.getNews(search: text)
        }else{
            self.getNews(search: nil)
        }
    }
}
