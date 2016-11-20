#!/usr/bin/awk -f
/A.*M.*N/ { state = "I"}
#/D.*t/ { state = "D"}
/ity/ { state = "L"}
/REMARKS/ { state = "R"}
state == "" { name = name " " $0}
state == "I" { id = id " " $0}
state == "D" { date = date " " $0}
state == "L" { locality = locality " " $0}
state == "R" { remarks = remarks " " $0}
END {
    if (name) {print "N: " name}
    else {print "NX "}
    if (id) {print "I: " id}
    else {print "IX "}
    if (date) {print "D: " date}
    else {print "DX "}
    if (locality) {print "L: " locality}
    else {print "LX "}
    if (remarks) {print "R: " remarks}
    else {print "RX "}
}
