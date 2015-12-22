#
# Be sure to run `pod spec lint SRKControls.podspec` to ensure this is a valid spec.
#

Pod::Spec.new do |s|
	s.version		=	'3.0.4'
	s.name			=	'SRKControls'
    s.summary       =   'A Custom control to turn UITextfield to item-picker & date-picker.'
	s.authors		=	{ "Sagar Kothari" => "sag333ar@gmail.com" }
	s.homepage		=	"http://sagarrkothari.com"
	s.license		=	{ :type	=> 'BSD' }
	s.platform		=	:ios, '8.0'
    s.requires_arc  =   true
    s.source        =   { :git => 'https://github.com/sag333ar/SRKControls.git', :branch => 'master', :tag => s.version }
    s.subspec 'Controls' do |controls|
        controls.source_files		=	'SRKControls/*.{swift}'
        controls.resource_bundles 	= {
									    'SRKControls' => [
									        'SRKControls/*.{xib}'
									    ]
  									  }
    end
	
	s.frameworks = 'UIKit', 'Foundation', 'QuartzCore'
end