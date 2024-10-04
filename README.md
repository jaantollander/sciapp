Simple scientific application for demonstration purposes written in C.
We use [GNU Makefile conventions](https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html).

We can build it with Make:

```bash
make
```

We can run the example as follows:

```bash
build/main examples/input.txt example/output.txt
```

We can install the application using

```bash
make install PREFIX=/usr/local
```
