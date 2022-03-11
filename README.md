Command to compile resume

```
cd Modern
docker run -it --rm -v ${PWD}:/work temp:latex xelatex main.tex
```

You will find `main.pdf`