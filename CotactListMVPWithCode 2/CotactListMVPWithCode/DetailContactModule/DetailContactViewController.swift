//
//  DetailContactViewController.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 02.06.2022.
//

import UIKit
/// - класс вью контроллера экрана DetailContact
class DetailContactViewController: UIViewController {
    /// - презентор экрана DetailContact
    var presenterDetailViewController: DetailContactPresenterProtocol?
    /// - экземпляр модели
    var person: Person?
    /// - инициализатор
    /// - parameter presenterDetailViewController - презентер экрана DetailContact
    init(presenterDVC: DetailContactPresenterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenterDetailViewController = presenterDVC
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterDetailViewController?.viewDetailController.parentDetailViewController = view
        presenterDetailViewController?.viewDetailController.navigationDetailViewController = navigationController
        presenterDetailViewController?.viewDetailController.navBarDetailViewController = navigationItem
        presenterDetailViewController?.loadDetaiView()
        presenterDetailViewController?.viewDetailController.labelName.text = person?.name
        presenterDetailViewController?.viewDetailController.labelSurname.text = person?.surname
        presenterDetailViewController?.viewDetailController.labelPhone.text = person?.phone
    }
}
