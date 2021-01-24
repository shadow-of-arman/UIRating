#
#  Be sure to run `pod spec lint UIRating.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "UIRating"
  spec.version      = "0.0.1"
  spec.summary      = "A customizable rating view for iOS."

  spec.description  = <<-DESC
  An easy to use, stylish, slidable and highly customizable rating view.
  Not a fan of stars? customize it with any icons you want!
  0 out of 5 ratings? how about 0 out of 100?! (if the screen size supports it that is.)
                   DESC

  spec.homepage     = "https://github.com/shadow-of-arman/UIRating"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Arman" => "shadowofarman@hotmail.com" }
  spec.social_media_url   = "https://www.instagram.com/shadowofarman/"

  spec.platform     = :ios, "11.0"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/shadow-of-arman/UIRating.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "UIRating/**/*.{h,m}"
  spec.resources = "UIRating/**/*.xcassets"

end
