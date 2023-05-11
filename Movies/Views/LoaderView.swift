//
//  LoaderView.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import UIKit

final class LoaderView {
    static let shared = LoaderView()
    
    private var blurImageView = UIImageView()
    private var activityIndicatorView = UIActivityIndicatorView()
    
    private init() {
        setupUI()
    }
    
    func show() {
        DispatchQueue.main.async(execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImageView)
            UIApplication.shared.keyWindow?.addSubview(self.activityIndicatorView)
        })
    }
    
    func hide() {
        DispatchQueue.main.async(execute: {
            self.blurImageView.removeFromSuperview()
            self.activityIndicatorView.removeFromSuperview()
        })
    }
}

private extension LoaderView {
    func setupUI() {
        setupBlurImageView()
        setupActivityIndicatorView()
    }
    
    func setupBlurImageView() {
        blurImageView.frame = UIScreen.main.bounds
        blurImageView.backgroundColor = .black
        blurImageView.isUserInteractionEnabled = true
        blurImageView.alpha = 0.5
    }
    
    func setupActivityIndicatorView() {
        activityIndicatorView.style = .large
        activityIndicatorView.center = blurImageView.center
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .red
    }
}
