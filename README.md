# PolyHatch

## Description
PolyHatch is an AutoCAD script written in _lisp_ language to automate a basic photolithography photomask verification. The purpose of this scrip is to look for __closed polylines__ within a given selection of drawings in a list of layers and hatch them. The generated hatches are grouped for easy handling. This verification step helps finding possible openings in regions that are supposed to form a closed region (solid areas in the photomask) and speeds up the design check rule step from customer perspective. A minor modification may be needed if you want to extent this script to other applications.

## Usage Instruction

1- Drag and drop the __Poly_Hatch.lsp__ script into your AutoCAD window. Choose _Load Once_/_Always Load_ depending on your preference.

![image](https://user-images.githubusercontent.com/3451891/109456555-f7790880-7a0d-11eb-968d-5f6d56e45366.png)

2- Call the function by typing `polyhatch` in the command prompt (or anywhere within the active window)

![image](https://user-images.githubusercontent.com/3451891/109457994-cd751580-7a10-11eb-8d5e-00a7118e5288.png)

3- Enter the layer names that includes your objects separated by a __,__ i.e. `Layer1,Layer2,Layer3`.

![image](https://user-images.githubusercontent.com/3451891/109457956-bafadc00-7a10-11eb-9982-3307a9831061.png)

4- Make a selection

![image](https://user-images.githubusercontent.com/3451891/109458865-8556f280-7a12-11eb-8f29-496704ea5d32.png)

5- Enter a name for the group made for all hatches.

![image](https://user-images.githubusercontent.com/3451891/109457912-a6b6df00-7a10-11eb-807d-eec2ca0723fa.png)

6- Finished! Here only one closed object was detected in the selection within _Layer1_ (magenta:Layer1, green:Layer2, orange:Layer3 for this example drawing).

![image](https://user-images.githubusercontent.com/3451891/109457832-7a02c780-7a10-11eb-8af3-9413d35d4c7e.png)

\**Note that circle is a different type of object and not considered during hatching process.*

## Work around with open objects
You can use CAD techniques to make closed polylines. Here I mention two of them:
- make it closed from `properties panel`.
- 
![image](https://user-images.githubusercontent.com/3451891/109457320-7de21a00-7a0f-11eb-90b2-2bf108ca3ecc.png)

- use `boundary` command to form a closed polyline by picking a point inside a closed region (my favorite!).

![image](https://user-images.githubusercontent.com/3451891/109458186-2f357f80-7a11-11eb-83fd-6a3cdd2ec148.png)

![image](https://user-images.githubusercontent.com/3451891/109457415-af5ae580-7a0f-11eb-826e-06196702ad5a.png)

It creates a new object, you need to remove previous primary objects manually.

![image](https://user-images.githubusercontent.com/3451891/109457570-f6e17180-7a0f-11eb-8546-b328a0a885f5.png)

Calling `polyhatch` command will result in all features being properly hatched (will show up as solid areas in the final photomask). Here I used `all` as layer name and it automatically looks into all available layers.

![image](https://user-images.githubusercontent.com/3451891/109457725-41fb8480-7a10-11eb-81aa-b762eec452d6.png)

## More features..
Feel free to contribute and add new features that might help more people.
