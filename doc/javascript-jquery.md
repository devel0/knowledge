# javascript / jquery

## array

```js
let arr = [];
arr.push(1);
arr.push(2);
arr.slice(arr.indexOf(1)); // remove element 1 (index 0)
```

## locate with jquery

- search any with some class

```js
let q1 = $('.someclass');
```

- search any specific **descendant** with class that have parent with some class

```html
<table class="sometblclass">
  <tbody>
    <tr>
      <td class="j-mycls"></td>
    </tr>
  </tbody>
</table>
```

```js
let q1 = $(".sometblclass > tbody > tr > td.j-mycls");
```

- search class1 **or** class2

```js
let q = $(".class1,.class2");
```

- search any element with **attribute**

```html
<button mynfo="xx"></button>
```

```js
$("button[mynfo]").each((idx,btn) => {
  let mynfo = $(btn).attr("mynfo");
});
```

- search with **starting**

```js
let q = $("[class^='starttext']");
```
