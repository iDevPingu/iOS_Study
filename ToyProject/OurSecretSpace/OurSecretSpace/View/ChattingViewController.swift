//
//  ChattingViewController.swift
//  OurSecretSpace
//
//  Created by Ick on 2020/09/04.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore

class ChattingViewController: UIViewController, UICollectionViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var messageTextField: UITextField!
    
    let reuseIdentifier = "messageCell"
    var userID: String!
    var db: Firestore!
    var chattingList = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        self.db = Firestore.firestore()
        guard let user = Auth.auth().currentUser else {
            fatalError()
        }
        
        let gesture: UIGestureRecognizer = UIGestureRecognizer()
        gesture.delegate = self
        self.collectionView.addGestureRecognizer(gesture)
        
        self.userID = user.uid
        self.getChattingData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }
    
    func addKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func removeKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            self.view.frame.origin.y -= (keyboardHeight-(self.tabBarController?.tabBar.frame.size.height)!)
        }
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification){
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y += (keyboardHeight-(self.tabBarController?.tabBar.frame.size.height)!)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chattingList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.chattingList[indexPath.item]
        guard let key = data.keys.first else {fatalError()}
        guard let cell: MessageCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? MessageCell else { fatalError() }
        if !data.keys.contains(self.userID) {
            cell.messageLabel.widthAnchor.constraint(equalToConstant: self.collectionView.frame.width).isActive = true
            cell.messageLabel.text = data[key]
            cell.messageLabel.textColor = .red
            cell.messageLabel.textAlignment = .left
        } else {
            cell.messageLabel.widthAnchor.constraint(equalToConstant: self.collectionView.frame.width).isActive = true
            cell.messageLabel.text = data[userID]
            cell.messageLabel.textColor = .blue
            cell.messageLabel.textAlignment = .right
        }
        
        return cell
    }

    func getChattingData(){

        db.collection("ChattingData").getDocuments { (query, err) in
            if let err = err{
                print(err)
            } else {
                for document in query!.documents{
                    if document.documentID == "Test"{
                        if let temp = document.data()["Message"] as? [[String:String]] {
                            self.chattingList = temp
                            
                            print("AAA")
                            print(self.chattingList)
                            OperationQueue.main.addOperation {
                                self.collectionView.reloadSections(IndexSet(0...0))
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    @IBAction func touchUpSendBtn(_ sender: UIButton){
        if self.messageTextField.text == "" {
            print("Nothing Send")
        } else {
            guard let text = self.messageTextField.text else { fatalError() }
            let temp = db.collection("ChattingData").document("Test")
            
            temp.updateData(["Message" : FieldValue.arrayUnion([[self.userID : text]])])
            self.messageTextField.text = ""
            self.getChattingData()
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
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
