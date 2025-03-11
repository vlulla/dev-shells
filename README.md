These are development shells using nix package manager.

To run them install Nix from [NixOS](https://nixos.org) and then in your shell
run the following:

```bash
$ nix-shell ./erlang-shell.nix
```

See the page [Declarative shell environments with
shell.nix](https://nix.dev/tutorials/first-steps/declarative-shell) for a more
detailed explanation of creating a shell environment using Nix.

And, the nice thing about these shells is that they can be cascaded.  So, for
instance if you need a shell with Python and OCaml then launch one dev-shell.
From this new dev-shell launch the other dev-shell. Below is an example:

```bash
$ nix-shell ./python-shell.nix
[nix-shell ~] $ nix-shell ./ocaml-shell.nix
[nix-shell ~] $ ocaml --version
[nix-shell ~] $ python --version
```
