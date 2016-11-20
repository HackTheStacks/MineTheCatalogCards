#!/usr/bin/python
from sys import argv

print "\t".join([
    "File",
    "Name",
    "Locality",
    "Date",
    "Id",
    "Remarks",
    ])
    
for i in argv[1:]:
    File = i.replace('lines','jpg')
    with open(i, 'r') as f:
        Name = f.readline()[2:-1]
        Id = f.readline()[2:-1]
        Date = f.readline()[2:-1]
        Locality = f.readline()[2:-1]
        Remarks = f.readline()[2:-1]
        Excess = ""
        for line in f.readline().replace('\n',''):
            Excess += line
    print "\t".join([
        File,
        Name,
        Locality,
        Date,
        Id,
        Remarks,
        Excess,
        ])
