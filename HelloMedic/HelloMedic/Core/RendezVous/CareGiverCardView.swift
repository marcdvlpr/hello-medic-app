import UIKit

/// La class CardView identifie une vue comprenant un rectangle, un cercle , une image et un texte.
class CardView: UIView {
    private let rectangleView: UIView = {
        let view = UIView()
        // Défini la couleur background et le radius du rectangle
        view.backgroundColor = UIColor(red: 55/255, green: 120/255, blue: 196/255, alpha: 1.0)
        view.layer.cornerRadius = 35
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 123/255, green: 216/255, blue: 230/255, alpha: 1.0)
        view.layer.cornerRadius = 55
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "drfrancois")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        let text = "Dr. François\nBENHAMOU"
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: text.count)
        attributedText.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: range)
        label.attributedText = attributedText
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // les souss-vues
        addSubview(rectangleView)
        addSubview(circleView)
        addSubview(imageView)
        addSubview(nameLabel)

        // Définition des contraintes pour les sous vues
        NSLayoutConstraint.activate([
            // Contraintes pour le rectangle
            rectangleView.widthAnchor.constraint(equalToConstant: 370),
            rectangleView.heightAnchor.constraint(equalToConstant: 160),
            rectangleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: -30),

            // Contraintes pour le cercle
            circleView.widthAnchor.constraint(equalToConstant: 110),
            circleView.heightAnchor.constraint(equalToConstant: 110),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -165),
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: -5),

            // Contraintes pour les images
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -165),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: -5),

            // Contraintes pour le texte
            nameLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: -25)
        ])
    }
}
