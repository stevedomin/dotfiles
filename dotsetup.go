package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
)

const Version string = "0.1"

var (
	silentAck              = flag.Bool("s", false, "Silently accept file removing confirmation")
	initialSrcPath  string = "src"
	initialDestPath string = filepath.Join(os.Getenv("HOME"))
)

func main() {
	flag.Parse()
	if flag.NArg() > 0 {
		initialSrcPath = flag.Arg(0)
	}
	if flag.NArg() > 1 {
		initialDestPath = flag.Arg(1)
	}

	err := setupDotfiles(initialSrcPath, initialDestPath)
	if err != nil {
		fmt.Println(err)
	}
}

func setupDotfiles(srcPath, destPath string) error {
	srcGlobPath := srcPath + "/*"

	matches, err := filepath.Glob(srcGlobPath)
	if err != nil {
		return err
	}

	if len(matches) == 0 && initialSrcPath == srcPath {
		fmt.Println("Source folder is empty or doesn't exist")
	}

	for _, match := range matches {
		base := filepath.Base(match)
		dotbase := strings.Replace(base, "dot.", ".", 1)
		dest := filepath.Join(destPath, dotbase)

		matchFileInfo, err := os.Stat(match)
		if err != nil {
			return err
		}

		if matchFileInfo.IsDir() {
			if fi, _ := os.Lstat(dest); fi == nil {
				fmt.Printf("Creating folder %s\n", dest)
				if err := os.MkdirAll(dest, 0700); err != nil {
					return err
				}
			}

			err := setupDotfiles(filepath.Join(srcPath, base), dest)
			if err != nil {
				return err
			}
		} else {
			if fi, _ := os.Lstat(dest); fi != nil {
				if !*silentAck {
					if ack := acknowledgeOverwrite(dest); ack != true {
						fmt.Println("Skipping '%s'", dest)
						continue
					}
				}

				// Remove file
				if err := os.Remove(dest); err != nil {
					return err
				}
			}

			fmt.Printf("Generating file '%s'\n", dest)

			destFile, err := os.Create(dest)
			if err != nil {
				return err
			}
			defer destFile.Close()

			b, err := ioutil.ReadFile(match)
			if err != nil {
				return err
			}

			destFile.Write(b)
		}
	}

	return nil
}

func acknowledgeOverwrite(file string) bool {
	var s string
	fmt.Printf("Overwrite file '%s' ? [y/N] ", file)
	fmt.Scanf("%s", &s)

	return strings.ToLower(s) == "y"
}
