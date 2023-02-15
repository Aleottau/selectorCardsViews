//
//  SelectorCardController.swift
//  SelectorCardModule
//
//  Created by alejandro on 2/02/23.
//
import SnapKit
import UIKit

class SelectorCardController: UIViewController {
    
    var titleStore = UILabel()
    var titlePayment = UILabel()
    var numbersLabel = UILabel()
    var numbersImage = UILabel()
    var payButton = UIButton()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: CardsViewLayout().generateLayout())
    let presenter: SelectorCardPresenterProtocol
    var setUpDataSource: SelectorCardDataSource?
    var dataManager = DataManager()
    
    init(presenter: SelectorCardPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraints()
        setUpView()
        collectionData()
    }
    func setUpView() {
        view.backgroundColor = .white
        titleCardStore(label: titleStore)
        titlePaymentConfig(label: titlePayment)
        numbersCardsConfig(label: numbersLabel)
        buttonPayConfig(button: payButton)
    }
    func titleCardStore(label: UILabel) {
        label.text = "Card Store"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .light)
    }
    func titlePaymentConfig(label: UILabel) {
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
    }
    func numbersCardsConfig(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
    }
    func buttonPayConfig(button: UIButton) {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.cornerStyle = .capsule
        buttonConfig.background.backgroundColor = #colorLiteral(red: 0.3541272879, green: 0.369129777, blue: 0.8361846805, alpha: 1)
        button.configuration = buttonConfig
    }
    func makeConstraints() {
        view.addSubview(titleStore)
        view.addSubview(collectionView)
        view.addSubview(titlePayment)
        view.addSubview(numbersLabel)
        view.addSubview(payButton)
        titleStore.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titlePayment.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        payButton.translatesAutoresizingMaskIntoConstraints = false


        
        titleStore.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleStore.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(200)
        }
        titlePayment.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(150)
        }
        numbersLabel.snp.makeConstraints { make in
            make.leading.equalTo(titlePayment.snp.trailing)
            make.trailing.equalToSuperview().inset(50)
            make.top.equalTo(collectionView.snp.bottom).offset(30)
        }
        payButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalTo(titlePayment.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
    }
    private func setDataforUI(model: CardDataModel) {
        titlePayment.text = model.payment.title
        numbersLabel.text = model.payment.cardLastFour
        payButton.setTitle(model.buttonCopy, for: .normal)
    }
    func collectionData() {
        guard let cardModel = dataManager.processCardData(fileName: "cardStore200", dataExtension: "json") else {
            return
        }
        setDataforUI(model: cardModel)
        setUpDataSource = SelectorCardDataSource(collectionView: collectionView, cards: cardModel.products)
        collectionView.dataSource = setUpDataSource?.dataSource
        setUpDataSource?.applySnapshot()
    }
//    var xOffsets: [IndexPath: CGFloat] = [:]
}
//extension SelectorCardController: UICollectionViewDelegate {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard scrollView else {
//            return
//        }
//
//        let currentPoint =  scrollView.contentOffset
//        let cell = scrollView.indexPathForItem(at: <#T##CGPoint#>)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let currentPoint = collectionView.contentOffset
//        cell.layer.scroll(currentPoint)
//        let currentOffsetX: CGFloat?
//        switch indexPath.section {
//        case 0:
//            let descriptionCell = collectionView.cellForItem(at: (indexPath)) as? DescriptionCardViewCell
//            descriptionCell?.layer.scroll(<#T##p: CGPoint##CGPoint#>)
//
//        default:
//            print("error scroll delegate")
//        }
//        switch cell {
//        case let _ as CardsViewCell:
//
//        case let descriptionCell as DescriptionCardViewCell:
//
//        default:
//            print("error willDisplay")
//        }
//    }
//}
