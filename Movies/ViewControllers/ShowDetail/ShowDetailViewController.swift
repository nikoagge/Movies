//
//  ShowDetailViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

final class ShowDetailViewController: UIViewController {
    let showImageImageView = UIImageView.newAutoLayout()
    let showDescriptionLabel = UILabel.newAutoLayout()
    
    var showImage: UIImage?
    var showName: String?
    var showLanguage: String?
    var showType: String?
    var showRating: String?
    
    init(
        showImage: UIImage?,
        showName: String?,
        showLanguage: String?,
        showType: String?,
        showRating: String?
    ) {
        self.showImage = showImage
        self.showName = showName
        self.showLanguage = showLanguage
        self.showType = showType
        self.showRating = showRating
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}
