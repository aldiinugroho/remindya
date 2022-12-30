//
//  BannerView.swift
//  remindya
//
//  Created by aldinugroho on 19/12/22.
//

import Foundation
import UIKit

class BannerView: UIView {
    
    // MARK: - declaration
    let latestEvent: UILabel = {
        let label = UILabel()
        label.attributedText = label.newTimeEvent(time: "18.30 AM")
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerView {
    // MARK: - setup
    private func setup() {
        self.backgroundColor = UIColor.customcolor.lightblue
        addSubview(latestEvent)
    }
    
    // MARK: - layout
    private func layout() {
        // latestEvent
        NSLayoutConstraint.activate([
            latestEvent.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            latestEvent.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
