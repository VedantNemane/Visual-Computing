
   ____                                             _      _ 
  / ___|___  _   _ _ __ ___  _____      _____  _ __| | __ / |
 | |   / _ \| | | | '__/ __|/ _ \ \ /\ / / _ \| '__| |/ / | |
 | |__| (_) | |_| | |  \__ \  __/\ V  V / (_) | |  |   <  | |
  \____\___/ \__,_|_|  |___/\___| \_/\_/ \___/|_|  |_|\_\ |_|
                                                             
---------------------------------------------------------------
Before starting:
- Make sure you have the latest version of MatLab installed
- Strengthen your resolve and patience
- Read this carefully

6.1...6.4: Open folder called "convolution-lab-updated" and open "test_convolution.m" and run it on MatLab. 
I have my Gaussian low-pass filter code in test_convolution too so don't use another version!

7.1: Open folder called "transforms-lab" and open "rotate2D.m" and run it.

7.2: Stay on "rotate2D.m" and do the following changes:
	- Uncomment line 11 (p = p.';)
	- Comment out line 25 (R = [(cos...)
	- Uncomment line 28 (R = (cos...)
	- Comment out line 31 (pprime = R * p)
	- Uncomment line 34 (pprime = p * R)
	- Comment out lines 37 and 38 (pprime(:, 1)...)
	- Nearly there, NEARLY there!
	- Uncomment lines 41 and 42 (pprime(:, 1)...)
	- Comment out lines 45 to 48 (inclusive; these lines draw the polygon)
	- Uncomment lines 51 to 54 (inclusive; these lines also draw a new polygon)
	- Run it to test 7.2!

7.3: Open "earthmoon.m" and run the file as normal on MatLab.

7.4: Open "transforms.m" and run the file as normal on MatLab.

8.1: Open image-warping-lab folder and open "backwardmap.m". Comment out line 10 and uncomment line 14 
to see that I've changed the value of M, and do the vice versa to return code to original state. 
Run the file to see the backwardmap working.

8.2: Staying on "backwardmap.m", comment out lines 28 and 29, and uncomment lines 33-50 (inclusive) and run.

8.3: Open "lens_distortion.m", and run the file.

That's it! Thanks for reading to the end!
