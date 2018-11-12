//
//  NewsFeedVC.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 08/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit
import SDWebImage


class NewsFeedVC: BaseVC {

    var newsFeedCategories    : [NewsFeedCategory]?
    var newsFeedItems         : [NewsFeedItem]?
    
    var currentCategory : NewsFeedCategory? {
        
        didSet {
            
            self.setUpNavigationTitleWithString(title: currentCategory?.name ?? "")
        }
    }


    @IBOutlet weak var tableView  : UITableView?
    @IBOutlet weak var categoryCollectionView  : UICollectionView?
    @IBOutlet weak var categoryCollectionViewContainer  : UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setting up initialization for properties and calling methods
        self.commonInit()
        
        //setting up collection view layout to show the news categories
        self.setupCollectionViewFlowLayout()
    }
    
    func commonInit() {
        
        self.newsFeedCategories = AppManager.sharedInstance.fetchNewsFeedCategories()
        self.categoryCollectionView?.reloadData()
        
        
        if (self.newsFeedCategories?.count)! > 0 {
            
            self.currentCategory = self.newsFeedCategories![0]

            //making network call to fetch news feeds for a specific category
            self.fetchNewsFeedByCategory(categoryUrl: self.newsFeedCategories?[0].url ?? "", categoryName: self.newsFeedCategories?[0].name ?? "")

        }
        
        self.tableView?.tableHeaderView = self.categoryCollectionViewContainer
    }
    
    func setupCollectionViewFlowLayout() {
        
        //setting up collection view layout for direction and space between cells
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        layout.minimumInteritemSpacing = 2.0
        layout.minimumLineSpacing = 2.0
        
        categoryCollectionView?.collectionViewLayout = layout
    }

    func fetchNewsFeedByCategory(categoryUrl : String, categoryName : String) {
        
        //
        NewsFeedAccess().fetchNewsFeed(categoryUrl: categoryUrl, success: { (menuItems) in
            
            self.newsFeedItems = menuItems
            self.tableView?.reloadData()
            
//            GIFLoader.sharedInstance.removeLoaderFromView(baseView: self.view)
            self.tableView?.showWithFadeAnimation(duration: 0.5, delay: 0.0)
            
        }) { (errorMessage) in
            
//            GIFLoader.sharedInstance.removeLoaderFromView(baseView: self.view)
            
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //getitng the indexpath for tapped row
        let selectedIndexPath = self.tableView?.indexPathForSelectedRow
        
        if let newsFeedUrl = self.newsFeedItems?[selectedIndexPath!.row].url {
            
            //assigning properties of destination view controller
            (segue.destination as? NewsFeedDetailVC)?.currentUrlString = newsFeedUrl
            (segue.destination as? NewsFeedDetailVC)?.articleAuthor = self.newsFeedItems?[selectedIndexPath!.row].author
            (segue.destination as? NewsFeedDetailVC)?.articleTitle = self.newsFeedItems?[selectedIndexPath!.row].title
        }
    }
}


extension NewsFeedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.newsFeedCategories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category = self.newsFeedCategories?[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFeedCategoryCell", for: indexPath) as! NewsFeedCategoryCell
        
        //setting up text for category title and background color
        cell.lblCategoryName?.text = category?.name ?? ""
        cell.containerView?.backgroundColor = category?.themeColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat = collectionView.frame.size.width/CGFloat(3.0)
        let height : CGFloat = collectionView.frame.size.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = self.newsFeedCategories?[indexPath.row]
        self.currentCategory = category
        
        if let categoryUrl = category?.url {
            
            //making network call for fetching news feed for tapped category in collection view
            self.fetchNewsFeedByCategory(categoryUrl: categoryUrl, categoryName: self.newsFeedCategories?[indexPath.row].name ?? "")
        }
    }
}

extension NewsFeedVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.newsFeedItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedVCCell", for: indexPath) as! NewsFeedVCCell
        
        let newsFeedItem = self.newsFeedItems?[indexPath.row]
        
        //setting up text for title and description for a single row
        cell.lblNewsTitle?.text = newsFeedItem?.title
        cell.lblNewsShortDescription?.text = newsFeedItem?.description
        
        cell.newsFeedImageView?.sd_setIndicatorStyle(.gray)
        //setShowActivityIndicator(true)
        cell.newsFeedImageView?.sd_setShowActivityIndicatorView(true)
        //setIndicatorStyle(.gray)
        
        if let imageUrl = newsFeedItem?.urlToImage {
            
            //displaying news feed image with animation
            cell.newsFeedImageView?.setImageWithAnimation(imageUrl: URL(string: imageUrl)!)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //showing detail of a news feed when tapped
        self.performSegue(withIdentifier: kStoryboardSegue_ShowNewsDetails, sender: self)
    }
}
