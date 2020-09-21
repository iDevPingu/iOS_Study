//
//  UserDetailView.swift
//  IckGG
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

// AccountID -> gameID (여기서 플레이한 챔피언도 알 수 있음) ->
private let reuseIdentifier = "c"
class UserDetailView: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var apiKey = "APIKEY"
    
    var summonerIcon: UIImage!
    var summonerName: String!
    var accountID: String!
    var gameIDList: [MatchReferenceDto] = []
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var summonerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var gameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = .white
        self.setIconImageView()
        self.setSummonerNameLabel()
        self.setGameTableView()
        DispatchQueue.global().async {
            self.getUserMatchData()
            
        }
    }
    
    func setIconImageView(){
        self.view.addSubview(self.iconImageView)
        self.iconImageView.image = summonerIcon
        self.iconImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        self.iconImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.iconImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.iconImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    func setSummonerNameLabel(){
        self.view.addSubview(self.summonerNameLabel)
        self.summonerNameLabel.text = summonerName
        self.summonerNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        self.summonerNameLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 15).isActive = true
    }
    
    func setGameTableView(){
        let gameTableView = UITableView()
        self.gameTableView = gameTableView
        self.view.addSubview(self.gameTableView)
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        gameTableView.register(UserDetailViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        gameTableView.dataSource = self
        gameTableView.delegate = self
        gameTableView.topAnchor.constraint(equalTo: self.summonerNameLabel.bottomAnchor, constant: 15).isActive = true
        gameTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        gameTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true

    }
    
    func getUserMatchData(){
        guard let url = URL(string:"https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/\(self.accountID!)?endIndex=10&api_key=\(self.apiKey)") else { return }
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionTask = session.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            do{
                let apiResponse: MatchlistDto = try JSONDecoder().decode(MatchlistDto.self, from: data)
                self.gameIDList = apiResponse.matches
                DispatchQueue.main.async {
                    print("BB")
                    self.gameTableView.reloadData()
                }
            } catch (let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gameIDList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let champion = gameIDList[indexPath.row].champion
        guard let cell: UserDetailViewCell = self.gameTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UserDetailViewCell else { return UITableViewCell()}
        
        DispatchQueue.global().async {
            cell.imageView?.image = self.getChampionImage(champion)
        }
        
        return cell
    }
    
    func getChampionImage(_ champion: Int) -> UIImage?{
        guard let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/10.18.1/img/champion/Aatrox.png") else { return UIImage()}
        guard let data = try? Data(contentsOf: url) else { return UIImage()}
        return UIImage(data:data)
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
