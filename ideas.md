# Ideas

## Signal Processing
- The application needs to recognize not only the particular animal making a sound, but some characteristics of that sound
	- A bark vs. a growl
	- High-pitched sound vs a low-pitch sound
	- Do this by using spectral properties
		- Spectral Centroid (SC), Spectral Flux (SF), Spectral Roll-off Frequency (SRF),
	  	  Zero Crossing Rate (ZCR), Mel-Frequency Cepstral Coefficients (MFCC),
		  and Linear Predictive Coding (LPC) (McEnnis et al., 2005)

## Machine Learning
- ANN
	- Train using spectral properties of sound from Macaulay Library sound archive
		- Average and standard deviation
	- Make sure to include "negative samples"
- A synthesized human-speech version of the sound, overlaid on the sound's profile (quiet when the sound is quiet, fades in and out just as the animal sound does), should be created, based on the recognized characteristics.
