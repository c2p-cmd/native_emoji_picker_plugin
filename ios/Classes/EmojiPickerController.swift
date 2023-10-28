//
//  EmojiPickerController.swift
//  native_emoji_picker
//
//  Created by Sharan Thakur on 28/10/23.
//

import Flutter
import MCEmojiPicker

class EmojiPickerController: UIViewController, MCEmojiPickerDelegate {
    // MARK: Properties
    var result: FlutterResult?
    var initialEmoji: String?
    
    // MARK: Buttons
    private lazy var emojiButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemGray4
        button.layer.cornerCurve = .continuous
        if let initialEmoji {
            button.setTitle(initialEmoji, for: .normal)
        } else {
            button.setTitle("😎", for: .normal)
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: 65)
        button.addTarget(self, action: #selector(emojiButtonAction(_:)), for: .touchUpInside)
        button.addGestureRecognizer(
            UIPanGestureRecognizer(
                target: self,
                action: #selector(didPanEmojiButton(_:))
            )
        )
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemGray4
        button.layer.cornerCurve = .continuous
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 65)
        button.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Responders
    @objc private func emojiButtonAction(_ sender: UIButton) {
        let viewController = MCEmojiPickerViewController()
        viewController.delegate = self
        viewController.sourceView = sender
        present(viewController, animated: true)
    }
    
    @objc private func didPanEmojiButton(
        _ gestureRecognizer: UIPanGestureRecognizer
    ) {
        emojiButton.center = gestureRecognizer.location(in: view)
    }
    
    @objc private func close(_ sender: UIButton) {
        dismiss(animated: true)
        result?(nil)
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        setupEmojiButtonLayout()
        view.backgroundColor = .systemGray4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let emojiPicker = MCEmojiPickerViewController()
        emojiPicker.sourceView = emojiButton
        emojiPicker.delegate = self
        
        present(emojiPicker, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        result?(nil)
    }
    
    // MARK: Setup Layout
    private func setupEmojiButtonLayout() {
        view.addSubview(emojiButton)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            emojiButton.widthAnchor.constraint(equalToConstant: 88),
            emojiButton.heightAnchor.constraint(equalToConstant: 88),
            emojiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        ])
    }
    
    // MARK: Delegate Implementation
    func didGetEmoji(emoji: String) {
        emojiButton.setTitle(emoji, for: .normal)
        dismiss(animated: false)
        dismiss(animated: true)
        result?(emoji)
    }
}
