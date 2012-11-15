#!python
# simple script to generate a disk image
# filled with null bytes 

# filename of disk drive image
filename = "200mbtest.disk"
# size in MB
disksize = 200

# editing ends here

# magic starts here
with open(filename, "wb") as f:
    f.seek(((disksize * 1024) * 1024)-1)
    f.write("\0")
    f.close()
