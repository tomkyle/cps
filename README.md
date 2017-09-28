# cps

**Create a file copy with given suffix**


## Installation


### MacOS · Homebrew

The *cps* bash script can be installed by a Homebrew formula, which itself is part of the [tomkyle/daily](https://github.com/tomkyle/homebrew-daily) tap. You may may want to install the tap first.


```bash
# Install tap first, formula second:
$ brew tap tomkyle/daily
$ brew install cps

# Without tapping first:
$ brew install tomkyle/daily/cps
```



### Linux

Just clone the repo and create a symlink in your local *~/bin* directory:

```bash
$ git clone git@github.com:tomkyle/cps.git cli-cps

# Create sylink
$ cd ~/bin
$ ln -s /full/path/to/cli-cps/cps cps
```



## Usage

Pass a **source file** and a filename **suffix** for the copied target.

```bash
$ cps foo.pdf -bar
$ ls

foo.pdf
foo-bar.pdf
```

## What happens inside

After building the target file name, a simple copy command is used. Considering the usage example above:  
`cp foo.pdf foo-bar.pdf`.


## Issues

See [issues list.][i0]

[i0]: https://github.com/tomkyle/cps/issues 
