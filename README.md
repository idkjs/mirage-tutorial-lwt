# Running Projects

`cd project`
`opam install mirage mirage-unix opam-depext`

Running the following command generates a bunch of files include a `Makefile` which we will use next:

```sh
eval $(opam env) && mirage configure -t unix
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
