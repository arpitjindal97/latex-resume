Command to compile resume

```
docker build -t temp:latex . -f Dockerfile
cd Modern
docker run -it --rm -v ${PWD}:/work temp:latex xelatex main.tex
```

You will find `main.pdf`
