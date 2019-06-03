package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"math/rand"
	"os"
	"time"
)

const charset = "abcdefghijklmnopqrstuvwxyz" +
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()?><:"

var seededRand *rand.Rand = rand.New(
	rand.NewSource(time.Now().UnixNano()))

func StringWithCharset(length int, charset string) string {
	b := make([]byte, length)
	for i := range b {
		b[i] = charset[seededRand.Intn(len(charset))]
	}
	return string(b)
}

func String(length int) string {
	return StringWithCharset(length, charset)
}
func main() {
	for i := 1; i <=100; i++ {
		remainder7 := i % 7
		remainder5 := i % 5
		if (remainder7 == 0) || (remainder7 == 0 && remainder5 == 0) {

			for ii := 1; ii < i; ii++ {
				fname := fmt.Sprintf("%s%d%s", "file_", ii, ".txt")
				fname1 := fmt.Sprintf("%s%d%s", "file_", i, ".txt")
				file, _ := os.OpenFile(fname1, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
				data, _ := ioutil.ReadFile(fname)
				str := string(data)
				fmt.Fprintln(file, str)
				defer file.Close()
			}
		} else if remainder5 == 0 {
			fname := fmt.Sprintf("%s%d%s", "file_", i, ".txt")
			file, err := os.Create(fname)
			if err != nil {
				log.Fatal("Cannot create file", err)
			}
			fmt.Fprintf(file, "This is 5th file")
			defer file.Close()
		} else {
			fname := fmt.Sprintf("%s%d%s", "file_", i, ".txt")
			file, err := os.Create(fname)
			if err != nil {
				log.Fatal("Cannot create file", err)
			}
			fmt.Fprintf(file, StringWithCharset(rand.Intn(65), charset))
			defer file.Close()
		}

	}
}

