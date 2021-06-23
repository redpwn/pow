# redpwnpow

A non-parallelizable proof of work challenge system

## Install

To download, cache, and execute a binary to solve a PoW challenge in a single command, use:
```sh
curl -sSfL https://pwn.red/pow | sh -s challenge
```

Static binaries for Linux, Windows, and macOS are also available [in GitHub releases](https://github.com/redpwn/pow/releases).

If Go and libgmp are available, you can compile, install, and run with:
```sh
go install github.com/redpwn/pow/cmd/redpwnpow@latest
redpwnpow challenge
```

## kCTF

redpwnpow can be used as a drop-in replacement for [kCTF](https://google.github.io/kctf/)'s proof of work solver.
redpwnpow is approximately **10x** faster than kCTF's [Python solver](https://github.com/google/kctf/blob/v1.0/docker-images/challenge/pow.py).

## Go module

[![Go Reference](https://pkg.go.dev/badge/github.com/redpwn/pow.svg)](https://pkg.go.dev/github.com/redpwn/pow)

### Challenge example

```go
package main

import (
	"bufio"
	"fmt"
	"os"

	"github.com/redpwn/pow"
)

func main() {
	c := pow.GenerateChallenge(5000)
	fmt.Printf("proof of work: curl -sSfL https://pwn.red/pow | sh -s %s\nsolution: ", c)
	s, _ := bufio.NewReader(os.Stdin).ReadString('\n')
	if correct, err := c.Check(s); err == nil && correct {
		fmt.Println("correct")
	} else {
		fmt.Println("incorrect")
	}
}
```
