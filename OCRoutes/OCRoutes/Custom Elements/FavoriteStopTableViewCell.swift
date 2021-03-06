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
    
    private var trackStyle : TrackStyle = .Normal
    
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
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    let spacerView : UIView = {
        return UIView()
    }()
    
    var redLineView : RedLineView!
    
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
        label.font = UIFont(name: "AvenirNext", size: 15)
        label.textColor = Style.mainColor
        return label
    }()
    
    convenience init(stop : BusStop, routes : [BusRoute], style : TrackStyle) {
        self.init(style: .default, reuseIdentifier: "favStopCell", trackStyle: style)
        self.trackStyle = style
        defer { self.stop = stop }
        defer { self.routes = routes }
    }
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, trackStyle : TrackStyle) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        redLineView = RedLineView(style: trackStyle)
        
        //Adding elements to contentView
        contentView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(busStopNumberLabel)
        mainStack.addArrangedSubview(redLineView)
        mainStack.addArrangedSubview(spacerView)
        
        spacerView.addSubview(thirdColumn)
        
        thirdColumn.addArrangedSubview(busStopNameLabel)

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
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        
        busStopNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            busStopNumberLabel.widthAnchor.constraint(equalToConstant: busStopNumberLabel.frame.width)
        ])
        
        redLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redLineView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        thirdColumn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdColumn.topAnchor.constraint(equalTo: spacerView.topAnchor, constant: 10),
            thirdColumn.bottomAnchor.constraint(equalTo: spacerView.bottomAnchor, constant: -10),
            thirdColumn.leadingAnchor.constraint(equalTo: spacerView.leadingAnchor),
            thirdColumn.trailingAnchor.constraint(equalTo: spacerView.trailingAnchor)
        ])
        
    }
    
}
