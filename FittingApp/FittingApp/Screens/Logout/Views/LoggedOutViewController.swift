//
//  LoggedOutViewController.swift
//  LookLike
//
//  Created by Kirill Khudiakov on 21.02.2021.
//

import UIKit
import SnapKit




class LoggedOutViewController: UIViewController, LoggedOutViewProtocol {
    
   var viewModel: LoggedOutViewModelInput?
    
   private lazy var logoTitleView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.layer.borderWidth = 3
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.setTitle("LOOKE LIKE", for: .normal)
        view.titleLabel?.font = .loggedTitleFont(size: 48, weight: .regular)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.numberOfLines = 2
        view.setTitleColor( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return view
    }()
    
    private lazy var buttonsCardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    private lazy var logInButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 6
        view.setTitle("LOG IN", for: .normal)
        view.titleLabel?.font = .serviceButtonsFont(size: 13, weight: .regular)
        view.setTitleColor( #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        view.addTarget(self,
                       action: #selector(didTapLogInButton),
                       for: .touchUpInside)
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 6
        view.setTitle("REGISTER", for: .normal)
        view.titleLabel?.font = .serviceButtonsFont(size: 13, weight: .regular)
        view.setTitleColor( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        view.addTarget(self,
                       action: #selector(didTapRegisterButton),
                       for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(logoTitleView)
        view.addSubview(buttonsCardView)
        buttonsCardView.addSubview(logInButton)
        buttonsCardView.addSubview(registerButton)
        
        logoTitleView.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-105)
        }
        
        buttonsCardView.snp.makeConstraints {
            $0.height.equalTo(105)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        logInButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(view.frame.width / 2.2)
            $0.left.equalToSuperview().offset(14)
            $0.top.equalToSuperview().offset(24)
        }
        
        registerButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(view.frame.width / 2.2)
            $0.right.equalToSuperview().offset(-14)
            $0.top.equalToSuperview().offset(24)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.barTintColor = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    @objc
    private func didTapLogInButton() {
        viewModel?.didTapLoginButton()
    }
    
    @objc
    private func didTapRegisterButton() {
        viewModel?.didTapRegButton()
    }
}
