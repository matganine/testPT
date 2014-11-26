# PearlExample

## Presentation
TODO

## Overview
This is an example code showing how to use our extension of the RaVis (Relational 
Analysis Components) library in order to layout pearls and pearltrees.

## Requirements
This example requires the RaVis library that can be found [here](https://github.com/pearltrees/ravis).

## Setting up project and components

#### Flash Library
This is a Flex 3.5 project and is compiled using playerglobal.swc for 10.1. You can
download it in the following [zip file](/Playerglobal.10.1.zip) and replace the existing
file in {YOUR_FLASH_BUILDER_PATH}\sdks\3.5\frameworks\libs\player\10\playerglobal.swc

#### Ravis Project Import
Ravis is the library used for the visualization of our tree organization. You need to
import it as a separate project in your workspace. You can find it [here](https://github.com/pearltrees/ravis).

#### PearlExample
You finally need to import the PearlExample project in your workspace and add the above
Ravis project in your Library Path. Building the project and executing it should show you
an example of Pearltree representation.

## Usage

Once you have set up the project and components, you can easily draw the following
pearltree example:

![Alt text](/pearlExample.png?raw=true "Example Pearltree Representation")

The data for this example is easily loaded with the xml file: graph.xml.
For example creating a pearltree and a pearl and linking them together takes as little as
this code:

``` xml
<!-- pearltree -->
<Node id="1" name="Trending" nodeColor="0x1e51c3" nodeSize="70" nodeClass="earth" />

<!-- pearl -->
<Node id="2" name="Music" nodeColor="0xcf39f8" nodeSize="50" nodeClass="leaf"/>

<!-- Link between the pearltree and the pearl -->
<Edge fromID="1" toID="2" color="0x000000" />
```

## License

The MIT License (MIT)

Copyright (c) 2014, Broceliand SAS, Paris, France (company in charge of developing Pearltrees).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contacts

You can contact us at contact@pearltrees.com
