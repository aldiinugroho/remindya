//
//  ViewController.swift
//  remindya
//
//  Created by aldinugroho on 19/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - model
    struct BuilderModel {
        let time: String
        let dayornight: String
    }
    
    // MARK: - sample data
    let datasample: [BuilderModel] = [
        BuilderModel(time: "18.30", dayornight: "PM"),
        BuilderModel(time: "19.30", dayornight: "PM"),
        BuilderModel(time: "22.30", dayornight: "PM")
    ]
    
    // MARK: - declaration
    let mainEventbanner: BannerView = {
        let bv = BannerView()
        bv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        bv.layer.cornerRadius = 8
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()
    
    let btnCreateNewEvent: UIButton = {
        let button = UIButton(type: .system)
        let btnword = "create one ⏰"
        let font = UIFont.systemFont(ofSize: 30)
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold)
        let boldFont = UIFont(descriptor: fontDescriptor!, size: 30)
        let attributes = [NSAttributedString.Key.font: boldFont]
        let attributedTitle = NSAttributedString(string: btnword, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.customcolor.bluedarkbtn
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        layout()
    }

}

extension MainViewController {
    // MARK: - setup
    private func setup() {
        view.addSubview(btnCreateNewEvent)
        setuptableview()
    }
    
    private func setuptableview() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "haha")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - layout
    private func layout() {
        // btnCreateNewEvent
        NSLayoutConstraint.activate([
            btnCreateNewEvent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            btnCreateNewEvent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnCreateNewEvent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: btnCreateNewEvent.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

