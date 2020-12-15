//
//  DetailViewController.swift
//  TableViewWithoutSB
//
//  Created by Ick on 2020/09/16.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    
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
        
        // Do any additional setup after loading the view.
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
    
    func closeButtonSetting(){
        
        self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20).isActive = true
        self.closeButton.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -10).isActive = true
        self.closeButton.setImage(UIImage(named: "close_ic"), for: UIControl.State.normal)
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
