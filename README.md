lib2framework
=============

Convert an automake project to an Xcode framework. The resulting framework will be created in $HOME/Library/Frameworks but can be moved and/or installed in any other location.

Usage: lib2framework &lt;framework&gt; &lt;id&gt; &lt;version&gt; &lt;dir&gt; [options]

You may need to predefine environment variables or do anything else necessary to build.

Here is a simple example to build libpng:<br>
lib2framework PNG org.libpng.png 1 libpng-1.4.5

This builds libtiff with the Apple OpenGL framework:<br>
export CFLAGS=-DHAVE_APPLE_OPENGL_FRAMEWORK<br>
lib2framework TIFF org.osgeo.tif 3 tiff-3.9.5 

Now build ImageMagick with that private build of libtiff:<br>
export CFLAGS=-I$HOME/Library/Frameworks/TIFF.framework/unix/include<br>
export LDFLAGS=-I$HOME/Library/Frameworks/TIFF.framework/unix/lib

Build ImageMagick.<br>
lib2framework ImageMagick org.imagemagick.imagemagick 6.6.8 ImageMagick-6.6.8-4 <br>

Get fancy with multiple versions: 

Build HDF4<br>
export CPPFLAGS=-I$HOME/Library/Frameworks/JPEG.framework/Versions/6/unix/include<br>
export LDFLAGS=-L$HOME/Library/Frameworks/JPEG.framework/Versions/6/unix/include<br>
lib2framework HDF org.hdfgroup.hdf 4 hdf-4.2.5 --enable-shared --disable-fortran<br>
export CPPFLAGS=<br>
export LDFLAGS=<br>

Build HDF5.<br>
lib2framework HDF org.hdfgroup.hdf 5 hdf5-1.8.5-patch1<br>

Some projects need serious hacking:<br>
PREFIX=$HOME/Library/Frameworks/OpenJPEG.framework/Versions/2.0/unix lib2framework OpenJPEG org.openjpeg.openjpeg 2.0 openjpegv2 -f Makefile.osx<br>
install_name_tool -id $HOME/Library/Frameworks/OpenJPEG.framework/Versions/2.0/unix/lib/libopenjpeg-2.2.0.0.dylib $HOME/Library/Frameworks/OpenJPEG.framework/OpenJPEG

