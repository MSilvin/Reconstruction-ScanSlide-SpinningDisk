[![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed by Marine SILVIN, (http://ici.igbmc.fr/) under a
[Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg


## Table of Contents
1. [Reconstruction ScanSlide SpinningDisk](#Reconstruction-ScanSlide-SpinningDisk)
2. [Requirements](#Requirements)
3. [How to install and run the macro](#How-to-install-and-run-the-macro)
7. [Outputs](#Outputs)
8. [More infos](#More-infos)


# Reconstruction ScanSlide SpinningDisk
 This macro allows easy reconstruction of microscopy files from the ScanSlide (GATACA) module of a Spinning disk.
 For now, it only allows to regroups the stack for 1 position and 1 channel.

### Requirements
* All the TIFF acquired by the module. Corresponding to every z of every x,y regions.
* Know the number of z-steps
* A folder named Output in the working directory
* A folder named OutputC1 in the working directory
* A folder named OutputC2 in the working directory

![image](https://user-images.githubusercontent.com/60384924/157669109-7dd65def-6824-4d00-8950-c83f8b0fe854.png)

## How to install and run the macro
Drag&Drop in Fiji.
Click on "run".


## Outputs
For now, it only create TIFF stack in the Output folder. 
It concatenates all the Xn Yn position together for 1 channel and create a stack.
![image](https://user-images.githubusercontent.com/60384924/157669179-8bb590b7-e79b-4036-9210-c5482ca1a070.png)


## More infos
If you want to stitch afterwards, you have to use the plugin on Fiji (https://imagej.net/plugins/grid-collection-stitching) "grid collection stitching". Use the Grid:column-by-column type.
