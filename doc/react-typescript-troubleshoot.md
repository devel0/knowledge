# react typescript troubleshoot

## JSX.Intrinsict

- **error**: `Property 'numInput' does not exist on type 'JSX.IntrinsicElements'.`
- **fix**: use uppercase for custom component (eg. `NumInput`)

## createTheme_default is not a function

- edit `vite.config.ts`

```ts
export default defineConfig({
  optimizeDeps: {
    include: [
      '@emotion/react',
      '@emotion/styled',
      '@mui/material/Tooltip'
    ],
  },
})
```