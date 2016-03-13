

import UIKit

class TextDisplayVC: UIViewController
{
    
    @IBAction func donePressed(sender: UIBarButtonItem)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
