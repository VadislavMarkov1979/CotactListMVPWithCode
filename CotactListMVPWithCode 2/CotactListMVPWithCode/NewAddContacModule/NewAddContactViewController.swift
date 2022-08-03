//
//  NewAddContactViewController.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 01.06.2022.
//

import UIKit
/// - вью контроллер экрана NewAddContact
class NewAddContactViewController: UIViewController {
    /// - презентер экрана NewAddContact
    var presenterNCV: NewAddConactPresenterProtocol
    
    /// - инициализатор
    /// - parameter presenterNCV - презентер экрана NewAddContact
    init(presenterNCV: NewAddConactPresenterProtocol) {
		self.presenterNCV = presenterNCV
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterNCV.viewNewContact.parentView = view
        presenterNCV.viewNewContact.navigationController = navigationController
        presenterNCV.viewNewContact.navBar = navigationItem
        presenterNCV.loadViewNewContact()
    }
}
