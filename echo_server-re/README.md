# Echo Server

`cd echo-server`
`opam install mirage mirage-unix opam-depext`

Running the following command generates a bunch of files include a `Makefile` which we will use next:

```sh
eval $(opam env) && mirage configure -t unix
eval $(opam env) && make depend
```

To run `unikernal.re` you have to tell `opam` to convert the text from `.re` to `.ml` before executing. Copy the contents of `myocamlbuild.ml` from the [restack repo](https://github.com/dysinger/restack/blob/master/000-hello-world/myocamlbuild.ml) which will do this for us. Paste into the `./myocamlbuild.ml` file that was generated when ran the `mirage configure -t unix` command previously.

Now run `make depend` from the generated `Makefile` to add opam deps.

```sh
eval $(opam env) && make depend
```

Build project by running `make`.

Run project with `_build/main.native`.

output:

```sh
➜  echo_server _build/main.native
aaaaaaaaaaaaaaaaaa
aaaaa
aaaaaaaaaaaaaa
aaaa
aaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaa
aaaaaaaaaaa
aaaaaaaaaa
aaaaaaaaaaaaa
aaaaaaaaaaa
➜  echo_server
```
