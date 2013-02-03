# FIDIR: FIDO + DIR 
# part of the OPF webinar "Digital Preservation at your command part II"
# http://www.openplanetsfoundation.org/
# http://www.openplanetsfoundation.org/opf-webinars-recordings
# http://wiki.opf-labs.org/
# 
# to run this you'll need Python 2.7+ (won't yet work with Python 3+) and FIDO
# http://www.openplanetsfoundation.org/software/fido
# 
# This is an example how to combine command line utilities
# to create new functionality. Calling FIDO with a path
# is probably better, but this is more educational
# 
# set "python" to where ever Python lives at your place
# set "/path/to/fido.py" to where ever FIDO lives at your place
# or install FIDO and call it as a module: "python -m fido.fido"
FIDO_COMMAND="python /Users/maurice/fido/fido.py"
# remove "-maxdepth 1" to enable recursion through folders
find . -maxdepth 1 -type f -print0 | xargs -0 $FIDO_COMMAND -matchprintf "%(info.filename)s\t%(info.puid)s\t%(info.mimetype)s\t%(info.matchtype)s-match\n" -nomatchprintf "%(info.filename)s\tfmt/unknown\tmime/unknown\tfail-match\n" {} 2>/dev/null
