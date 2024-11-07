# Welcome to the source code of the Banzir 6
This system was created for the amusement of the staff and the education of the first year of Talpiot.
## Modules
### The system itself
Two lasers pointing in the same direction on either side of a camera, also pointing in the same direction.\
The parts include:
1. 2 5mW lasers
2. 1 camera 1024x768
3. 1 Arduino Leonardo
4. 1 Breadboard

### Image processing
By using the snapshot tools given by matlab, we can get images from the camera at 10fps.\
This number could probably be higher, but we don't actually need any higher than 0.5fps.

Then, we isolate the red in the image, and after using a convolution to blur the image find the maximum red in the image.\
It's also important to mention the image is cropped to the plausible places the laser could be.

### Conversion to distance
Using complex trigonometry that only TheHaK can understand, because he learned it from Buddhist monks in Nepal.\
He told me that they hit him with sticks until he got their questions right.
