//
//  ViewController.swift
//  TestApp
//
//  Created by M Arman on 10/4/21.
//

import UIKit
import RichEditorView

class ViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var accessoryToolbar: RichEditorToolbar!
    @IBOutlet var richEditorView: RichEditorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        accessoryToolbar.options = RichEditorDefaultOption.all
        accessoryToolbar.editor = richEditorView
        richEditorView.customAccessoryView = accessoryToolbar
        richEditorView.delegate = self
        accessoryToolbar.delegate = self
    }


}


extension ViewController: RichEditorToolbarDelegate, RichEditorDelegate {
    func richEditor(_ editor: RichEditorView, contentDidChange content: String) {
//        if content.isEmpty {
//            htmlTextView.text = "HTML Preview"
//        } else {
//            htmlTextView.text = content
//        }
    }

    fileprivate func randomColor() -> UIColor {
        let colors: [UIColor] = [
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .purple,
        ]

        let color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        return color
    }

    func richEditorToolbarChangeTextColor(_ toolbar: RichEditorToolbar) {
//        let vc = UIColorPicker(title: "PICK COLOR", action: "SET COLOR", color: .blue, sourceView: view, actionCallback: { color in
//            toolbar.editor?.setTextColor(color)
//        })
//        // remove the stackView of alpha
//        let picker = vc.view.subviews[0].subviews.compactMap { $0 as? ColorPicker }.first
//        picker?.alphaSlider.superview?.removeFromSuperview()
//        picker?.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true, completion: nil)
    }

    func richEditorToolbarChangeBackgroundColor(_ toolbar: RichEditorToolbar) {
//        let vc = UIColorPicker(title: "PICK COLOR", action: "SET COLOR", color: .blue, sourceView: view, actionCallback: { color in
//            toolbar.editor?.setTextBackgroundColor(color)
//        })
//        let picker = vc.view.subviews[0].subviews.compactMap { $0 as? ColorPicker }.first
//        picker?.alphaSlider.superview?.removeFromSuperview()
//        picker?.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true, completion: nil)
    }

    func richEditorToolbarInsertImage(_ toolbar: RichEditorToolbar) {
        // TODO: importing from library feature will be integrated, most work done
        // chooseImageActionHandler(nil)
        if let link = toolbar.searchBarImg.text {
            toolbar.editor?.insertImage(link, alt: "")
        }
        toolbar.searchBarImg.text = nil
        toolbar.resetBars()
    }

    func richEditorToolbarInsertLink(_ toolbar: RichEditorToolbar) {
        toolbar.editor?.backupElement()
        if let link = toolbar.searchBar.text {
            toolbar.editor?.insertLink(link, title: "")
        }
        toolbar.searchBar.text = nil
        toolbar.resetBars()
    }
}

extension ViewController {
    func horizontalTransition(vc: UIViewController, duration: CFTimeInterval, type: CATransitionSubtype) {
        let customVcTransition = vc
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.push
        transition.subtype = type
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(customVcTransition, animated: false, completion: nil)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }
}
