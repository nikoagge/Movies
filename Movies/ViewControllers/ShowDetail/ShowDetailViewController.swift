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
    
    let show: ServiceShow?
    
    init(
        show: ServiceShow?
    ) {
        self.show = show
        
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
