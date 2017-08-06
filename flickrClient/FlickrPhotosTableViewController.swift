//
//  FlickrPhotosTableViewController.swift
//  flickrClient
//
//  Created by Marco Del Angel on 8/1/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import UIKit

class FlickrPhotosTableViewController: UITableViewController {
    
    var flickrPhotoController = FlickrPhotoController()
    var flickrPhotos = [FlicrPhoto]()
    var photosArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flickrPhotoController.fetchPhoto { (flickrPhotos) in
            guard let flickrPhotos = flickrPhotos else { return }
            DispatchQueue.main.async {
                self.flickrPhotos = flickrPhotos
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flickrPhotos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FlickrCellTableViewCell
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: FlickrCellTableViewCell, forItemAt indexPath: IndexPath){
        let flickrObject = flickrPhotos[indexPath.row]
        cell.tittleLabel.text = flickrObject.title
        self.flickrPhotoController.fethcImage(url: flickrObject.url!) {
            (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                guard let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath == indexPath else { return }
                cell.imageView?.image = image
            }
        }
    }
}
