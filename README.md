# Resort Feedback

## Project Description
Resort Feedback is an iOS app used for the fictional Sunset Resort to receive and store feedback from users who sign up, along with providing them offers and dynamic end screens based on their average rating for the resort.

## Features
* Create an Account, username and password stored on the device using CoreData.
* Update password for your account, with a validation check to ensure the new passwords implemented match.
* Forgot password screen, for simply providing the user with their password.
* Offers screen for allowing the user to select offers for the resort.
* Dynamic end screen based on the average rating from all 5 surveys.
* Surveys must be compeleted, or the app rejects your survey
* Animated splash screen
* User defaults to save the previously entered username and password combination for ease of repeated use for the user

## TODO
* Implement email API to send the user's password there instead of printing it on the screen/in an alert.
* Clean up CoreData, use relationships and merge all the different survey pages into one Survey object

## Getting Started
git clone https://github.com/atorresruiz8/resortFeedback
* Must be on MacOS and have Xcode installed.
* If the Podfile is not properly installed, run your terminal app.
* Change directories to "ResortFeedback," wherever you have installed it.
* Run the command 'pod install' to ensure the Podfile is installed, otherwise the project will not work.
* In ResortFeedback folder, open the ResortFeedback.xcworkspace file. This project uses Podfiles, so the ResortFeedback.xcodeproj will not work.
* This app is primarily designed with the iPhone 8/iPhone SE in mind, so run the simulator using an iPhone 8 for the proper viewing experience.
* Build the project and run the app on a simulator, or iPhone.

## Usage
> Install the app onto either your simulator or iPhone by running the build command.
> Once the app is installed and running, wait for the splash screen to end.
> Create an account by selecting the "Create Account" button on the login screen, then entering a username and password.
> If you wish, flip the switch to "On" after inputting your username and password on the login screen to save your information for next time. Sign in.
> Click the Survey button to be taken to a series of 5 screens to review the resort. Select a star from 1 to 5. Click next.
> On the final screen, click submit and your average score will be calculated.
> Wait for the end screen to disappear and bring you back to the main logged in menu.
> You can view offers by clicking the Offers button, or log out and return to the sign in screen.

## Contributors
* Antonio Torres-Ruiz, project leader and programmer.

## License
This project uses the following license: [<license_name>](<link>).
