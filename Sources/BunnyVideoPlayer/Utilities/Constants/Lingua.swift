// swiftlint:disable all
// This file was generated with Lingua command line tool. Please do not change it!
// Source: https://github.com/poviolabs/Lingua

import Foundation

enum Lingua {
	enum Error {
		/// There was a problem setting up the audio. Please check your settings and try again.
		static let audioError = tr("Error", "audio_error")
	}

	enum Player {
		/// Video not found!
		static let videoNotFound = tr("Player", "video_not_found")
	}

	enum Settings {
		/// Settings
		static let actionsTitle = tr("Settings", "actions_title")
		/// Cancel
		static let cancelAction = tr("Settings", "cancel_action")
		/// Disabled
		static let captionDisabled = tr("Settings", "caption_disabled")
		/// Captions
		static let captionMenuTitle = tr("Settings", "caption_menu_title")
		/// Speed
		static let playbackSpeedMenuTitle = tr("Settings", "playback_speed_menu_title")
		/// Normal
		static let playbackSpeedNormal = tr("Settings", "playback_speed_normal")
		/// Auto
		static let qualityAuto = tr("Settings", "quality_auto")
		/// Quality
		static let qualityMenuTitle = tr("Settings", "quality_menu_title")
	}
    
	private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
		let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
		return String(format: format, locale: Locale.current, arguments: args)
	}
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}

// swiftlint:enable all
