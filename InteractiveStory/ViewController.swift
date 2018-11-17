import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story = Page(story: .touchDown)
        story.firstChoice = (title: "First", page: Page(story: .droid))
        story.secondChoice = (title: "Second", page: Page(story: .crate))

    }


}

