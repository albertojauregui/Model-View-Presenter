//
//  MarioKartPresenter.swift
//  WTF MVP
//
//  Created by Alberto Jauregui on 01/03/17.
//  Copyright © 2017 Alberto Jauregui. All rights reserved.
//

import Foundation

class MarioKartPresenter : Presenter {
    fileprivate let marioKartInteractor : MarioKartInteractor
    weak fileprivate var marioKartView : MarioKartView?
    fileprivate let isMarioKartCollectionEmpty = 0
    
    init(marioKartInteractor: MarioKartInteractor){
        self.marioKartInteractor = marioKartInteractor
    }
    
    func attachView(_ marioKartView: MarioKartView){
        self.marioKartView = marioKartView
    }
    
    func viewWillAppear() {
        loadCharacters()
    }
    
    func loadCharacters(){
        self.marioKartView?.showLoading()
        marioKartInteractor.getMarioKartCharacters { [weak self] characters in
            self?.marioKartView?.hideLoading()
            if(characters.count == self?.isMarioKartCollectionEmpty){
                self?.marioKartView?.showEmptyCase()
            }else{
                self?.marioKartView?.showMarioKartCollection(characters)
            }
        }
    }
    
    func detachView(){
        marioKartView = nil
    }
}

protocol MarioKartView :NSObjectProtocol {
    func showLoading()
    func hideLoading()
    func showEmptyCase()
    func showMarioKartCollection(_ characters: [MarioKartCharacter])
}
