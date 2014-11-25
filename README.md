# PearltreesCore

## Overview
This project contains the core of our application. It includes:

* tree structure visualization
* animations
* pearls and pearltrees interactions
* data model

#### Visualization
In this project, we implement a simple and ergonomic tree structure visualization. The
Ravis library is extended in order to create our customized tree representation and 
layout. Automatic organization algorithms are implemented to balance pearls around 
pearltrees and reorganize them in order to have simple and appealing layouts. We also
use the PearltreesAssets project to shape our pearls. This allows us to give a unique 
representation for each type of pearl in Pearltrees; trees, aliases, teams, pages,
notes, photos and documents have all their own mask and decoration.


#### Animations
In Pearltrees, pearls manipulation is a core feature, and animations are necessary to
enhance the user experience. Animations have been implemented for many manipulations
among them:
* adding a new pearl
* opening a new pearltree
* either zooming in or zooming out
* flinging a pearl for example
* detaching a branch from a tree
* selecting several pearls and moving them around or positioning them in your dropzone
* etc...


#### Interactions
Interaction classes allow to dynamically edit, move, delete pearls and pearltrees.
There are many interactors in Pearltrees. Each interactor will handle specific gestures
on the user interface:

* PearlDetachmentInteractor handles the gesture of separating a pearl from another one
or from a pearltree.
* DraggingOnStringInteractor allows moving a pearl along a line
* DragIntoTreeInteractor allows to move dragged pearls into a pearltree
* EmptyTreeOpenerInteractor opens a tree while drag pearls and placing them
long enough above an empty pearltree
* DropZoneInteractor allows to move pearls from and to the user's dropzone
* etc...

For each of these interactors, we also set rules to allow or forbid user interactions 
with pearls. For instance, dragging a pearl into a tree that has too many pearls is not
allowed.

#### Data Model
The data model used in pearltrees is the core of our tree representation. We distinguish two types
of nodes: pearltrees and pearls ; and each one of these types has several subtypes. Pearls for
instance, can either be pages (website urls), notes, photos or files while pearltrees can be trees
or aliases (which are links to other existing trees).


## Requirements
This example requires:

* the RaVis library that can be found [here](https://github.com/pearltrees/ravis)
* the PearltreesAssets library that can be found [here] (https://github.com/pearltrees.com/PearltreesAssets)

## Setting up project and components

#### Flash Library
This is a Flex 3.5 project and is compiled using playerglobal.swc for 10.1. You can
download it in the following [zip file](/Playerglobal.10.1.zip) and replace the existing
file in {YOUR_FLASH_BUILDER_PATH}\sdks\3.5\frameworks\libs\player\10\playerglobal.swc

#### Ravis Project Import
Ravis is the library used for the visualization of our tree organization. You need to
import it as a separate project in your workspace. You can find it [here](https://github.com/pearltrees/ravis).

#### PearltreesAssets Project Import
PearltreesAssets project is necessary to get the assets used in the layout of our pearls.
Therefore, you also need to import it as a separate project in your workspace. You
can find it [here] (https://github.com/pearltrees/PearltreesAssets).

#### PearltreesCore
You finally need to import the PearltreesCore project in your workspace and add the above
Ravis and PearltreesAssets projects in your Library Path. 

#### PearlExample
PearlExample is a separate project that can be found [here](https://github.com/pearltrees/PearlExample), it is an example
code to easily draw a tree and its pearls. Here is an example output tree representation that
you can make with this example:

![Alt text](/pearlExample.png?raw=true "Example Pearltree Representation")

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
