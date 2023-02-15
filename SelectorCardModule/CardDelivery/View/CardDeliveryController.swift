//
//  CardDeliveryController.swift
//  SelectorCardModule
//
//  Created by alejandro on 13/02/23.
//

import UIKit
import SnapKit

class CardDeliveryController: UIViewController {
    
    var imageView = UIImageView()
    var iconImage = UIImageView()
    var titleSegment = UILabel()
    var suggestion = UILabel()
    var addressSegment = UILabel()
    var userAddress = UILabel()
    var paymentDescription = UILabel()
    var numbersCards = UILabel()
    var iconPay = UIImageView()
    var payButton = UIButton()

    let presenter: CardDeliveryPresenterProtocol

    init(presenter: CardDeliveryPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        makeContraints()
        setUpview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSegmentConfig(label: titleSegment)
        suggestionConfig(label: suggestion)
        iconConfig(imageView: iconImage)
        descriptionsLabels(label: addressSegment)
        userAddressConfig(label: userAddress)
        descriptionsLabels(label: paymentDescription)
        numbersConfig(label: numbersCards)
        suggestionLayerConfig(label: suggestion)
        buttonPayConfig(button: payButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        iconPayLayerConfig(image: iconPay)
    }
    
    private func titleSegmentConfig(label: UILabel) {
        label.font = .systemFont(ofSize: 35, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
    }
    private func suggestionConfig(label: UILabel) {
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    private func suggestionLayerConfig(label: UILabel) {
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
    }
    private func iconConfig(imageView: UIImageView) {
        imageView.tintColor = UIColor.black
    }
    private func userAddressConfig(label: UILabel) {
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .black)
    }
    private func descriptionsLabels(label: UILabel) {
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private func iconPayLayerConfig(image: UIImageView) {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.width/2
        image.layer.borderColor = UIColor.blue.cgColor
    }
    private func numbersConfig(label: UILabel) {
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .regular)
    }
    func buttonPayConfig(button: UIButton) {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.cornerStyle = .capsule
        buttonConfig.background.backgroundColor = #colorLiteral(red: 0.3541272879, green: 0.369129777, blue: 0.8361846805, alpha: 1)
        button.configuration = buttonConfig
    }

    private func setUpview() {
        imageView.image = UIImage(named: "cards")
        titleSegment.text = "!Felicitaciones por tu nueva tarjeta!"
        suggestion.text = "Reemplazamos la anterior y no podras usarlo.\nEncuanto recibas la nueva activala y estara lista"
        iconImage.image = UIImage(systemName: "info.circle")
        addressSegment.text = "Direccion de entrega"
        userAddress.text = "Carrera 94 sur 15b # 19 - 59"
        paymentDescription.text = "Cobraremos a tu RappiCard:"
        numbersCards.text = "*2122"
        iconPay.image = UIImage(named: "iconBlackRappi")
        payButton.setTitle("Continuar", for: .normal)
    }
    private func makeContraints() {
        view.addSubview(imageView)
        view.addSubview(titleSegment)
        view.addSubview(suggestion)
        view.addSubview(iconImage)
        view.addSubview(addressSegment)
        view.addSubview(userAddress)
        view.addSubview(paymentDescription)
        view.addSubview(numbersCards)
        view.addSubview(iconPay)
        view.addSubview(payButton)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleSegment.translatesAutoresizingMaskIntoConstraints = false
        suggestion.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        addressSegment.translatesAutoresizingMaskIntoConstraints = false
        userAddress.translatesAutoresizingMaskIntoConstraints = false
        paymentDescription.translatesAutoresizingMaskIntoConstraints = false
        numbersCards.translatesAutoresizingMaskIntoConstraints = false
        iconPay.translatesAutoresizingMaskIntoConstraints = false
        payButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(450)
        }
        titleSegment.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(30)
        }
        suggestion.snp.makeConstraints { make in
            make.top.equalTo(titleSegment.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
        iconImage.snp.makeConstraints { make in
            make.leading.equalTo(suggestion.snp.leading).inset(10)
            make.trailing.equalTo(suggestion.snp.trailing).inset(330)
            make.top.equalTo(suggestion).inset(20)
        }
        addressSegment.snp.makeConstraints { make in
            make.top.equalTo(suggestion.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        userAddress.snp.makeConstraints { make in
            make.top.equalTo(addressSegment.snp.bottom)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        paymentDescription.snp.makeConstraints { make in
            make.top.equalTo(userAddress.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(180)
        }
        numbersCards.snp.makeConstraints { make in
            make.top.equalTo(userAddress.snp.bottom).offset(40)
            make.trailing.equalToSuperview().inset(65)
            make.leading.equalTo(paymentDescription.snp.trailing).offset(10)
        }
        iconPay.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.top.equalTo(userAddress.snp.bottom).offset(38)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalTo(numbersCards.snp.trailing).offset(13)
        }
        payButton.snp.makeConstraints { make in
            make.top.equalTo(paymentDescription.snp.bottom).offset(40)
            make.height.equalTo(60)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
