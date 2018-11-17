import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startAdventure" {
            
            guard let pageController = segue.destination as? PageController else { return }
            pageController.page = Adventure.story
            
        }
    }
}

