//Nadiv's Leaf Area Analysis Macro Version 2.8

if (getHeight > 3300) { //test code for checking if the image height resolution is larger than the smaller scans
	run("Set Scale...", "distance=240 known=1 pixel=0 unit=cm"); //sets the scale of the image
	makeRectangle(2500, 400, 2525, 6000);
} else {
	run("Set Scale...", "distance=120 known=1 pixel=0 unit=cm"); //sets the scale of the image
	makeRectangle(1250, 200, 1260, 3000);
}
run("Crop");
run("8-bit"); //converts to b/w
setMinAndMax(145, 225) //minimum and maximum for contrast
run("Brightness/Contrast...");
run("Apply LUT"); //applys minimum and maximum values
run("Close"); //closes the brightness and contrast menu
setAutoThreshold("Default");
run("Threshold..."); //opens the threshold menu
setThreshold(0, 200);
setOption("BlackBackground", false); //more threshold options
run("Convert to Mask");
run("Close"); //closes the threshold menu
run("Analyze Particles...", "size=0.15-Infinity show=Outlines display clear include"); //finds particles. include means include holes
//close("\\Others") //comment out to retain the window with the threshold