## Introduction

Command `jq` can be used to handle JSON, and `xmllint` can be used to handle xml (and html).


To install these 2 tools on Debian:

```sh
sudo apt install libxml2-utils jq
```

> `xmllint` is part of `libxml2`.

## Examples

```sh
echo '{"a":{"b":{"c":[1,2,3]}}}' | jq '.a.b.c[1]'
# 2
```

```sh
curl -s https://kernel.org | \
xmllint - --html --xpath '//a[@href="./"]/text()' 2> /dev/null
# The Linux Kernel Archives
```

