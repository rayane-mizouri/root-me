#!/usr/bin/expect -f

spawn telnet challenge01.root-me.org 52002
expect "Escape character is '^]'."

expect {
  "Calculate the square root of" {
    expect -re {(\d+)}
    set num1 $expect_out(0,string)
    
    expect "multiply by"
    expect -re {(\d+)}
    set num2 $expect_out(0,string)
    
    set result [expr {sqrt($num1) * $num2}]
    set rounded_result [format "%.2f" $result]
    
    send "$rounded_result\r"
    interact
  }
}


#https://www.root-me.org/fr/Challenges/Programmation/TCP-Retour-au-college
