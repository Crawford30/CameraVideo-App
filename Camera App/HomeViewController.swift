//
//  ViewController.swift
//  Camera App
//
//  Created by Joel Crawford on 7/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
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
        let myVertCVSpacing:  CGFloat = CGFloat( 12.0 )
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

extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = listVdeosCollectionView?.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath)
        // cell!.contentView.backgroundColor = .systemYellow
         
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Utilities.vibrate()
        print("Cell: \(indexPath.item) tapped")
    }

    
}



extension HomeViewController:UICollectionViewDelegateFlowLayout{
    
}
