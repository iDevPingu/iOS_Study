//
//  RankingView.swift
//  IckGG
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"
class RankingView: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    var tableView: UITableView!
    var rankingData: [User] = []
    var accountIDList: [String] = []
    var apiKEY: String = "APIKEY"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.setTableView()
        DispatchQueue.global().async {
            self.requestRankingData()
        }
        
    }
    
    func requestRankingData(){
        guard let url: URL = URL(string: "https://kr.api.riotgames.com/lol/league-exp/v4/entries/RANKED_SOLO_5x5/CHALLENGER/I?page=1&api_key=\(self.apiKEY)") else { return }
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionTask = session.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            do{
                let apiResponse: [User] = try JSONDecoder().decode([User].self, from: data)
                self.rankingData = apiResponse
                DispatchQueue.main.async {
                    print("AA")
                    self.tableView.reloadData()
                }
            } catch (let err){
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    func setTableView(){
        let tableView = UITableView()
        self.tableView = tableView
        self.view.addSubview(self.tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.register(RankingViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = rankingData[indexPath.row]
        guard let cell: RankingViewCell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as? RankingViewCell else { return UITableViewCell()}
        cell.userIDLabel.text = data.summonerName
        cell.rankingNumberLabel.text = String(indexPath.row + 1)
        
        guard let summonerName = cell.userIDLabel.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return cell}
        
        DispatchQueue.main.async {
            cell.summonerIconImageView.image = self.getSummonerIconImage(summonerName)
            
        }

//        cell.summonerIconImageView.image = self.getSummonerIconImage(data.summonerName, indexPath.row)
        if data.tier == "CHALLENGER" {
            var text = "C1 "
            text += String(data.leaguePoints)
            cell.tierLPLabel.text = text
        }
        
        return cell
    }
    
    
    

    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? RankingViewCell else { return true }
        guard let summonerName = cell.userIDLabel.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return true}
        let userDetailView = UserDetailView()
        
        userDetailView.summonerIcon = self.getSummonerIconImage(summonerName)
        userDetailView.summonerName = cell.userIDLabel.text
        userDetailView.accountID = self.accountIDList[indexPath.row]
        self.navigationController?.pushViewController(userDetailView, animated: true)
        return true

    }

    
    
    func getSummonerIconImage(_ name: String) -> UIImage?{

        guard let url = URL(string: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/\(name)?api_key=\(self.apiKEY)") else { return UIImage()}
        guard let data = try? String(contentsOf: url).data(using: .utf8) else{
            return UIImage()
        }
        
        guard let summoner = try? JSONDecoder().decode(SummonerDTO.self, from: data) else { return UIImage()}
        
        self.accountIDList.append(summoner.accountId)
        
        guard let imageURL = URL(string: "https://ddragon.leagueoflegends.com/cdn/10.18.1/img/profileicon/\(summoner.profileIconId).png") else { return UIImage() }
        
        let data2 = try? Data(contentsOf: imageURL)
        
        if data2 == nil{
            
            return UIImage()
        } else {
            
            return UIImage(data: data2!)
        }
        

        
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
