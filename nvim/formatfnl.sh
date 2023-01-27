for f in $(find ./fnl -name '*.fnl'); do fnlfmt --fix $f; done
