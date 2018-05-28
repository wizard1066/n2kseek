//
//  SeekingViewController.swift
//  n2kseek
//
//  Created by localuser on 28.05.18.
//  Copyright © 2018 cqd.ch. All rights reserved.
//

import UIKit

class SeekingViewController: UIViewController, UIDropInteractionDelegate{

    @IBOutlet var dropZone: UIView! {
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate:  self))
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return  session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    var imageFetcher: ImageFetcher!
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher() { (url, image) in
            DispatchQueue.main.async {
                self.seekView.backgroundImage = image
            }
        }
        session.loadObjects(ofClass: NSURL.self) { nsurl in
            if let url = nsurl.first as? URL {
                self.imageFetcher.fetch(url)
            }
        }
        session.loadObjects(ofClass: UIImage.self) { images in
            if let image = images.first as? UIImage {
                self.imageFetcher.backup = image
            }
        }
    }
    
    @IBOutlet weak var seekView: SeekView!

}
