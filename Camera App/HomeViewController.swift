//
//  ViewController.swift
//  Camera App
//
//  Created by Joel Crawford on 7/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    let myVertCVSpacing:  CGFloat = CGFloat( 8.0 )
    
    
    private var listVdeosCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavItem()
        configureCollectionView()
        
    }


    
    
    //MARK: - Nav Item
      private func setNavItem(){
        navigationItem.title = "AR Camera"
          let videoImage   = UIImage(systemName: "video.fill")!
          let listVideos = UIImage(systemName: "list.dash")!

          let videoButton = UIBarButtonItem(image: videoImage,  style: .plain, target: self, action: #selector(didTapTakeVideoButton))
          let listVideoButton = UIBarButtonItem(image: listVideos,  style: .plain, target: self, action: #selector(didTapListViedeosButton))

          navigationItem.rightBarButtonItems = [listVideoButton,videoButton]
    }
    
    
    //MARK: - CONFIGURE COLLECTION VIEW
    private func configureCollectionView(){
        let myCellSize: CGSize = CGSize( width: (view.frame.size.width)-12, height: view.frame.size.height/2)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = myVertCVSpacing
        layout.minimumInteritemSpacing = myVertCVSpacing
        layout.itemSize = myCellSize
        
//        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height )
        listVdeosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        guard let listVdeosCollectionView = listVdeosCollectionView else {
            return
        }
        listVdeosCollectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        listVdeosCollectionView.dataSource = self
        listVdeosCollectionView.delegate = self
        
        
        

        view.addSubview(listVdeosCollectionView)
        listVdeosCollectionView.frame = view.bounds
    }
    
    
    
    
    
    
    
    
    
    
    @objc func didTapListViedeosButton(sender: AnyObject){
        Utilities.vibrate()
        
    }

    @objc   func didTapTakeVideoButton(sender: AnyObject){
        Utilities.vibrate()
       
    }
    
    
   
   

}


//MARK: - UICollection View Data Source Methods
extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = listVdeosCollectionView?.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath)
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Utilities.vibrate()
        print("Cell: \(indexPath.item) tapped")
    }

    
}



//MARK: - UICollection View Delegate Methods
extension HomeViewController:UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let maxSize:CGSize = UIScreen.main.bounds.size
//        let itemWidth: CGFloat = maxSize.width
//        let itemHeight: CGFloat = maxSize.height * 0.40
//        return CGSize(width: itemWidth,  height: itemHeight)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: myVertCVSpacing, left: myVertCVSpacing, bottom: myVertCVSpacing, right: myVertCVSpacing)
    }
    
}
