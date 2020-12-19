//
//  DetailViewController.swift
//  CollectionViewWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

import UIKit

class DetailViewController: UIViewController {

    // MVVM
    // BountyInfo 하나 필요
    
    // View
    // imgView, nameLabel, bountyLabel, closeButton
    // view들은 viewModel를 통해서 구성되기?
    
    // ViewModel
    // DetailViewModel
    // 뷰레이어에서 필요한 메서드 만들기
    // 모델 가지고 있기, BountyInfo 등

    let viewModel = DetailViewModel()
    
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var bountyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubViews()
        self.constraintsSetting()
        self.putDataIntoViews()
        // Do any additional setup after loading the view.
        self.prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showAnimation()
        
    }
    
    // animation
    private func prepareAnimation(){
        self.nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        self.bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        self.nameLabel.alpha = 0
        self.bountyLabel.alpha = 0
        
        
    }
    private func showAnimation(){
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
            
            
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
            self.bountyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }, completion: nil)
        
        
        // imgView에 애니메이션 적용
        UIView.transition(with: self.imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func constraintsSetting(){
        self.closeButtonSetting()
        self.imgViewSetting()
        self.bountyLabelSetting()
        self.nameLabelSetting()
    }
    func addSubViews(){
        self.view.addSubview(self.imgView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.bountyLabel)
        self.view.addSubview(self.closeButton)
    }
    
    func putDataIntoViews(){
//        guard let bountyInfo = self.bountyInfo else { return }
        guard let bountyInfo = self.viewModel.bountyInfo else { return }
        self.imgView.image = bountyInfo.image
        self.nameLabel.text = bountyInfo.name
        self.bountyLabel.text = String(bountyInfo.bounty)
        self.closeButton.setImage(UIImage(named: "close_ic"), for: UIControl.State.normal)
        
    }
    
    func closeButtonSetting(){
        
        self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20).isActive = true
        self.closeButton.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -10).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.addTarget(self, action: #selector(self.touchUpCloseButton(_:)), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func touchUpCloseButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    func imgViewSetting(){
        self.imgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        self.imgView.widthAnchor.constraint(equalTo: self.imgView.heightAnchor, multiplier: 0.7).isActive = true
        self.imgView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        
        
    }
    
    func nameLabelSetting(){
        self.nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.imgView.bottomAnchor,constant: 40).isActive = true
        self.nameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.nameLabel.textAlignment = .center
        
        
        
    }
    
    func bountyLabelSetting(){
        self.bountyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.bountyLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10).isActive = true
        self.bountyLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.bountyLabel.textAlignment = .center
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
