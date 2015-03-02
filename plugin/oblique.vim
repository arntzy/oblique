" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! GetObliqueStrat()
python << endOfPython

import vim, urllib2
import json

TIMEOUT = 20
URL = "http://brianeno.needsyourhelp.org/draw"

try:
    # Get the oblique strategy and parse the json response
    response = urllib2.urlopen(URL, None, TIMEOUT).read()
    json_response = json.loads(response)
    ob = "#" + str(json_response['strategy'])
    vcb = vim.current.buffer
    linenumber = vim.current.range.end
    vcb[linenumber:linenumber] = [ ob ]

except Exception, e:
    print e

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! Oblique call GetObliqueStrat()
