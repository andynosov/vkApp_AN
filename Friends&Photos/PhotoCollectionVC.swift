//
//  PhotoCollectionViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit



final class PhotoCollectionVC: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(
            nibName: "PhotoCollectionCell",
            bundle: nil),
                                forCellWithReuseIdentifier: "photoCollectionCell")
    }
    var userPhotoCollection: [UIImage?] = []
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotoCollection.count
    }
    
    
    //конфигурация ячейки
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "photoCollectionCell",
                for: indexPath) as? PhotoCollectionCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(image: userPhotoCollection[indexPath.row] ?? UIImage())

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer { collectionView.deselectItem(
            at: indexPath,
            animated: true) }
        performSegue(
            withIdentifier: "segueToLargePhoto",
            sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToLargePhoto" {
            guard let largePhoto = segue.destination as? PhotoLargeVC else { return }
            
            if let indexPath = collectionView.indexPathsForSelectedItems?.first{
                largePhoto.stackOfLargePhotos = userPhotoCollection
                largePhoto.selectedPhotoNumber = indexPath.row

            }
        }
    }
   
}
