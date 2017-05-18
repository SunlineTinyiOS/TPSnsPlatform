# TPSnsPlatform

[![CI Status](http://img.shields.io/travis/bygd2014@sina.com/TPSnsPlatform.svg?style=flat)](https://travis-ci.org/bygd2014@sina.com/TPSnsPlatform)
[![Version](https://img.shields.io/cocoapods/v/TPSnsPlatform.svg?style=flat)](http://cocoapods.org/pods/TPSnsPlatform)
[![License](https://img.shields.io/cocoapods/l/TPSnsPlatform.svg?style=flat)](http://cocoapods.org/pods/TPSnsPlatform)
[![Platform](https://img.shields.io/cocoapods/p/TPSnsPlatform.svg?style=flat)](http://cocoapods.org/pods/TPSnsPlatform)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TPSnsPlatform is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TPSnsPlatform"
```
## Usage
使用案例:

```ruby
/**
 *  平台名称
 *  wxsession:微信
 *  sina:微博
 *  qq:qq
 */
function login(platformName){
    var a = new SnsPlatform();
    a.platformName = platformName;//登录的平台
    a.success = function(data){
        window.alert(data);
        console.print(data);
    }
     a.error = function(data){
        window.alert(data);
    }
    a.login();
}
```


## Author

bygd2014@sina.com, bygd2014@sina.com

## License

TPSnsPlatform is available under the MIT license. See the LICENSE file for more info.
