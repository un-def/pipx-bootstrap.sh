# pipx-bootstrap.sh

A POSIX Shell script for installing pipx with pipx

## Other Versions

  * [Python](https://github.com/un-def/pipx-bootstrap.py)
  * [PowerShell](https://github.com/un-def/pipx-bootstrap.ps1)

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

```shell
pipx install pipx --verbose --force
```

The script uses `python3` binary by default. It can be overriden with the environment variable `PYTHON_BIN`:

```shell
PYTHON_BIN=/path/to/python sh pipx-bootstrap.sh
```
