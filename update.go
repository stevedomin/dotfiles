package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

var (
	DEST    = filepath.Join(os.Getenv("HOME"))
	EXCLUDE = []string{"README.md", "osx", ".git", "update.go"}
)

func main() {
	fmt.Println("Hello, 世界")

	matches, err := filepath.Glob("*")
	if err != nil {
		fmt.Println(err)
	}

	for _, filename := range matches {
		if existInArray(EXCLUDE, filename) == true {
			continue
		}

		dotfile := "." + filename
		dotfile = filepath.Join(DEST, dotfile)

		workingDirectory, _ := os.Getwd()
		source := filepath.Join(workingDirectory, filename)

		// Check if file exist in target directory
		if fileInfo, err := os.Lstat(dotfile); err == nil {

			// Check if existing symlink is same as source
			if fileInfo.Mode()&os.ModeSymlink != 0 {
				if dest, _ := os.Readlink(dotfile); dest == source {
					continue
				}
			}

			var s string
			fmt.Printf("Overwrite file '%s'? [y/N]", dotfile)
			fmt.Scanf("%s", &s)

			if strings.ToLower(s) != "y" {
				fmt.Println("Skipping '%s'", dotfile)
				continue
			}

			err = os.RemoveAll(dotfile)
			if err != nil {
				fmt.Println(err)
			}
		}

		err := os.Symlink(source, dotfile)
		if err != nil {
			fmt.Println(err)
		}
	}
}

func existInArray(array []string, value string) bool {
	for _, v := range array {
		if value == v {
			return true
		}
	}

	return false
}
