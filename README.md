#Project Outline
Create a production level API that will scale aspect ratio of an image dimensions to a bounding box.  A user should be able to make a request with an array of image dimensions ([w,h]) and a bounding box dimension ([w,h]). The api should be able to handle multiple sets of image dimensions at once ([w,h,w,h,w,h,w,h]) and return the scaled down ratios

EXAMPLE REQUEST:
GET
```js
{
  image_dimensions: [400,200],
  bounding_box: [200,200]
}
```

RESPONSE:
```js
{
  scaled_dimensions:  [200,100],
  bounding_box:  [200,200]
}
```



EXAMPLE REQUEST:
```js
{
  image_dimensions: [1256,1200, 600, 800, 200, 200, 400, 200, 800,1256],
  bounding_box: [200,200]
}

```

RESPONSE:
```js
{
  scaled_dimensions: [200, 191, 150, 200, 200, 200, 200, 100, 127, 200],
  bounding_box: [200,200]
}
```
#Production
[Production Site](https://image-scaler.herokuapp.com)

EXAMPLE REQUEST:

`https://image-scaler.herokuapp.com/api/v1/images/scale?image_dimensions=400+200&bounding_box=200+200`
