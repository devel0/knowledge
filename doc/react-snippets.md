# react snippets

- [manage urls](#manage-urls)
- [table styled link](#table-styled-link)

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

## table styled link

```tsx
export const TableLinkCell = (props: { children: ReactNode, to: string }) => <StyledTableCell>
    <Box
        sx={{ cursor: 'pointer' }}
        component={Link}
        to={props.to}
    >
        <Box sx={{ p: DEFAULT_SIZE_1_REM }}>
            {props.children}
        </Box>
    </Box>
</StyledTableCell>
```

then use like

```tsx
<TableRow key={`row-${idx}`}>
    <TableLinkCell
        to={APP_URL_Some(row.id)}>
        <Typography>{row.field}</Typography>
    </TableLinkCell>
</TableRow>
```