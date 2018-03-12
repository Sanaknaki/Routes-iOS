//
//  FavoriteStopTableViewCell.swift
//  OCRoutes
//
//  Created by Brandon Danis on 2018-02-02.
//  Copyright © 2018 RoutesInc. All rights reserved.
//

import Foundation
import UIKit

class FavoriteStopTableViewCell : UITableViewCell {
    
    private var stop : BusStop? {
        didSet {
            SetupStopInfo()
        }
    }
    
    private var routes : [BusRoute]? {
        didSet {
            SetupBusRoutes()
        }
    }
    
    let mainStack : UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    //1st column
    let busStopNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "6783"
        label.font = UIFont(name: "AvenirNext-Bold", size: 26)
        label.textColor = Style.mainColor
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    //2nd column
    let redLineView : RedLineView = {
        let view = RedLineView(frame: CGRect.zero)
        return view
    }()
    
    //3rd column stack
    let thirdColumn : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return stack
    }()
    
    //3rd column label
    let busStopNameLabel : UILabel = {
        let label = UILabel()
        label.text = "King Edward / Tempelton"
        label.font = UIFont(name: "AvenirNext", size: 18)
        label.textColor = Style.darkGrey
        return label
    }()
    
    // 3rd column stack for route info
    let routeInfoStack : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5.0
        return stack
    }()
    
    convenience init(stop : BusStop, routes : [BusRoute]) {
        self.init(frame: CGRect.zero)
        defer { self.stop = stop }
        defer { self.routes = routes }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Adding elements to contentView
        contentView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(busStopNumberLabel)
        mainStack.addArrangedSubview(redLineView)
        mainStack.addArrangedSubview(thirdColumn)
        
        thirdColumn.addArrangedSubview(busStopNameLabel)
        
        
//        contentView.addSubview(busStopNumberLabel)
//        contentView.addSubview(busStopNameLabel)
//        contentView.addSubview(routeInfoStack)

        ApplyConstraints()
    }
    
    private func SetupStopInfo() {
        guard let stopInfo = stop else { return }
        busStopNumberLabel.text = stopInfo.stopCode
        busStopNameLabel.text = stopInfo.stopName
    }
    
    private func SetupBusRoutes() {
        if routes != nil {
            for route in routes! {
                thirdColumn.addArrangedSubview(FavouriteStopRouteInfoView(frame: CGRect.zero, route: route))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ApplyConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        redLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redLineView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
//        busStopNumberLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            busStopNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            busStopNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15)
//        ])
//
//        busStopNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            busStopNameLabel.leftAnchor.constraint(equalTo: busStopNumberLabel.rightAnchor, constant: 10),
//            busStopNameLabel.bottomAnchor.constraint(equalTo: busStopNumberLabel.bottomAnchor),
//            busStopNameLabel.heightAnchor.constraint(equalTo: busStopNumberLabel.heightAnchor)
//        ])
//
//        routeInfoStack.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            routeInfoStack.topAnchor.constraint(equalTo: busStopNumberLabel.bottomAnchor, constant: 10),
//            routeInfoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//            routeInfoStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
//            routeInfoStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)
//        ])
    }
    
}

class RedLineView : UIView {
    
    let redLine : UIView = {
        let view = UIView()
        view.backgroundColor = Style.mainColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        addSubview(redLine)
        
        ApplyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ApplyConstraints() {
        redLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redLine.widthAnchor.constraint(equalToConstant: 10),
            redLine.topAnchor.constraint(equalTo: topAnchor),
            redLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            redLine.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
