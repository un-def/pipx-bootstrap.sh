# pipx-bootstrap.sh

A POSIX Shell script for installing pipx with pipx

## Motivation

[pipx][pipx-homepage] is an excellent tool for managing end-user applications written in Python. It installs each application (an *application* is, in fact, a regular Python package with some sort of binary, e.g., a console script) in isolated [virtual environment][venv-docs], thus avoiding pollution of system/user site directories. However, you still need to install `pipx` in a system or user site.

It seems like the ‘chicken and egg’ problem, doesn't it?

`pipx-bootstrap.sh` shell script solves the problem by installing `pipx` with `pipx` itself, that is, this script installs `pipx` as a regular `pipx` “application”.

## How it works?

`pipx-bootstrap.sh` works as follows:

  * creates a temporary directory
  * downloads `pipx` and its dependencies into this directory as wheels (`*.whl`) using existing `pip` installation
  * builds `PYTHONPATH` environment variable from paths of each wheel
  * runs `pipx` wheel with `install pipx` command
  * removes the temporary directory

## Usage

Download `pipx-bootstrap.sh` and run it:

```shell
sh pipx-bootstrap.sh
```

or use ‘curl pipe shell’ technique:

```shell
curl https://raw.githubusercontent.com/un-def/pipx-bootstrap.sh/master/pipx-bootstrap.sh | sh
```

Script arguments are passed to `pipx install pipx` command, e.g.,

```shell
sh pipx-bootstrap.sh --verbose --force
```

is equivalent to

```
pipx install pipx --verbose --force
```

The script uses `python3` binary by default. It can be overriden with the environment variable `PYTHON_BIN`:

```shell
PYTHON_BIN=/path/to/python sh pipx-bootstrap.sh
```

## Alternatives

* [pipx-in-pipx][pipx-in-pipx-github]

  It uses a way more complicated approach to do the same thing.

* pipx-bootstrap

  This is essentially a stripped down version of `pipx`. It is not available anymore. [Here][pipx-bootstrap-comment] is an announcement. [This][pipx-bootstrap-github-copy] could be a copy of the original repository.

* `pip install [--user] pipx`

  After all, you can drop the idea of isolation and install `pipx` using only `pip`. It is the officially recommended way<sup>†</sup>. [Here][pipx-bootstrapping-rejection] is an explanation.

---

<sup>†</sup> I am personally against the idea of installing any package with dependencies (as of May 2020, `pipx` has more than five dependencies counting transitive ones) in system/user site directories. It could break other packages due to version conflicts.


[pipx-homepage]: https://pipxproject.github.io/pipx/
[venv-docs]: https://docs.python.org/3/library/venv.html
[pipx-in-pipx-github]: https://github.com/mattsb42/pipx-in-pipx
[pipx-bootstrap-comment]: https://github.com/pipxproject/pipx/issues/44#issuecomment-458007960
[pipx-bootstrap-github-copy]: https://github.com/pmav99/pipx-bootstrap
[pipx-bootstrapping-rejection]: https://github.com/pipxproject/pipx/pull/160#issuecomment-490183821
