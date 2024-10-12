//
//  ViewController.swift
//  Meu Clima
//
//  Created by Jobson Batista on 10/10/24.
//

import UIKit

class ViewControllerBackup: UIViewController {
    
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.gray
        // Desativar layout automático para não causar conflitos
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Está rodando...")
        view.backgroundColor = UIColor.red
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    private func setupView() {
        setHierarchy()
        setConstrains()
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            // Setando o topo da safe area da view principal
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
    private func setHierarchy() {
        view.addSubview(customView)
    }

}

