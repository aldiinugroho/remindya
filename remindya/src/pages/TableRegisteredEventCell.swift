//
//  tableregisteredeventcell.swift
//  remindya
//
//  Created by aldinugroho on 30/12/22.
//

import Foundation
import UIKit

class TableRegisteredEventCell: UITableViewCell {
    
    // MARK: - declaration
    static let reusableId: String = "TableRegisteredEventCellID"
    struct modelView {
        let time: String
    }
    
    var buttonTapCallback: () -> ()  = { }
    
    let labelEvent: UILabel = {
        let label = UILabel()
        label.text = "00.00 AM"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonCancel: UIButton = {
        let btn = UIButton()
        btn.setTitle("cancel", for: .normal)
        btn.setTitleColor(UIColor.customcolor.redcancelbtn, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableRegisteredEventCell {
    // MARK: - setup
    private func setup() {
        self.backgroundColor = UIColor.customcolor.appcolor
        self.addSubview(labelEvent)
        self.addSubview(buttonCancel)
        buttonCancel.addTarget(self, action: #selector(tappedCancel), for: .touchUpInside)
    }
    
    // MARK: - layout
    private func layout() {
        // labelEvent
        NSLayoutConstraint.activate([
            labelEvent.topAnchor.constraint(equalTo: self.topAnchor),
            labelEvent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelEvent.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2)
        ])
        
        // buttonCancel
        NSLayoutConstraint.activate([
            buttonCancel.topAnchor.constraint(equalTo: labelEvent.topAnchor),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonCancel.trailingAnchor, multiplier: 2),
            buttonCancel.bottomAnchor.constraint(equalTo: labelEvent.bottomAnchor)
        ])
    }
}

extension TableRegisteredEventCell {
    @objc private func tappedCancel(_ sender: UIButton) {
        print("canceled")
    }
}
