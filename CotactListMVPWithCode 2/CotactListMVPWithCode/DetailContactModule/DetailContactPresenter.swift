//
//  DetailContactPresenter.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 02.06.2022.
//

/// - интерфейс презентера экрана DetailViewContact
protocol DetailContactPresenterProtocol {
    /// - вью экрана DetailContact
    var viewDetailController: DetailContactView { get set }
    
    /// вспомогательный метод для отработки первичной настройки после того как вью загружена в память
    func loadDetaiView()
   
}

final class DetailContactPresenter: DetailContactPresenterProtocol {
    var viewDetailController: DetailContactView
    var detailContactPresenterProtocol: DetailContactPresenterProtocol?
    
    var person: Person?
    
    
    init(viewDVC: DetailContactView) {
        self.viewDetailController = viewDVC
    }
    
    func loadDetaiView() {
        viewDetailController.setDetailContactView()
        viewDetailController.setNavBarDetailViewController()
    }
    
  
}
