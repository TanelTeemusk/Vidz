![logo](icon.png)
# Vidz
 Vidz is a test iOS assignement for iPhone Photography School

Vidz project uses SwiftUI to show a list with videos (list source is a local json file). Upon list click a video details screen is opened where video can be watched (video will loop for convenience). 
Video details also features a video name, description and a download button which will initiate a download.
If video is already downloaded to caches folder then local video is used instead of the one in the url.


## iPhone Photography School Assignement description

Create a tiny app from scratch where users can pick a video from a list and watch it in the details view. Also they have to be able to download and watch the video when there's no internet connection.


Views

Video list screen:
Show title “Videos”
Show a list of videos (SwiftUI)
Show a thumbnail image and name for each video
List of videos has to be fetched(from url or local) when opening application

Video details screen:
Show video player (SwiftUI VideoDetails view)
Show a “Download video” button to start download for offline viewing
Show a “Cancel download” and progress bar when video is downloading
Show video title
Show video description

