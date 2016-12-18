# FrontApp Engineering test

You are given a small sample of our API response when loading an email conversation.
The goal of this test is to display a list of emails in the `FA_TableViewController`. 

### Issues we are facing

One of the biggest challenge we are facing is to display multiple HTML emails in a scrollview. 
* We do not preload the messages and local store them on the phone like many mail apps do. Because of this we have to fetch messages remotely every time. 
* Other email client usually display one message at a time, and not multiple. This is relatively memory consuming.
* While UIWebview are loading HTML synchronously, the new WKWebview is not, which mean that you have to change the cell height when the HTML is loaded (or each time an image is loaded too). That being said, feel free to use anything you want to display HTML, you are not bound to Apple webviews. 
* A webview is a scrollview too, so we have to limit the scrolling there otherwise we would have nested scrollviews. 

### What is available to you

We already pre-loaded the list of messages for you from a json file, so you do not need to handle any of the networking aspect. Loading this file is done synchronously in the viewDidload method of the controller. 
The class `FA_Message` already possess all the properties you will need for this exercise. 

The following properties are available to you: 
* body: String = This is the full HTML message.
* content_loaded: Boolean = Whether or not the message is fully loaded. For the sake of the exercise, the content of `body` will already be loaded so that you do not have to perform any network call. The content_loaded can be then ignored. 
* blurb: String = The message summary, without any HTML

### What you have to do

We are looking to create a simple timeline of messages. 

The class `FA_TableViewController` is already implementing a few key delegate methods. 
* Display the HTML content of the message (the `body` property of the message). 
* The webview should resize itself to the correct height, and so does the cell.
* Only one cell should be used. Please do not use two cells to either display the blurb or the webview.
* Use of autolayout is preferred. 

The cell can either display a blurb of the message, or the body itself. 
* If the content_loaded property of a message is true: display the body of a message first
* if the content_loaded property of a message is false: display the blurb. A tap on the blurb should hide it and display the `body` instead. Once a message is expanded, you cannot close it. (By default, some messages are `content_loaded = false` but the body is already set. This is to simplify the test).


### What you shouldn't spend too much time on

While we are interested in how you approach the problem:
* This test is not meant to assess your knowledge of Xcode, so this is why you're given this boiler plate project.
* We are giving simple text email (but with HTML markup). So you will need to display HTML but you shouldn't spend too much time optimizing the presentation of the email itself. (we are not giving you complex HTML with media queries and all).
