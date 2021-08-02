# freecad formula reference

notes:
- use `=` key to insert a formula into object parameter
- use `F2` to rename created objects

| formula | description |
|---|---|
| `<<ObjName>>.Placement.Base.[x,y,z]` | x or y or z object position |
| `<<ObjName>>.Height` | height of object |
| `<<ObjName>>._shape.BoundBox` | object bounding box |
| `<<ObjName>>._shape.BoundBox.MinZ` | object bounding box ( min z ) |

## using script

### object bounding box

```py
App.ActiveDocument.getObjectsByLabel("objname")[0].Shape.BoundBox
```
