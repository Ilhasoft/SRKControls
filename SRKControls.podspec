#
# Be sure to run `pod spec lint SRKControls.podspec` to ensure this is a valid spec.
#

Pod::Spec.new do |s|
	s.version		=	'1.0.0'
	s.name			=	'SRKControls'
    s.summary       =   'A Custom control to turn UITextfield to item-picker & date-picker.'
	s.authors		=	{ "Sagar Kothari" => "sag333ar@gmail.com" }
	s.homepage		=	"http://sagarrkothari.com"
	s.license		=	{ :type	=> 'BSD' }
	s.platform		=	:ios, '7.0'
    s.source        =   { :git => 'https://github.com/sag333ar/SRKControls.git', :branch => 'master', :tag => '1.0.0' }
    s.subspec 'Controls' do |controls|
        controls.source_files	=	'SRKControls/*.{h,m}'
    end
	
	s.frameworks = 'UIKit', 'Foundation', 'QuartzCore'
end