//
//  QSCategoryDetailPresenter.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/20.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSCategoryDetailPresenter: QSCategoryDetailPresenterProtocol {

    weak var view: QSCategoryDetailViewProtocol?
    let interactor: QSCategoryDetailInteractorProtocol
    let router: QSCategoryDetailWireframeProtocol
    
    init(interface: QSCategoryDetailViewProtocol, interactor: QSCategoryDetailInteractorProtocol, router: QSCategoryDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.showSeg()
        interactor.request(index: 0)
        view?.showActivityView()
    }
    
    func didSelectAt(index: Int) {
        view?.showActivityView()
        view?.showData(books: [])
        interactor.request(index: index)
    }
    
    func didSelectRowAt(indexPath:IndexPath){
        interactor.showDetail(indexPath: indexPath)
    }
}

extension QSCategoryDetailPresenter:QSCategoryDetailInteractorOutputProtocol{
    func fetchDataSuccess(models: [Book]) {
        view?.hideActivityView()
        view?.showData(books: models)
    }
    
    func fetchDataFailed() {
        view?.hideActivityView()
    }
    
    func showSeg(titles: [String]) {
        view?.showSeg(titles: titles)
    }
    
    func showDetail(book: Book) {
        router.presentDetail(book: book)
    }
}

