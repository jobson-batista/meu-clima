//
//  DailyForecastTableViewCell.swift
//  Meu Clima
//
//  Created by Jobson Batista on 10/13/24.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecast"
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var minTemperatureDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperatureDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var dailyForecastStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, iconImageView, minTemperatureDayLabel, maxTemperatureDayLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                     leading: 16,
                                                                     bottom: 16,
                                                                     trailing: 16)
        stackView.spacing = 15
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(dailyForecastStackView)
    }
    
    private func setConstraints() {
        dailyForecastStackView.setContraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50)
        ])
    }
    
    func loadData(weekDay: String?, min: String?, max: String?, icon: UIImage?) {
        weekDayLabel.text = weekDay
        minTemperatureDayLabel.text = "min \(min ?? "")"
        maxTemperatureDayLabel.text = "max \(max ?? "")"
        iconImageView.image = icon
    }
}
