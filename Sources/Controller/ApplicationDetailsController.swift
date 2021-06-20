//
//  ApplicationDetailsController.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation
import UIKit

public class ApplicationDetailsController : UIViewController {
    
    private let mobileKey : String
    
    public init(mobileKey: String) {
        self.mobileKey = mobileKey
        super.init(nibName: nil, bundle: nil)
    }
    
    private let tAndCLabel : PaddedLabel = {
        let label = PaddedLabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.font = UIFont.regular(size: 12)
        let attributedString = NSMutableAttributedString(string: "To learn how your information will be used, review Cowrywise’s ", attributes: [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0xABABAB)])
        attributedString.append(NSAttributedString(string: "terms of user", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryDark]))
        attributedString.append(NSAttributedString(string: " and ", attributes: [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0xABABAB)]))
        attributedString.append(NSAttributedString(string: "privacy policy.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryDark]))
        attributedString.append(NSAttributedString(string: "You may revoke access to your information at any time. To learn more about your Bleyt Identity, please visit our ", attributes: [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0xABABAB)]))
        attributedString.append(NSAttributedString(string: "help center", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryDark]))
        label.attributedText = attributedString
        
        label.layer.cornerRadius = 7
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(netHex: 0xF2F2F2).cgColor
        
        return label
    }()
    
    private let cancelButton = UIButton.create(title: "Cancel", style: .DefaultOutline)
    private let allowButton = UIButton.create(title: "Allow", style: .Default)
    
    private let closeImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ic_close_round")
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    private lazy var headerContentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(netHex: 0xFBFBFB)
        
        view.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        let appIconView = UIImageView()
        appIconView.translatesAutoresizingMaskIntoConstraints = false
        appIconView.image = UIImage(named: "AppIcon")
        appIconView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        appIconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.medium(size: 20)
        titleLabel.text = "Continue with Bleyt"
        
        view.addSubview(appIconView)
        view.addSubview(titleLabel)
        view.addSubview(self.closeImageView)
        
        appIconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        appIconView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: appIconView.trailingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.closeImageView.leadingAnchor, constant: -20).isActive = true
        
        self.closeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.closeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        return view
    }()
    
    private let gradentBackgroundView : GradientView = {
        let gradientView = GradientView()
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.startColor = UIColor(netHex: 0x2B827D)
        gradientView.endColor = UIColor.primaryDark
        return gradientView
    }()
    
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var mainContainerView : UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 7
        
        
        containerView.addSubview(self.headerContentView)
        containerView.addSubview(self.collectionView)
        containerView.addSubview(self.tAndCLabel)
        containerView.addSubview(self.cancelButton)
        containerView.addSubview(self.allowButton)

        
        NSLayoutConstraint.activate([
            self.headerContentView.topAnchor.constraint(equalTo: containerView.topAnchor),
            self.headerContentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            self.headerContentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            self.allowButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            self.allowButton.widthAnchor.constraint(equalToConstant: 120),
            self.allowButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            self.cancelButton.bottomAnchor.constraint(equalTo: allowButton.bottomAnchor),
            self.cancelButton.widthAnchor.constraint(equalTo: self.allowButton.widthAnchor),
            self.cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            self.tAndCLabel.bottomAnchor.constraint(equalTo: self.allowButton.topAnchor, constant: -48),
            self.tAndCLabel.trailingAnchor.constraint(equalTo: self.allowButton.trailingAnchor, constant: 16),
            self.tAndCLabel.leadingAnchor.constraint(equalTo: self.allowButton.leadingAnchor, constant: 16),
            
            self.collectionView.topAnchor.constraint(equalTo: self.headerContentView.bottomAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.tAndCLabel.topAnchor, constant: -15)
        ])
        
        return containerView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        self.initViews()
        
    }
    
    private func initData() {
        self.closeImageView.isUserInteractionEnabled = true
        self.closeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onCancelClick)))
        
        self.allowButton.addTarget(self, action: #selector(self.onAllowClick), for: .touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(self.onCancelClick), for: .touchUpInside)
    }
    
    private func initViews() {
        
        self.view.addSubview(self.gradentBackgroundView)
        self.view.addSubview(self.mainContainerView)
        
        NSLayoutConstraint.activate([
            self.gradentBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.gradentBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.gradentBackgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.gradentBackgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.mainContainerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.mainContainerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.mainContainerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.mainContainerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
        
    }
    
    @objc func onCancelClick() {
        
    }
    
    @objc func onAllowClick() {
        NetworkManager.shared.getApplicationRequest(mobileKey: self.mobileKey) { details in
            //update the collectionView
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ApplicationDetailsController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
}
