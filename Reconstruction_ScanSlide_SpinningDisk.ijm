//define input and output directories
#@ File (label = "Input directory", style = "directory") inDir
outDir = inDir + "/Output/";
outDirC1 = inDir + "/OutputC1/";
outDirC2 = inDir + "/OutputC2/";
list=getFileList(inDir);
#@ String (label = "Steps Z", value = 221) steps
nGroup = steps //size of the image stack
//print(lengthOf(list));

setBatchMode("True");

//loop through the groups and make the image stack
	for (i = 1; i < lengthOf(list); i++) {
		if(endsWith(list[i], "_T001.TIF")) { 
			fileName = File.getNameWithoutExtension(list[i]);
			print(i + ": " + inDir+list[i]); 
			indexC = indexOf(fileName, "_C");
			indexZ = indexOf(fileName, "_Z");
			
			valeurC = substring(fileName, indexC+2, indexZ);
			//print(valeurC);
	
			open(inDir + "/" + list[i]); 
	        imgName=getTitle();
	
			if (valeurC == "1") {
				saveAs("Tiff", outDirC1 + "/" + imgName); 
				close(); 
			}
			else {
				saveAs("Tiff", outDirC2 + "/" + imgName); 
				close(); 
			}
		}
	}	

listC1 = getFileList(outDirC1);
listC1 = Array.sort(listC1);

listC2 = getFileList(outDirC2);
listC2 = Array.sort(listC2);

jcounter = 01
kcounter = 01

zstep = parseInt(nGroup);

//print(nGroup);

	for (j = 1; j < lengthOf(listC1); j+=nGroup) {
		fileNameC1 = File.getNameWithoutExtension(listC1[j-1]);
		print(fileNameC1);
		run("Image Sequence...", "open=&outDirC1 number=&zstep starting=j sort"); //read images and make stacks
		saveAs("Tiff", outDir + fileNameC1 + "-Tile"+ jcounter);
		jcounter = jcounter + 1;
		close();
}
	

	for (k = 1; k < lengthOf(listC2); k+=nGroup) {
		fileNameC2 = File.getNameWithoutExtension(listC2[k-1]);
		print(fileNameC2);
		run("Image Sequence...", "open=&outDirC2 number=&zstep starting=k sort"); //read images and make stacks
		saveAs("Tiff", outDir + fileNameC2 + "-Tile"+ kcounter);
		kcounter = kcounter + 1;
		close();
}
