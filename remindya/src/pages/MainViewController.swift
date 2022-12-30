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
    var registerDataEvent: [BuilderModel] = [
        BuilderModel(time: "00.00", dayornight: "AM")
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
        table.backgroundColor = UIColor.customcolor.appcolor
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
        view.addSubview(mainEventbanner)
        view.addSubview(btnCreateNewEvent)
        btnCreateNewEvent.addTarget(self, action: #selector(tappedCreateNew), for: .touchUpInside)
        
        setuptableview()
    }
    
    private func setuptableview() {
        view.addSubview(tableView)
        tableView.register(TableRegisteredEventCell.self, forCellReuseIdentifier: TableRegisteredEventCell.reusableId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - layout
    private func layout() {
        // mainEventbanner
        NSLayoutConstraint.activate([
            mainEventbanner.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            mainEventbanner.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainEventbanner.trailingAnchor, multiplier: 2)
        ])
        
        // btnCreateNewEvent
        NSLayoutConstraint.activate([
            btnCreateNewEvent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            btnCreateNewEvent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnCreateNewEvent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: mainEventbanner.bottomAnchor, multiplier: 2),
            tableView.bottomAnchor.constraint(equalTo: btnCreateNewEvent.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

    // MARK: - tableview extension
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerDataEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableRegisteredEventCell.reusableId, for: indexPath) as! TableRegisteredEventCell
        cell.selectionStyle = .none
        cell.buttonTapCallback = {
            self.tappedSelectedRow()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

    // MARK: - tableview extension
extension MainViewController {
    @objc private func tappedCreateNew(_ sender: UIButton) {
        let newElement = BuilderModel(time: "22.30", dayornight: "AM")
        registerDataEvent.append(newElement)
        tableView.reloadData()
    }
    
    private func tappedSelectedRow() {
        registerDataEvent.remove(at: 0)
        tableView.reloadData()
    }
}
