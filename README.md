[![Build Status](https://travis-ci.org/BenSolus/linter-opencl.svg?branch=master)](https://travis-ci.org/BenSolus/linter-opencl)

# linter-opencl package

Linter plugin for [Linter](https://github.com/AtomLinter/Linter), provides an interface to the build functionality of OpenCL.

## Important info for user of hybrid graphics!

On systems with hybrid graphics, OpenCL will compile and lint for the integrated graphics card by default. While Windows users just need to set the platform index of the desired platform, Linux users who wants to use the dedicated graphics card need to enable the '''hybridGraphics''' option and provide the path to a GPU offloader like '''optirun''' to enable linting for those devices.

## Installation

1.  Install an OpenCL implementation for your device
2.  Install [Python](https://www.python.org) and
    [PyOpenCL](https://mathema.tician.de/software/pyopencl/)
3.  Install [linter](https://github.com/steelbrain/linter),
    [language-opencl](https://github.com/podgib/atom-opencl) and
    [linter-opencl](https://github.com/BenSolus/linter-opencl)
4.  (Configure the path to Python and set OpenCL Vendor and Platfrom Index in
    preferences.)
5.  Go linting!

<!-- ## (Sub-)Project-Specific compiler flags

Assuming you have a file ```... /projectRoot/some/directories/foo.cl``` open in
your editor, linter-opencl searches for compiler flags the following way:

1.  Looking for ```.opencl-flags.json``` in the same directory as your source
    file (```... /projectRoot/some/directories.opencl-flags.json```).
2.  Recursively looking for ```.opencl-flags.json``` in every subdirectory down
    to your project root directory
    (down to ```... /projectRoot/.opencl-flags.json```).
3.  If no ```.opencl-flags.json``` was found, linter-opencl uses the compiler
    flags defined in your package settings.

Linter-opencl uses the flags from the first file it finds and replaces it with
the flags defined in your package settings.

You can specify your settings in ```.opencl-flags.json``` with the following
syntax:

    {
      "compilerFlags": "-cl-mad-enable -cl-fast-relaxed-math",
      "includePaths": [".", "/opt/include"]
    }

Include paths are listed in an array. Relative paths
(starting with ```.``` or```..```) are expanded relative to the
***project root*** directory. -->

## Afterword
OpenCL is a complex beast. There are lots of different settings provided for
building kernels on devices and the format of the log differs depending on the
vendor which provides OpenCL. Due to this fact and my limited resources (of
testing devices) there will be uncatched cases and issues so feedback will be
appreciated.
