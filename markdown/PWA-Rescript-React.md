# Workflow
It's annoying having to run `npm run v:dev` and `npm run res:dev` to launch the
watchers for Vite and Rescript everytime I want to start working on my project.
At first, I was just going to fork both of these using a Makefile, but I learned
of the command [Concurrently](https://github.com/open-cli-tools/concurrently).
One thing I like is that I can now run both of these commands in the same shell
instead of two, and it prefixes and color codes the output for each command.

Here is an example `scripts` object in `package.json` using `concurrently`:

```.json
"scripts": {
    "dev":       "concurrently -k -n vite,rescript \"npm:vit:dev\" \"npm:res:dev\"",
    "res:build": "rescript",
    "res:clean": "rescript clean",
    "res:dev":   "rescript watch",
    "vit:dev":     "vite",
    "vit:build":   "vite build",
    "vit:preview": "vite preview"
  }
```

The option `-k` tells `concurrently` to kill all processes if one exists, and
`-n` gives each process a custom name.

# Rescript

## Undefined in Rescript
Like Haskell, it seems we have an `undefined` in Rescript denoted `%todo`.