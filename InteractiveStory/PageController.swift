import UIKit

class PageController: UIViewController {
    
    var page: Page?
    
    /// ?????
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // ??????
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - User Interface Properties
    
    let artworkView = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: UIButton.ButtonType.system)
    let secondChoiceButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let page = page {
            artworkView.image = page.story.artwork
            
            // attibuted string - working with Foundation objects and methods
            let attributedString = NSMutableAttributedString(string: page.story.text)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            
            storyLabel.attributedText = attributedString
            
            if let firstChoice = page.firstChoice {
                firstChoiceButton.setTitle(firstChoice.title, for: .normal)
            } else {
                firstChoiceButton.setTitle("Play Again", for: .normal)
            }
            
            if let secondChoice = page.secondChoice {
                secondChoiceButton.setTitle(secondChoice.title, for: .normal)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews() // what is good habit to do
        
        view.addSubview(artworkView)
        artworkView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: view.topAnchor),
            // bottom is working as expected????
            artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
            artworkView.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
        
        view.addSubview(storyLabel)
        storyLabel.numberOfLines = 0
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            storyLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48.0),
            
            ])
        
        view.addSubview(firstChoiceButton)
        firstChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80.0)
            ])
        
        view.addSubview(secondChoiceButton)
        secondChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0)
            ])
        
    }
}



















