//Nadiv's Leaf Area Analysis Macro Version 2.4

scaleSize = 120 //variable for image size
//if (getHeight > 3300) //test code for checking if the image height resolution is larger than the smaller scans
	//scaleSize = [enterLargerImageSizeHere] //redefines the cm/pix ratio for larger scans
run("Set Scale...", "distance=scaleSize known=1 pixel=0 unit=cm"); //sets the scale of the image
makeRectangle(1293, 194, 1198, 2796); //creates a recangle around the area that might have leaves
run("Crop");
run("8-bit"); //converts to b/w
setMinAndMax(85, 195) //minimum and maximum for contrast
run("Brightness/Contrast...");
run("Close"); //closes the brightness and contrast menu
setAutoThreshold("Default");
run("Threshold..."); //opens the threshold menu
setThreshold(0, 145);
setOption("BlackBackground", false); //more threshold options
run("Convert to Mask");
run("Apply LUT"); //applys minimum and maximum values
run("Close"); //closes the threshold menu
run("Analyze Particles...", "size=0.15-Infinity show=Outlines display clear include"); //finds particles. include means include holes
close("\\Others") //comment out to retain the window with the threshold
