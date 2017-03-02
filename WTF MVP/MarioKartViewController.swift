//
//  MarioKartViewController.swift
//  WTF MVP
//
//  Created by Alberto Jauregui on 01/03/17.
//  Copyright © 2017 Alberto Jauregui. All rights reserved.
//

import UIKit

class MarioKartViewController: UIViewController, MarioKartView, UITableViewDataSource {
    
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var emptyCaseLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate let presenter = MarioKartPresenter(marioKartInteractor: MarioKartInteractor())
    fileprivate var characters = [MarioKartCharacter]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureActivityIndicatorView()
        presenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "CharacterCell")
        let character = self.characters[indexPath.row]
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.mail
        return cell
    }
    
    func showLoading() {
        charactersTableView?.isHidden = true
        emptyCaseLabel?.isHidden = true
        activityIndicator?.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func showEmptyCase() {
        activityIndicator?.isHidden = true
        charactersTableView?.isHidden = true
        emptyCaseLabel?.isHidden = false
    }
    
    func showMarioKartCollection(_ characterList: [MarioKartCharacter]) {
        self.characters = characterList
        activityIndicator?.isHidden = true
        charactersTableView?.isHidden = false
        emptyCaseLabel?.isHidden = true
        charactersTableView?.reloadData()
    }
    
    fileprivate func configureTableView(){
        charactersTableView?.dataSource = self
    }
    
    fileprivate func configureActivityIndicatorView(){
        activityIndicator.hidesWhenStopped = true
    }

}

