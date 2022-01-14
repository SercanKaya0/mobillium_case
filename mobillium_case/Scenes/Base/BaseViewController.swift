//
//  BaseViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import UIComponents
class BaseViewController<V: BaseViewModelProtocol>: UIViewController,BaseViewController.LoadingProtocols{
    typealias LoadingProtocols = LoadingProtocol 


    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeLoading()
        subscribeActivityIndicator()
        subscribeToast()
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
           // self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
           // self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
         //   self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
         //   self?.dismissLoading()
        }
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
       //     ToastPresenter.showWarningToast(text: text)
        }
    }
    
    func showWarningToast(message: String) {
      //  ToastPresenter.showWarningToast(text: message)
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}

// MARK: - NavigationBar Logo
extension BaseViewController {
    func addNavigationBarLogo() {
       let image = UIImage(named: "AppLogo")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = image
        navigationItem.titleView?.backgroundColor = .red
        navigationItem.titleView = imageView
        
    }
}
