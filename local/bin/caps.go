package main

import (
    "fmt"
    "os"
    "os/exec"
)

func main() {
  
  // The first argument
  cmdArg := os.Args[1]
    
	switch cmdArg {
    case "test":
      exec.Command("ls","-la")
      fmt.Println("test")
    case "on":
      exec.Command("xmodmap", "-e", "'clear lock'")
      exec.Command("xmodmap", "-e", "'keycode 0x42 = Escape'")
      fmt.Println("Capslock is now escape")
    case "off":
      exec.Command("xmodmap", "-e", "'keycode 0x42 = Caps_Lock'")
      exec.Command("xmodmap", "-e", "'add lock = Caps_Lock'")
      fmt.Println("Capslock is now capslock")
    default:
      fmt.Println("Usage: ./caps.go on/off")
  }
}

