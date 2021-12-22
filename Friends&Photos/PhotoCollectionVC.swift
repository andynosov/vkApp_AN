//
//  PhotoCollectionViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit



class PhotoCollectionVC: UICollectionViewController {
    

    var userPhotoCollection: [UIImage?] = []
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotoCollection.count
    }
    
    
    //конфигурация ячейки
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCellIdentifier", for: indexPath) as? FriendPhotoCollectionViewCell else { return UICollectionViewCell()}
        cell.friendLargePhoto.image = userPhotoCollection[indexPath.row]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    return CGSize(width: (view.frame.size.width / 2) - 22, height: 150)
//    }
}
