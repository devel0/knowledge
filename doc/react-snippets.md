# react snippets

## manage urls

```tsx
export const generateUrl = (schema: string, values: { [key: string]: string | undefined }) => {
    let res = schema

    Object.keys(values).forEach(k => {
        const v = values[k]

        if (v !== undefined)
        {    
            var rgx = new RegExp(`/:${k}[?]*`, "g")
            res = res.replace(rgx, `/${v}`)
        }
    })

    return res
}
```

then use like follow

```ts
export const APP_URL_Some = (id?: string) => generateUrl(
    `${APP_URL_BASE}/some/:id?`, { id })
```
