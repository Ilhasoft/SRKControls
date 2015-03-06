#
# Be sure to run `pod spec lint SRKControls.podspec` to ensure this is a valid spec.
#

Pod::Spec.new do |s|
	s.version		=	'1.0.0'
	s.name			=	'SRKControls'
	s.authors		=	{ "Sagar Kothari" => "sag333ar@gmail.com" }
	s.homepage		=	"http://sagarrkothari.com"
	s.license		=	{ :type	=> 'BSD' }
	s.platform		=	:ios, '7.0'
	
	s.source_files	=	'SRKControls/*.{h,m}'
	
	s.frameworks = 'UIKit', 'Foundation', 'QuartzCore'
end